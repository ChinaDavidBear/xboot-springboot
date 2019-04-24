<template>
  <div class="search">
    <Row>
      <Col>
        <Card>
          <Tabs :animated="false" @on-click="changeTab">
            <TabPane label="消息列表" name="message">
            </TabPane>
          </Tabs>
          <Form ref="searchForm" :model="searchForm" inline :label-width="70" class="search-form">
            <Form-item label="搜索消息">
              <Input type="text" v-model="searchForm.title" clearable placeholder="请输入搜索关键词" style="width: 200px"/>
            </Form-item>
            <Form-item label="创建时间">
              <DatePicker type="daterange" v-model="selectDate" format="yyyy-MM-dd" clearable @on-change="selectDateRange" placeholder="选择起始时间" style="width: 200px"></DatePicker>
            </Form-item>
            <Form-item style="margin-left:-35px;" class="br">
              <Button @click="handleSearch"  type="primary" icon="ios-search">搜索</Button>
              <Button @click="handleReset" >重置</Button>
            </Form-item>
          </Form>
          <Row class="operation">
            <Button @click="add" type="primary" icon="md-add" v-has="'add'">发布消息</Button>
            <circleLoading v-if="operationLoading"/>
          </Row>
          <Row>
            <Alert show-icon>
              已选择 <span class="select-count">{{selectCount}}</span> 项
              <a class="select-clear" @click="clearSelectAll">清空</a>
            </Alert>
          </Row>
          <Row>
            <Table :loading="loading" border :columns="columns" :data="data" ref="table" sortable="custom" @on-sort-change="changeSort" @on-selection-change="changeSelect"></Table>
          </Row>
          <Row type="flex" justify="end" class="page">
            <Page :current="searchForm.pageNo" :total="total" :page-size="searchForm.pageSize" @on-change="changePage" @on-page-size-change="changePageSize" :page-size-opts="[10,20,50]" size="small" show-total show-elevator show-sizer></Page>
          </Row>
        </Card>
      </Col>
    </Row>
    <Modal :title="modalTitle" v-model="messageModalVisible" :mask-closable='false' :width="500" :styles="{top: '30px'}">
      <Form ref="messageForm" :model="messageForm" :label-width="70" :rules="messageValidate">
        <FormItem label="标题" prop="title">
          <Input v-model="messageForm.title" autocomplete="off"/>
        </FormItem>
        <FormItem label="内容" prop="content"  :error="errorPass">
          <Input  type="textarea" v-model="messageForm.context"  :autosize="{minRows: 7,maxRows: 7}"  autocomplete="off" />
        </FormItem>
      </Form>
      <div slot="footer">
        <Button type="error" @click="cancelUser">关闭</Button>
        <Button type="primary"  :loading="submitLoading" @click="submitUser">提交</Button>
      </div>
    </Modal>
    <Modal title="查看" v-model="messageViewVisible" :mask-closable='false' :width="500" :styles="{top: '30px'}">
      <Form ref="row" :model="row" :label-width="70" >
        <FormItem label="标题" prop="title" >
          <Input v-model="row.title" autocomplete="off" readonly/>
        </FormItem>
        <FormItem label="内容" prop="content"  :error="errorPass">
          <Input  type="textarea" v-model="row.context" readonly :autosize="{minRows: 7,maxRows: 7}"  autocomplete="off" />
        </FormItem>
      </Form>
      <div slot="footer">
        <Button type="error" @click="cancelUser">关闭</Button>
      </div>
    </Modal>
  </div>
</template>

