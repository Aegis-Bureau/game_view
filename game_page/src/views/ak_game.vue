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
      <div v-for="(all, i) of allGame" :key="i">
        <div class=" time header">
          <header class="time">
            {{
              moment
                .unix(all.time)
                .format(
                  `Y年MM月DD日 周${Week[moment.unix(all.time).format("d")]}`
                )
            }}
            <span
              v-if="
                moment.unix(all.time).format(`Y年MM月DD日`) ==
                moment.unix(UniX).format(`Y年MM月DD日`)
              "
            >
              今天</span
            >
          </header>
        </div>
        <div v-for="(allgames, i) of all.games" :key="i">
          <div v-for="(v, i) of allgames.game" :key="i">
            <div class="page">
              <p class="title">{{ allgames.sort }}</p>
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
      // toastInstanse: null,
      UniX: 1607817600,
      ////////////////////////////////////////
      items: [
        { label: "全部" },
        {
          label: "EPIC联赛",
          img: "EPIC.jpg",
        },
        {
          label: "2020德玛西亚杯",
          img: "2020dmxy.jpg",
        },
        {
          label: "2020和平精英全球总决赛",
          img: "hpjy.jpg",
        },
        { label: "NEST2020", img: "NEST.jpg" },
        { label: "2020LPL夏季赛", img: "LPL.jpg" },
        { label: "2020KPL秋季赛", img: "KPL.jpg" },
        { label: "2020PELS3", img: "PEL.jpg" },
        { label: "2020PCL秋季赛", img: "PCL.jpg" },
        { label: "英雄联盟S10", img: "dmxy.jpg" },
        { label: "2020LCS夏季赛", img: "LCS.jpg" },
        { label: "ESLONE", img: "ESLONE.jpg" },
        { label: "2020LEC春季赛", img: "LEC.jpg" },
        { label: "2020PEL", img: "2020PEL.jpg" },
        { label: "" },
      ],
      live: [
        { img: "2020gwsc.jpg", title: "2020和平精英全球总决赛", begin: 1 },
        { img: "dota2epic.jpg", title: "DOTA2 EPIC联赛", begin: 1 },
        { img: "KPL65456.jpg", title: "2020KPL秋季赛", begin: 1 },
        { img: "180697389.jpg", title: "英雄联盟S10全球总决赛", begin: 0 },
        { img: "2020PCL.jpg", title: "2020PCL", begin: 0 },
        { img: "2020lck.jpg", title: "2020LCK春季赛", begin: 0 },
        { img: "KPL65456.jpg", title: "2020KPL春季赛", begin: 0 },
        { img: "2020LOL.jpg", title: "2020LOL季中杯", begin: 0 },
      ],
      ///////////////////////////////////////
      allGame: [
        {
          time: "1607817600",
          games: [
            {
              sort: "和平精英全球总决赛",
              game: [
                {
                  time: "1607857200",
                  title: "第三周-周末积分赛",
                  name_1: "",
                  img_1: "",
                  name_2: "",
                  img_2: "",
                  result: "",
                },
              ],
            },
            {
              sort: "EPIC联赛",
              game: [
                {
                  time: "1607860800",
                  title: "D2总决赛",
                  name_1: "LtW",
                  img_1: "EPIC/LtW.png",
                  name_2: "Alliance",
                  img_2: "EPIC/Alliance.jpg",
                  result: "",
                },
                {
                  time: "1607860800",
                  title: "D2败者组决赛",
                  name_1: "OG",
                  img_1: "EPIC/OG.jpg",
                  name_2: "Vikin.gg",
                  img_2: "EPIC/Vikin.jpg",
                  result: "3:0",
                },
              ],
            },
          ],
        },
        {
          time: "1607904000",
          games: [
            {
              sort: "EPIC联赛",
              game: [
                {
                  time: "1607878800",
                  title: "决赛",
                  name_1: "VP",
                  img_1: "EPIC/VP.jpg",
                  name_2: "OG",
                  img_2: "EPIC/OG.jpg",
                  result: "",
                },
              ],
            },
          ],
        },
      ],
      ///////////////////////////////////////
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

  },
   mounted(){
     let header = document.getElementsByClassName('header');
    window.onscroll = function(){
      header.forEach((item)=>{
        if(item.getBoundingClientRect().top <= 45){
          item.firstChild.classList.add('active');
        }else{
          item.firstChild.classList.remove('active');
        }
      })
    }
   }
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
  z-index:99;
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
  /* z-index: 77; */
}
#game .page {
  text-align: center;
  margin:20px;
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