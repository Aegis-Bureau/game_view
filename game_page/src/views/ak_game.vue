<template>
  <div id="game">
    <!-- 顶部 -->
    <div class="game_top">
      <ly-tab v-model="selectedId" :items="items"></ly-tab>
      <!-- 弹出层 -->
      <div class="more" @click="mtPop"><img src="/img/ak_game/more.png" /></div>
      <mt-popup
        class="more_items"
        v-model="popupVisible"
        visible="popvis"
        position="top"
      >
        <div v-for="(items, i) of items" :key="i">
          <div class="items_img" v-if="items.img">
            <img @click="selectChange(i)" :src="`/img/ak_game/${items.img}`" />
            <p class="font_small">{{ items.label }}</p>
          </div>
        </div>
      </mt-popup>
    </div>
    <!-- 面板 -->
    <div class="min">
      <div v-if="selectedId == 0" class="live">
        <div v-for="(Live, i) of live" :key="i">
          <a href="http://www.baidu.com"
            ><img :src="`/img/ak_game/all/${Live.img}`"
          /></a>
          <p class="font_small">
            {{ Live.title }}
            <mt-badge
              class="font_small"
              v-if="Live.begin == 1"
              size="small"
              type="error"
              >直播中</mt-badge
            >
            <mt-badge v-else class="badge" size="small" type>回放</mt-badge>
          </p>
        </div>
      </div>
      <div v-if="allGame.length !== 0">
        <div v-for="(all, i) of allGame" :key="i">
          <div class="time header">
            <header class="time">
              {{
                moment
                  .unix(all.times)
                  .format(
                    `Y年MM月DD日 周${Week[moment.unix(all.times).format("d")]}`
                  )
              }}
              <span
                v-if="
                  moment.unix(all.times).format(`Y年MM月DD日`) ==
                  moment.unix(UniX).format(`Y年MM月DD日`)
                "
              >
                今天</span
              >
            </header>
          </div>
          <div v-for="(v, i) of all.games" :key="i">
            <div class="page">
              <p class="title">{{ v.sort }}</p>
              <ul>
                <li>
                  <img v-if="v.img_1" :src="`/img/ak_game/${v.img_1}`" />
                  <p>{{ v.name_1 }}</p>
                </li>
                <li v-if="v.result">
                  <p>{{ v.title }}</p>
                  <p>{{ v.result }}</p>
                  <mt-button>已结束</mt-button>
                </li>
                <li v-else>
                  <p>{{ v.title }}</p>
                  <p>{{ moment.unix(v.time).format(`MM-DD HH:mm`) }}</p>
                  <mt-button @click="Toast" type="primary">订阅</mt-button>
                </li>
                <li>
                  <img v-if="v.img_2" :src="`/img/ak_game/${v.img_2}`" />
                  <p>{{ v.name_2 }}</p>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div v-else>
        <img style="width:100%;" src="/img/ak_game/all/00.jpg">
        <img style="margin-top:20px;width:100%;" src="/img/ak_game/all/01.png">
      </div>
    </div>
  </div>
</template>
 
<script>
export default {
  data() {
    return {
      popupVisible: false,
      Week: ["日", "一", "二", "三", "四", "五", "六"],
      selectedId: 0,
      UniX: 1607817600, //2020年12月13日
      items: [],
      live: [],
      allGame: [],
      options: {
        activeColor: "red",
      },
    };
  },
  methods: {
    mtPop() {
      this.popupVisible = true;
    },
    selectChange(i) {
      this.selectedId = i;
      this.popupVisible = false;
    },
    Toast() {
      this.$toast({
        message: "订阅成功！",
        position: "middle",
        duration: 1500,
      });
    },
    loadDate(id) {
      // 打开加载提示框
      this.$indicator.open({
        text: "加载中...",
        spinnerType: "double-bounce",
      });
      this.axios.get(`/ak/report?id=${id}`).then((res) => {
        this.allGame = res.data.sss;
        // 关闭加载提示框
        this.$indicator.close();
      });
    },
  },
  watch: {
    selectedId() {
      this.allGame = [];
      this.loadDate(this.selectedId);
    },
  },
  mounted() {
    //  吸附
    let header = document.getElementsByClassName("header");
    window.onscroll = function () {
      header.forEach((item) => {
        if (item.getBoundingClientRect().top <= 45) {
          item.firstChild.classList.add("active");
        } else {
          item.firstChild.classList.remove("active");
        }
      });
    };

    this.axios.get("/ak/game").then((res) => {
      this.live = res.data.result;

      this.items.push({ label: "全部" });
      let items = res.data.items;
      items.forEach((item) => {
        this.items.push(item);
      });
      this.items.push({ label: "" });
    });

    this.loadDate(this.selectedId);
  },
};
</script>

<style>
#game .game_top {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 66;
  height: 45px;
  background-color: #fff;
}
#game .more {
  float: right;
  position: relative;
  top: -38px;
  right: -1;
}
#game .more_items {
  width: 100%;
  opacity: 0.96;
}
#game .font_small {
  font-size: 2px;
}
#game .more_items .items_img {
  margin: 10px 0;
  text-align: center;
  width: 25%;
  float: left;
}
#game .more_items img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}
#game .more_items div p {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
#game .min {
  margin: 55px 0;
}
#game .live {
  height: 120px;
  overflow-y: hidden;
  overflow: scroll;
  white-space: nowrap;
}
::-webkit-scrollbar {
  display: none;
}
#game .live div {
  width: 190px;
  height: 120px;
  display: inline-table;
  text-align: center;
  margin-left: 10px;
}
#game .live img {
  width: 100%;
  height: 90px;
  border-radius: 8px;
}
#game .mint-badge {
  padding: 1px 5px 4px 5px;
  margin-left: 8px;
}
#game .badge {
  border: solid 1px #f00;
  color: #f00;
}
#game .time {
  text-align: center;
  height: 30px;
  width: 100%;
  font-size: 14px;
  line-height: 30px;
  background-color: #ececec;
}
/* 吸附 */
#game header.active {
  position: fixed;
  top: 40px;
  z-index: 50;
}
#game .page {
  text-align: center;
  margin: 20px;
  height: 130px;
  border-bottom: 1px solid #eee;
}
#game .title {
  color: #ccc;
}
#game .page img {
  width: 50px;
  height: 50px;
}
#game .page ul {
  display: flex;
  justify-content: space-around;
}
#game .page ul > li:nth-child(2) {
  line-height: 30px;
  margin-top: 10px;
}
#game .mint-button {
  width: 100px;
  height: 25px;
  border-radius: 20px;
}
</style>