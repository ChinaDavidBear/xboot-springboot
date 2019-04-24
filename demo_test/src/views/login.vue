<template>
  <Row type="flex" justify="center" align="middle" class="login" @keydown.enter.native="submitLogin">
    <Col :xs="{span:22}" style="width: 368px;">
      <Row class="header">
        <!--<img src="../../static/images/xboot.png" width="220px" />-->
        <div class="description">人事管理平台</div>
      </Row>

      <Alert type="error" show-icon v-if="error">{{errorMsg}}</Alert>

      <Row class="login-form">
        <Tabs v-model="tabName">
          <TabPane label="账户密码登录" name="username" icon="md-person">
            <Form ref="usernameLoginForm" :model="form" :rules="rules" class="form">
              <FormItem prop="username">
                <Input v-model="form.username" prefix="ios-contact" size="large" clearable placeholder="请输入用户名" autocomplete="off" />
              </FormItem>
              <FormItem prop="password">
                <Input type="password" v-model="form.password" prefix="ios-lock" size="large" clearable placeholder="请输入密码" autocomplete="off" />
              </FormItem>
              <FormItem prop="verify">
                <Row type="flex" justify="space-between" class="code-row-bg" style="align-items: center;overflow: hidden;">
                  <Input v-model="form.verify" size="large" clearable placeholder="请输入验证码" :maxlength="10" class="input-verify" />
                  <div style="position:relative">
                    <Spin v-if="loadingCode" fix></Spin>
                    <img :src="verifyCodeImg"  @click="getVerifyCode" alt="加载验证码失败" style="width:100px;cursor:pointer;display:block">
                  </div>

                </Row>
              </FormItem>
            </Form>
          </TabPane>
          <!--<TabPane label="手机号登录" name="mobile" icon="ios-phone-portrait">-->
            <!--<Form ref="mobileLoginForm" :model="form" :rules="rules" class="form">-->
              <!--<FormItem prop="mobile">-->
                <!--<Input v-model="form.mobile" prefix="ios-phone-portrait" size="large" clearable placeholder="请输入手机号" />-->
              <!--</FormItem>-->
              <!--<FormItem prop="code" :error="errorCode">-->
                <!--<Row type="flex" justify="space-between" class="code-row-bg">-->
                  <!--<Input v-model="form.code" prefix="ios-mail-outline" size="large" clearable placeholder="请输入短信验证码" :maxlength="maxLength" class="input-verify" />-->
                  <!--<Button size="large" :loading="sending" @click="sendVerify" v-if="!sended" class="send-verify">-->
                    <!--<span v-if="!sending">获取验证码</span>-->
                    <!--<span v-else>发送中</span>-->
                  <!--</Button>-->
                  <!--<Button size="large" disabled v-if="sended" class="count-verify">{{countButton}}</Button>-->
                <!--</Row>-->
              <!--</FormItem>-->
            <!--</Form>-->
          <!--</TabPane>-->
        </Tabs>

        <Row type="flex" justify="space-between" class="code-row-bg">
          <!--<Checkbox v-model="saveLogin" size="large">自动登录</Checkbox>-->
          <Dropdown trigger="click">
            <!--<a class="forget-pass">-->
              <!--忘记密码-->
            <!--</a>-->
            <!--<DropdownMenu slot="list">-->
              <!--<DropdownItem name="resetByMobile">使用手机号重置密码</DropdownItem>-->
              <!--<DropdownItem name="resetByEmail">使用邮箱重置密码</DropdownItem>-->
            <!--</DropdownMenu>-->
          </Dropdown>
        </Row>
        <Row>
          <Button class="login-btn" type="primary" size="large" :loading="loading" @click="submitLogin" long>
            <span v-if="!loading">登录</span>
            <span v-else>登录中...</span>
          </Button>
        </Row>
        <!--<Row type="flex" justify="space-between" class="code-row-bg other-login">-->
          <!--<div class="other-way icons">-->
            <!--其它方式登录-->
            <!--<div class="other-icon">-->
              <!--<icon scale="1.1" name="brands/github"></icon>-->
            <!--</div>-->
            <!--<div class="other-icon">-->
              <!--<icon name="brands/qq"></icon>-->
            <!--</div>-->
            <!--<div class="other-icon">-->
              <!--<icon scale="1.2" name="brands/weibo"></icon>-->
            <!--</div>-->
            <!--<div class="other-icon">-->
              <!--<icon scale="1.2" name="brands/weixin"></icon>-->
            <!--</div>-->
          <!--</div>-->
          <!--&lt;!&ndash;<router-link to="/regist"><a class="forget-pass">注册账户</a></router-link>&ndash;&gt;-->
        <!--</Row>-->
      </Row>
    </Col>
  </Row>
