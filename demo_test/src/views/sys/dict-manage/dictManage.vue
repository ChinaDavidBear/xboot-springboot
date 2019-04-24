<style lang="less">
@import "./dictManage.less";
</style>
<template>
  <div class="search">
    <Card>
      <Row type="flex" justify="space-between" class="code-row-bg">
        <Col :span="span">
          <Row>
            <Form ref="searchForm" :model="searchForm" inline :label-width="60" class="search-form">
              <Form-item label="数据名称" prop="title">
                <Input type="text" v-model="searchForm.label" placeholder="请输入" clearable style="width: 200px"/>
              </Form-item>
              <Form-item label="状态">
                <Select v-model="searchForm.status" placeholder="请选择" clearable style="width: 200px">
                  <Option value="0">正常</Option>
                  <Option value="-1">禁用</Option>
                </Select>
              </Form-item>
              <Form-item label="字典类型">
                <Select v-model="searchForm.type" placeholder="请选择" clearable style="width: 200px">
                  <Option v-for="item in dictList" :key="item.id" :value="item.type">{{item.type}}</Option>
                </Select>
              </Form-item>
              <Form-item style="margin-left:-35px;" class="br">
                <Button @click="handleSearch" type="primary" icon="ios-search">搜索</Button>
                <Button @click="handleReset" >重置</Button>
              </Form-item>
            </Form>
          </Row>
          <Row class="operation">
            <Button @click="add" type="primary" icon="md-add" v-has="'add'">添加数据</Button>
            <Button @click="delAll" icon="md-trash">批量删除</Button>
            <Button @click="getDataList" icon="md-refresh">刷新数据</Button>
            <circleLoading v-if="operationLoading"/>
          </Row>
          <Row>
            <Alert show-icon>
              已选择 <span class="select-count">{{selectCount}}</span> 项
              <a class="select-clear" @click="clearSelectAll">清空</a>
            </Alert>
          </Row>
          <Row>
            <Table :loading="loading" border :columns="columns" :data="data" sortable="custom" @on-sort-change="changeSort" @on-selection-change="showSelect" ref="table"></Table>
          </Row>
          <Row type="flex" justify="end" class="page">
            <Page :current="searchForm.pageNo" :total="total" :page-size="searchForm.pageSize" @on-change="changePage" @on-page-size-change="changePageSize" :page-size-opts="[10,20,50]" size="small" show-total show-elevator show-sizer></Page>
          </Row>
        </Col>
      </Row>
    </Card>
    <Modal :title="modalTitle" v-model="modalVisible" :mask-closable='false' :width="500" :styles="{top: '30px'}">
      <Form ref="form" :model="form" :label-width="70" :rules="formValidate">
        <FormItem label="数据值" prop="value">
          <Input v-model="form.value"/>
        </FormItem>
        <FormItem label="标签名" prop="label">
          <Input v-model="form.label"/>
        </FormItem>
        <FormItem label="字典类型" prop="type">
          <Input v-model="form.type"/>
        </FormItem>
        <FormItem label="上级类型">
          <i-select v-model="type"  placeholder="请选择上级类型" @on-change="changeDict">
            <i-option v-for="item in dictList"  :value="item.type" :key="item.id">{{ item.type }}</i-option>
          </i-select>
        </FormItem>
        <FormItem label="上级分类">
          <i-select v-model="form.parentId"  placeholder="请选择上级分类">
            <i-option v-for="item in dataList" :value="item.id" :key="item.id">{{ item.label }}</i-option>
          </i-select>
        </FormItem>
        <FormItem label="备注" prop="description">
          <Input v-model="form.description"/>
        </FormItem>
        <FormItem label="排序值" prop="sortOrder">
          <InputNumber :max="1000" :min="0" v-model="form.sortOrder"></InputNumber>
          <span style="margin-left:5px">值越小越靠前，支持小数</span>
        </FormItem>
        <FormItem label="是否启用" prop="status">
          <i-switch size="large" v-model="form.status" :true-value="0" :false-value="-1">
            <span slot="open">启用</span>
            <span slot="close">禁用</span>
          </i-switch>
        </FormItem>
      </Form>
      <div slot="footer">
        <Button type="text" @click="modalVisible=false">取消</Button>
        <Button type="primary" :loading="submitLoading" @click="handelSubmit">提交</Button>
      </div>
    </Modal>
  </div>
