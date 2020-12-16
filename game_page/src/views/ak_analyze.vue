<template>
  <div id="ak_ale">
    <!-- 顶部 -->
    <mt-header class="title" title="数据分析">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <!-- 导航 -->
    <mt-navbar v-model="active">
      <mt-tab-item id="1">视频数据</mt-tab-item>
      <mt-tab-item id="2">收益数据</mt-tab-item>
      <mt-tab-item id="3">粉丝数据</mt-tab-item>
    </mt-navbar>
    <!-- 面板 -->
    <mt-tab-container v-model="active">
      <mt-tab-container-item id="1">
        <div class="report">
          <div>
            <p>累计播放</p>
            <span class="red">{{ info.bf }}</span>
          </div>
          <div>
            <ul>
              <li>
                <p>昨日播放</p>
                <span>{{ info.zrbf }}</span>
              </li>
              <li>
                <p>昨日粉丝播放</p>
                <span>{{ info.zrfs }}</span>
              </li>
            </ul>
          </div>
          <div>
            <p>累计发布</p>
            <span>{{ info.fb }}</span>
          </div>
        </div>
        <!-- 折线图 -->
        <div class="chartLineBox">
          <div id="chart" style="width: 95%; height: 95%"></div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="2">
        <div class="report">
          <div>
            <ul>
              <li>
                <p>可提现金额</p>
                <span class="red">￥{{ info.zrbf }}</span>
              </li>
              <li class="tx">
                <mt-button>去提现</mt-button>
              </li>
            </ul>
          </div>
          <div>
            <ul>
              <li class="hint">
                <p>
                  账户总余额
                  <span @click="mtPop"
                    >?
                  </span>
                </p>
                <div class="prompt">创作视屏的全部收益</div>
                <span>￥{{ info.zrbf }}</span>
              </li>
              <li>
                <p>累计已提现</p>
                <span>￥{{ info.zrfs }}</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="report">
          <div>
            <p>本月视频播放收益<span>（每天24点更新昨日数据）</span></p>
            <span class="red">￥{{ info.zrbf }}</span>
          </div>
          <div>
            <ul>
              <li>
                <p>昨日视频播放收益</p>
                <span>￥{{ info.zrbf }}</span>
              </li>
              <li>
                <p>近7日视频播放收益</p>
                <span>￥{{ info.zrfs }}</span>
              </li>
            </ul>
          </div>
        </div>
      </mt-tab-container-item>
      <mt-tab-container-item id="3">
        <div class="report">
          <div>
            <p>粉丝数量<span>（实时更新）</span></p>
            <span class="red">{{ info.zrbf }}</span>
          </div>
          <div>
            <ul>
              <li>
                <p>昨日涨粉</p>
                <span>{{ info.zrbf }}</span>
              </li>
              <li class="tx">
                <p>昨日降粉</p>
                <span>{{ info.zrbf }}</span>
              </li>
            </ul>
          </div>
        </div>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
export default {
  data() {
    return {
      active: "1",
      info: {
        bf: 0,
        zrbf: 0,
        zrfs: 0,
        fb: 0,
      },
      // 折线图数据
      hebdomad: ["12-03", "12-04", "12-05", "12-06", "12-07", "12-08", "12-09"],
      addPlay: [1, 32, 1, 34, 0, 30, 10], // 播放量
      beanPlay: [20, 12, 11, 15, 0, 8, 3], // 粉丝
    };
  },
  mounted() {
    var myChart = this.echarts.init(document.getElementById("chart"));
    var option = {
      color: ["#f00", "#4e8ede"],
      title: {
        text: "近7日播放量变化趋势",
        textStyle: {
          fontSize: 14,
        },
      },
      legend: {
        left: "45%",
        data: ["播放量", "粉丝播放量"],
        textStyle: {
          fontSize: 12,
        },
      },
      grid: {
        left: "2%",
        right: "5%",
        bottom: "3%",
        containLabel: true,
      },
      xAxis: {
        boundaryGap: false,
        data: this.hebdomad,
        axisTick: { show: false },
      },
      yAxis: {
        axisTick: { show: false },
      },
      series: [
        {
          name: "播放量",
          type: "line",
          smooth: true,
          data: this.addPlay,
        },
        {
          name: "粉丝播放量",
          type: "line",
          smooth: true,
          data: this.beanPlay,
        },
      ],
    };
    myChart.setOption(option);
  },
  methods: {
    mtPop() {
      let prompt = document.getElementsByClassName('prompt')[0];
      prompt.classList.add('show');
      setTimeout(() => {
        prompt.classList.remove('show');
      }, 1500);
    },
  },
};
</script>

<style>
#ak_ale .red {
  color: #f00;
  font-size: 26px !important;
  font-weight: 900 !important;
}
#ak_ale .mint-tab-item.is-selected {
  color: red;
  border-bottom: 3px solid red;
}
#ak_ale {
  height: 667px;
  background-color: rgba(236, 236, 236, 0.5);
}
#ak_ale .title {
  background-color: #fff;
  color: #000;
  font-size: 16px;
}
#ak_ale .router-link-active {
  font-size: 20px;
}
#ak_ale .mint-navbar a {
  color: #666;
}
#ak_ale .report {
  margin: 18px 0;
}
#ak_ale .report > div {
  width: 75%;
  padding: 3% 15% 3% 5%;
  line-height: 2;
  margin: 0 auto;
  color: #666;
  background-color: #fff;
  border-bottom: 1px solid #999;
}
#ak_ale .report > div:first-child {
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}
#ak_ale .report > div ul {
  list-style: none;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
#ak_ale .report > div:last-child {
  margin-bottom: 20px;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
}
#ak_ale .chartLineBox {
  width: 95%;
  margin: 0 auto;
  border-radius: 10px;
  height: 260px;
  background-color: #fff;
}
#ak_ale #chart {
  margin: auto;
  padding-top: 10px;
}
#ak_ale .tx > .mint-button {
  width: 100px;
  color: #ccc;
  background-color: gray;
  height: 40px;
  border-radius: 20px;
}
#ak_ale .report div > p > span {
  font-size: 12px;
  color: #999;
}
#ak_ale .report div > span,
#ak_ale .report div > ul span {
  font-weight: 700;
  font-size: 20px;
}
#ak_ale .hint > p > span {
  display: inline-block;
  margin-left: 10px;
  padding: 1px 4px;
  color: #fff;
  line-height: 1;
  background-color: #999;
  border-radius: 50%;
  font-size: 11px !important;
}
#ak_ale .hint {
  position: relative;
  white-space: nowrap;
}
#ak_ale .prompt{
  display: none;
}
#ak_ale .prompt.show{
  display:block;
  position: absolute;
  width: 150px;
  height: 30px;
  line-height: 30px;
  border-radius: 10px;
  text-align: center;
  border:1px solid #999;
  background: #fff;
  left: 75px;
  top: -35px;
  font-size: 12px;
  color: #999;
}
#ak_ale .prompt.show::before {
  content: "";
  position: absolute;
  width: 13px;
  height: 13px;
  overflow:hidden;
  background: #fff;
  border-right:1px solid #999;
  border-bottom:1px solid #999;
  bottom:-8px;
  left:20px;
  transform: rotate(45deg);
}
</style>