<script>
import { getMessageListData, addMessage, editMessage } from "@/api/index";
import circleLoading from "../../my-components/circle-loading.vue";
export default {
  name: "message-manage",
  components: {
    circleLoading
  },
  data() {
    return {
      loading: true,
      operationLoading: false,
      messageModalVisible:false,
      messageViewVisible:false,
      submitLoading:false,
      errorPass: "",
      modalTitle:'',
      modalType:0,
      selectList: [],
      selectCount: 0,
      selectDate: null,
      searchForm: {
        title:'',
        pageNo: 1,
        pageSize: 10,
        startDate: "",
        endDate: "",
        sort: "createTime",
        order: "desc"
      },
      messageForm:{
        title:"",
        context:""
      },
      messageValidate: {
        title: [
          { required: true, message: "标题不能为空", trigger: "blur" }
        ],
        context: [
          { required: true, message: "内容不能为空", trigger: "blur" }
        ]
      },
      columns: [
        {
          type: "selection",
          width: 60,
          align: "center",
          fixed: "left"
        },
        {
          type: "index",
          width: 60,
          align: "center",
          fixed: "left"
        },
        {
          title: "消息标题",
          key: "title",
          width: 110,
          sortable: true,
          fixed: "left"
        },
        {
          title: "创建时间",
          key: "createTime",
          sortable: true,
          width: 150,
          sortType: "desc"
        },
        {
          title: "操作",
          key: "action",
          width: 200,
          align: "center",
          render: (h, params) => {
            return h("div", [
              h(
                "Button",
                {
                  props: {
                    type: "success",
                    size: "small"
                  },
                  on: {
                    click: () => {
                      this.detail(params.row);
                    }
                  }
                },
                "查看"
              ),
              h(
                "Button",
                {
                  props: {
                    type: "primary",
                    size: "small"
                  },
                  style: {
                    marginRight: "5px",
                    display:(!this.$route.meta.permTypes.includes('edit'))?"none":"inline-block",
                  },
                  on: {
                    click: () => {
                      this.update(params.row);
                    }
                  }
                },
                "编辑"
              )
            ]);
          }
        }
      ],
      data: [],
      total: 0,
      row:{}
    };
  },
  methods: {
    init() {
      this.getMessageList();
    },
    changeTab(v) {
      if (v == "login") {
        this.searchForm.logType = 1;
      } else if (v == "operation") {
        this.searchForm.logType = 0;
      }
      this.getLogList();
    },
    changePage(v) {
      this.searchForm.pageNo = v;
      this.getLogList();
      this.clearSelectAll();
    },
    changePageSize(v) {
      this.searchForm.pageSize = v;
      this.getLogList();
    },
    selectDateRange(v) {
      if (v) {
        this.searchForm.startDate = v[0];
        this.searchForm.endDate = v[1];
      }
    },
    handleSearch() {
      this.searchForm.pageNumber = 1;
      this.searchForm.pageSize = 10;
      this.getMessageList();
    },
    getMessageList() {
      this.loading = true;
      getMessageListData(this.searchForm).then(res => {
        this.loading = false;
        if (res.success) {
          this.data = res.result.list;
          this.total = res.result.total;
        }
      });
    },
    handleReset() {
      this.searchKey = "";
      this.selectDate = null;
      this.searchForm.startDate = "";
      this.searchForm.endDate = "";
      this.getMessageList();
    },
    add() {
      this.modalType = 0;
      this.modalTitle = "添加消息";
      this.messageForm.title="";
      this.messageForm.context="";
      this.messageModalVisible = true;
    },
    update(row){
      this.row =row;
      this.modalType = 1;
      this.modalTitle = "编辑消息";
      this.messageForm.title=row.title;
      this.messageForm.context=row.context;
      this.messageModalVisible = true;
    },
    detail(row){
      console.info(row);
      this.row=row;
      this.messageViewVisible = true;
    },
    cancelUser(){
      this.messageModalVisible = false;
      this.messageViewVisible = false;
      this.submitLoading = false;
    },
    submitUser() {
      this.$refs.messageForm.validate(valid => {
        if (valid) {
          if (this.modalType === 0) {
            // 添加用户 避免编辑后传入id
            delete this.messageForm.id;
            this.submitLoading = true;
            addMessage(JSON.stringify(this.messageForm)).then(res => {
              this.submitLoading = false;
              if (res.success === true) {
                this.$Message.success("操作成功");
                this.getMessageList();
                this.messageModalVisible = false;
              }
            });
          } else {
            // 编辑
            this.submitLoading = true;
            this.row.title = this.messageForm.title;
            this.row.context = this.messageForm.context;
            editMessage(JSON.stringify(this.row)).then(res => {
              this.submitLoading = false;
              if (res.success === true) {
                this.$Message.success("操作成功");
                this.getMessageList();
                this.messageModalVisible = false;
              }
            });
          }
        }
      });
    },
    remove(v) {
      this.$Modal.confirm({
        title: "确认删除",
        content: "您确认要删除该条数据?",
        onOk: () => {
          this.operationLoading = true;
          deleteLog(v.id).then(res => {
            this.operationLoading = false;
            if (res.success === true) {
              this.$Message.success("删除成功");
              this.init();
            }
          });
        }
      });
    },
    clearSelectAll() {
      this.$refs.table.selectAll(false);
    },
    changeSelect(e) {
      this.selectList = e;
      this.selectCount = e.length;
    },
    changeSort(e) {
      this.searchForm.sort = e.key;
      this.searchForm.order = e.order;
      if (e.order === "normal") {
        this.searchForm.order = "";
      }
      this.getLogList();
    },
    delAll() {
      if (this.selectCount <= 0) {
        this.$Message.warning("您还未选择要删除的数据");
        return;
      }
      this.$Modal.confirm({
        title: "确认删除",
        content: "您确认要删除所选的 " + this.selectCount + " 条数据?",
        onOk: () => {
          let ids = "";
          this.selectList.forEach(function(e) {
            ids += e.id + ",";
          });
          ids = ids.substring(0, ids.length - 1);
          this.operationLoading = true;
          deleteLog(ids).then(res => {
            this.operationLoading = false;
            if (res.success === true) {
              this.$Message.success("删除成功");
              this.clearSelectAll();
              this.init();
            }
          });
        }
      });
    },
    clearAll() {
      this.$Modal.confirm({
        title: "请谨慎进行此操作！",
        content: "您确认要彻底清空删除所有数据?",
        onOk: () => {
          this.loading = true;
          let ids = "";
          this.selectList.forEach(function(e) {
            ids += e.id + ",";
          });
          ids = ids.substring(0, ids.length - 1);
          deleteAllLog().then(res => {
            this.loading = false;
            if (res.success === true) {
              this.$Message.success("清空日志成功");
              this.clearSelectAll();
              this.init();
            }
          });
        }
      });
    }
  },
  mounted() {
    this.init();
  }
};
</script>
<style lang="less">
  .sorry{
    height: 500px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    .text{
      font-size: 20px;
      margin: 20px 0;
    }
  }
</style>
