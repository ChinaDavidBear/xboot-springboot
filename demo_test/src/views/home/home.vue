<style lang="less">
@import "./home.less";
@import "../../styles/common.less";
</style>

<template>
    <div class="home-main">
        <Row :gutter="10">
            <Col :md="24" :lg="8">
            <Row class-name="home-page-row1" :gutter="10">
                <Col :md="12" :lg="24" :style="{marginBottom: '10px'}">
                <Card>
                    <Row type="flex" class="user-infor">
                        <Col span="8">
                        <Row class-name="made-child-con-middle" type="flex" align="middle">
                            <img class="avator-img" :src="avatarPath" />
                        </Row>
                        </Col>
                        <Col span="16" style="padding-left:6px;">
                        <Row class-name="made-child-con-middle" type="flex" align="middle">
                            <div>
                                <b class="card-user-infor-name">{{ username }}</b>
                                <p>欢迎您的使用</p>
                            </div>
                        </Row>
                        </Col>
                    </Row>
                    <div class="line-gray"></div>
                </Card>
                </Col>
            </Row>
            </Col>
        </Row>
    </div>
</template>

<script>
import { ipInfo } from "@/api/index";
import cityData from "./map-data/get-city-value.js";
import homeMap from "./components/map.vue";
import visiteVolume from "./components/visiteVolume.vue";
import userFlow from "./components/userFlow.vue";
import countUp from "./components/countUp.vue";
import inforCard from "./components/inforCard.vue";
import mapDataTable from "./components/mapDataTable.vue";
import Cookies from "js-cookie";
import "gitalk/dist/gitalk.css";
import Gitalk from "gitalk";

export default {
  name: "home",
  components: {
    homeMap,
    visiteVolume,
    userFlow,
    countUp,
    inforCard,
    mapDataTable
  },
  data() {
    return {
      count: {
        createUser: 496,
        visit: 3264,
        collection: 24389305,
        transfer: 39503498
      },
      cityData: cityData,
      newToDoItemValue: "",
      city: "",
      weather: "",
      username: ""
    };
  },
  computed: {
    avatarPath() {
      return localStorage.avatorImgPath;
    }
  },
  methods: {
    init() {
      let userInfo = JSON.parse(localStorage.getItem("userInfo"));
      this.username = userInfo.username;
      ipInfo().then(res => {
        if (res.success === true) {
          let ipInfo = JSON.parse(res.result);
          if (ipInfo.retCode === "200") {
            let info = ipInfo.result[0];
            let weather =
              info.weather +
              " " +
              info.temperature +
              " 污染指数: " +
              info.pollutionIndex;
            this.city = info.city;
            this.weather = weather;
          } else {
            this.city = "未知";
            this.weather = "未知";
          }
        }
      });
    }
  },
  mounted() {
    this.init();
    // var gitalk = new Gitalk({
    //   clientID: "a128de2dd7383614273a",
    //   clientSecret: "a77691ecb662a8303a6c686ae651ae035868da6e",
    //   repo: "xboot-comments",
    //   owner: "Exrick",
    //   admin: [
    //     "Exrick"
    //   ],
    //   distractionFreeMode: false // 遮罩效果
    // });
    // gitalk.render("comments");
  }
};
</script>