</template>

<script>
import {
  findDictList,
  addDict,
  findDictByType,
  editDict,
  deleteDict,
  enableDict
} from "@/api/index";
import circleLoading from "../../my-components/circle-loading.vue";
export default {
  name: "dic-manage",
  components: {
    circleLoading
  },
  data() {
    return {
      loading: false, // 表格加载状态
      span: 20,
      operationLoading: false, // 操作加载状态
      selectCount: 0, // 多选计数
      selectList: [], // 多选数据
      type:'',
      searchForm: {
        // 搜索框对应data对象
        label: "",
        type:'',
        status: "",
        pageNo: 1, // 当前页数
        pageSize: 10, // 页面大小
        sort: "sortOrder", // 默认排序字段
        order: "asc" // 默认排序方式
      },
      dictList:[],
      dataList:[],
      modalType: 0, // 添加或编辑标识
      modalVisible: false, // 添加或编辑显示
      modalTitle: "", // 添加或编辑标题
      form: {
        type:'',
        value:'',
        label:'',
        parentId:'',
        status: 0,
        description: "",
        sortOrder: 0
      },
      formValidate: {
        // 表单验证规则
        label: [{ required: true, message: "请输入标签名", trigger: "blur" }],
        value: [{ required: true, message: "请输入数据值", trigger: "blur" }],
        type: [{ required: true, message: "请输入字典类型", trigger: "blur" }]
      },
      columns: [
        // 表头
        {
          type: "selection",
          width: 60,
          align: "center"
        },
        {
          type: "index",
          width: 60,
          align: "center"
        },
        {
          title: "数据值",
          key: "value",
          width: 150,
          align:'center',
          sortable: true
        },
        {
          title: "标签名",
          key: "label",
          width: 150,
          align:'center',
          sortable: true
        },
        {
          title: "字典类型",
          key: "type",
          width: 150,
          align:'center',
          sortable: true
        },
        {
          title: "备注",
          key: "description",
          width: 150,
          align:'center',
          sortable: true
        },
        {
          title: "排序值",
          key: "sortOrder",
          width: 100,
          align:'center',
          sortable: true,
          sortType: "asc"
        },
        {
          title: "状态",
          key: "status",
          align: "center",
          width: 130,
          render: (h, params) => {
            let re = "";
            if (params.row.status === 0) {
              return h("div", [
                h(
                  "Tag",
                  {
                    props: {
                      color: "green"
                    }
                  },
                  "正常启用"
                )
              ]);
            } else if (params.row.status === -1) {
              return h("div", [
                h(
                  "Tag",
                  {
                    props: {
                      color: "red"
                    }
                  },
                  "禁用"
                )
              ]);
            }
          }
        },
        {
          title: "创建时间",
          key: "createTime",
          width: 200,
          align:'center',
          sortable: true
        },
        {
          title: "操作",
          key: "action",
          width: 220,
          align: "center",
          render: (h, params) => {
            let button;
            if(params.row.status==0){
              button= h(
                "Button",
                {
                  props: {
                    size: "small"
                  },
                  style: {
                    marginRight: "5px"
                  },
                  on: {
                    click: () => {
                      this.enable(params.row);
                    }
                  }
                },
                "禁用"
              )
            }else{
              button = h(
                "Button",
                {
                  props: {
                    type: "success",
                    size: "small"
                  },
                  style: {
                    marginRight: "5px"
                  },
                  on: {
                    click: () => {
                      this.enable(params.row);
                    }
                  }
                },
                "启用"
              );
            }
            return h("div", [
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
                      this.edit(params.row);
                    }
                  }
                },
                "编辑"
              ),
              button,
              h(
                "Button",
                {
                  props: {
                    type: "error",
                    size: "small"
                  },
                  style:{
                    display:(!this.$route.meta.permTypes.includes('delete'))?"none":"inline-block",
                  },
                  on: {
                    click: () => {
                      this.delete(params.row);
                    }
                  }
                },
                "删除"
              )
            ]);
          }
        }
      ],
      submitLoading: false, // 添加或编辑提交状态
      data: [], //表单数据
      total: 0 // 表单数据总数
    };
  },
  methods: {
    init() {
      // 获取表单数据
      this.getDataList();
    },
    changeDict(){
      this.form.parentId=""
      findDictByType({type:this.type}).then(res=>{
        if(res.success){
          this.dataList=res.result;
        }
      })
    },
    changeSelect(v) {
      this.selectCount = v.length;
      this.selectList = v;
    },
    changePage(v) {
      this.searchForm.pageNumber = v;
      this.getDataList();
      this.clearSelectAll();
    },
    changePageSize(v) {
      this.searchForm.pageSize = v;
      this.getDataList();
    },
    getDataList() {
      this.loading = true;
      findDictList(this.searchForm).then(res => {
        this.loading = false;
        if (res.success === true) {
          this.data = res.result.page.list;
          this.total = res.result.page.total;
          this.dictList=res.result.dictList
        }
      });
    },
    handleSearch() {
      this.searchForm.pageNo= 1;
      this.searchForm.pageSize = 10;
      this.getDataList();
    },
    handleReset() {
      this.$refs.searchForm.resetFields();
      this.searchForm.pageNo = 1;
      this.searchForm.pageSize = 10;
      // 重新加载数据
      this.getDataList();
    },
    enable(param){
      enableDict({id:param.id,status:param.status}).then(res=>{
        if(res.success){
          this.$Message.success("操作成功");
          this.getDataList();
        }
      })
    },
    changeSort(e) {
      this.searchForm.sort = e.key;
      this.searchForm.order = e.order;
      if (e.order === "normal") {
        this.searchForm.order = "";
      }
      this.getDataList();
    },
    showSelect(e) {
      this.selectList = e;
      this.selectCount = e.length;
    },
    clearSelectAll() {
      this.$refs.table.selectAll(false);
    },
    add() {
      this.modalType = 0;
      this.modalTitle = "添加字典数据";
      this.$refs.form.resetFields();
      this.modalVisible = true;
    },
    edit(v) {
      this.modalType = 1;
      this.modalTitle = "编辑字典数据";
      this.$refs.form.resetFields();
      let str = JSON.stringify(v);
      let data = JSON.parse(str);
      this.form = data;
      this.modalVisible = true;
    },
    handelSubmit() {
      this.$refs.form.validate(valid => {
        if (valid) {
          this.submitLoading = true;
          if (this.modalType === 0) {
            addDict(JSON.stringify(this.form)).then(res => {
              this.submitLoading = false;
              if (res.success === true) {
                this.$Message.success("操作成功");
                this.getDataList();
                this.modalVisible = false;
              }
            });
          } else if (this.modalType === 1) {
            // 编辑
            editDict(this.form).then(res => {
              this.submitLoading = false;
              if (res.success === true) {
                this.$Message.success("操作成功");
                this.getDataList();
                this.modalVisible = false;
              }
            });
          }
        }
      });
    },
    delete(v) {
      this.$Modal.confirm({
        title: "确认删除",
        content: "您确认要删除字典" + v.label + " ?",
        onOk: () => {
          // 删除
          this.operationLoading = true;
          deleteDict(v.id).then(res => {
            this.operationLoading = false;
            if (res.success === true) {
              this.$Message.success("操作成功");
              this.getDataList();
            }
          });
        }
      });
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
          // 批量删除
          this.operationLoading = true;
          deleteDict(ids).then(res => {
            this.operationLoading = false;
            if (res.success === true) {
              this.$Message.success("操作成功");
              this.clearSelectAll();
              this.getDataList();
            }
          });
        }
      });
    }
  },
  mounted() {
    this.init();
    let data=this.$route;
    console.log(data)
  }
};
</script>
