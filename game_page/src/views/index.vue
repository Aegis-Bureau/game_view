<template>
  <div id="dj">
    <div class="one" v-if="this.$store.state.isLogined==0">
      <div class="left">
        <img src="/img/aa/portrait.png" />
        <a href="#/login">点击登录</a>
      </div>
      <div class="right">
        <a href="#/login">></a>
      </div>
    </div>
    <div class="one" v-else>
      <div class="left">
        <img :src="`/img/users/${this.$store.state.info.avatar}`" />
        <span>{{this.$store.state.info.nickname}}</span>
      </div>
      <div class="right">
        <mt-button @click="logout" size="small" plain class="zhux">注销</mt-button >
      </div>
    </div>
    <div class="lastone">
      <ul>
        <li v-for="c of counts" :key="c.id">
          <p>{{ c.count }}</p>
          <b>{{ c.pname }}</b>
        </li>
      </ul>
      <router-link to="">
        <img src="/img/aa/sign.png" />
      </router-link>
    </div>
    <div class="two">
      <div v-for="(i, c) of twoOfClass" :key="c">
        <img :src="`/img/aa/${i.pimage}`" />
        <p>{{ i.pname }}</p>
      </div>
    </div>
    <div class="three">
      <!-- 轮播图 -->
      <mt-swipe :auto="4000" class="swipe" :showIndicators="true">
        <mt-swipe-item v-for="(i, c) of swipes" :key="c"
          ><img :src="`/img/aa/${i}`"
        /></mt-swipe-item>
      </mt-swipe>
    </div>
    <hr />
    <div class="four">
      <p class="myP">创作中心</p>
      <div class="write">
        <div v-for="(i, c) of write" :key="c">
          <a :href="`#${i.href}`">
            <img :src="`/img/aa/${i.pimage}`" />
            <p>{{ i.pname }}</p>
          </a>
        </div>
      </div>
    </div>
    <div class="five">
      <p class="myP">常用功能</p>
      <div class="common">
        <div v-for="(item, index) in common" :key="index">
          <img :src="`/img/aa/${item.pimage}`" />
          <p>{{ item.pname }}</p>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
img {
  max-width: 100% !important;
}
#dj {
  width: 100% !important;
  font-size: 14px;
  font-weight: 600;
  min-height: 100vh;
  box-sizing: border-box;
}
#dj hr {
  height: 3px;
  background-color: #e8e8e8;
  border: 0px;
}
#dj > div {
  margin-top: 10px;
}
#dj > div:not(:first-child) {
  border-bottom: 3px solid #e8e8e8;
}
#dj .one {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  height: 80px;
}
#dj .one .left {
  font-size: 1.2rem;
}
#dj .one .left img {
  margin-left: 20px;
  width: 50px;
  height:50px;
  border-radius:50%;
}
#dj .one .left a ,#dj .one .left span{
  display: inline-block;
  flex: 0 0 60%;
  color: #000;
  margin-bottom: 14px;
  margin-left: 5px;
  overflow: hidden;
}

#dj .one .right {
  flex: 0 0 10%;
  margin-left: -100px;
}
#dj .one .right a {
  color: #e8e8e8;
  font-size: 30px;
}
#dj .lastone ul {
  display: flex;
  font-weight: 900;
  margin-left: 30px;
  margin-bottom: 20px;
}
#dj .lastone ul li {
  margin-right: 20px;
  margin-top: 10px;
  text-align: center;
  padding-right: 15px;
}
#dj .lastone ul li p {
  font-size: 20px;
  margin-bottom: 5px;
}
#dj .lastone ul li b {
  color: #666;
}
#dj .lastone a > img {
  position: absolute;
  right: 20px;
  width: 50px;
  top: 100px;
}
#dj .two {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  border-bottom: 0px !important;
}
#dj .two > div {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
#dj .two > div img {
  margin: 10px auto;
}
#dj .two > div p {
  margin-bottom: 10px;
}
#dj .three {
  height: 80px;
  margin: 0 10px;
  margin-top: 10px;
  border-radius: 3px;
  border-bottom: 0px !important;
}
#dj .three img {
  border-radius: 10px !important;
  height: 100%;
  width: 100%;
}
#dj .four p.myP {
  text-align: left;
  margin-left: 15px;
}
#dj .four .write {
  display: flex;
  text-align: center;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  margin-top: 20px;
  margin-bottom: 15px;
}
#dj .four .write p {
  margin-top: 10px;
  color: #000;
}
#dj .five {
  height: 240px;
}
#dj .five p.myP {
  text-align: left;
  margin-left: 15px;
}
#dj .zhux{
  display: block;
  width: 65px;
  right:10px;
  border-radius:10px;
  border-color:#ccc;
  color:#ccc;
  /* font-size:16px!important; */
}
#dj .five .common {
  display: flex;
  text-align: center;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
  margin-top: 20px;
}
#dj .five .common div {
  flex: 0 0 33.3333%;
  margin-top: 15px;
}
#dj .five .common div p {
  text-align: center;
  margin-top: 20px;
}
#dj .five .common div img {
  margin-top: 10px;
}
</style>

<script>
import {mapState,mapMutations} from 'vuex';
export default {
  computed:{
    ...mapState([['isLogined','info']]),
  },
  data() {
    return {
      twoOfClass: [
        { pname: "我的收藏", pimage: "collect.png" },
        { pname: "我的评论", pimage: "comment.png" },
        { pname: "我的点赞", pimage: "Like.png" },
        { pname: "浏览历史", pimage: "history.png" },
      ],
      write: [
        { pname: "作品管理", pimage: "manage.png", href: "/404" },
        { pname: "数据分析", pimage: "statistic.png", href: "/analyze" },
        { pname: "认证服务", pimage: "authentication.png", href: "/404" },
      ],
      common: [
        { pname: "钱包", pimage: "wallet.png" },
        { pname: "任务中心", pimage: "task.png" },
        { pname: "游戏中心", pimage: "game.png" },
        { pname: "邀请好友", pimage: "invitation.png" },
        { pname: "练习客服", pimage: "service.png" },
        { pname: "设置", pimage: "setting.png" },
      ],
      counts: [
        { count: 0, pname: "动态" },
        { count: 0, pname: "关注" },
        { count: 0, pname: "粉丝" },
      ],
      swipes: ["lb1.jpg", "lb2.jpg", "lb3.jpg"], //轮播图
    };
  },
  methods:{
    // 注销
    logout(){
      this.$store.commit('logoutMutation');
    }
  }
};
</script>