</template>

<script>
  import Cookies from "js-cookie";
  import {
    login,
    userInfo,
    initCaptcha, drawCodeImage
  } from "../api/index";
  import util from "@/libs/util.js";
  export default {
    data() {
      const validateMobile = (rule, value, callback) => {
        var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!reg.test(value)) {
          callback(new Error("手机号格式错误"));
        } else {
          callback();
        }
      };
      return {
        error: false,
        errorMsg: "",
        tabName: "username",
        captchaId:'',
        verifyCodeImg:"",
        saveLogin: true,
        loading: false,
        sending: false,
        sended: false,
        count: 60,
        countButton: "60 s",
        loadingCode: true,
        maxLength: 6,
        errorCode: "",
        form: {
          username: "",
          password: "",
          mobile: "",
          code: "",
          verify: ""
        },
        rules: {
          username: [
            {
              required: true,
              message: "账号不能为空",
              trigger: "blur"
            }
          ],
          password: [
            {
              required: true,
              message: "密码不能为空",
              trigger: "blur"
            }
          ],
          mobile: [
            {
              required: true,
              message: "手机号不能为空",
              trigger: "blur"
            },
            {
              validator: validateMobile,
              trigger: "blur"
            }
          ]
        }
      };
    },
    methods: {
      showErrorMsg(msg) {
        this.error = true;
        this.errorMsg = msg;
      },
      sendVerify() {
        this.$refs.mobileLoginForm.validate(valid => {
          if (valid) {
            this.showErrorMsg("没做")
          }
        });
      },
      countDown() {
        let that = this;
        if (this.count === 0) {
          this.sended = false;
          this.count = 60;
          return;
        } else {
          this.countButton = this.count + " s";
          this.count--;
        }
        setTimeout(function() {
          that.countDown();
        }, 1000);
      },
      submitLogin() {
        if (this.tabName === "username") {
          this.$refs.usernameLoginForm.validate(valid => {
            if (valid) {
              this.loading = true;
              login({
                username: this.form.username,
                password: this.form.password,
                saveLogin: this.saveLogin,
                captchaId:this.captchaId,
                verify:this.form.verify,
              }).then(res => {
                if (res.success === true) {
                  this.setStore("accessToken", res.result);
                  // 获取用户信息
                  userInfo().then(res => {
                    if (res.success === true) {
                      console.log(res.result)
                      delete res.result.menuList;
                      if (this.saveLogin) {
                        // 保存7天
                        Cookies.set("userInfo", JSON.stringify(res.result), {
                          expires: 7
                        });
                      } else {
                        Cookies.set("userInfo", JSON.stringify(res.result));
                      }
                      this.setStore("userInfo", res.result);
                      this.$store.commit("setAvatarPath", res.result.avatar);
                      // 加载菜单
                      util.initRouter(this);
                      this.$router.push({
                        name: "home_index"
                      });
                    } else {
                      this.loading = false;
                    }
                  });
                } else {
                  this.loading = false;
                }
              });
            }
          });
        } else if (this.tabName === "mobile") {
          this.$refs.mobileLoginForm.validate(valid => {
            if (valid) {
              if (this.form.code === "") {
                this.errorCode = "验证码不能为空";
                return;
              } else {
                this.errorCode = "";
              }
              this.showErrorMsg("没做")
            }
          });
        }
      },
      getVerifyCode() {
        this.loadingCode = true;
        initCaptcha().then(res => {
          if (res.success === true) {
            this.captchaId = res.result.captchaId;
            this.verifyCodeImg = drawCodeImage + this.captchaId;
            this.loadingCode = false;
          }
        });
      },
      relatedLogin() {

      },
    },
    mounted() {
      this.relatedLogin();
      this.getVerifyCode()
    }
  };
</script>

<style lang="less">
  @import "./login.less";
</style>
