import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import MintUI from 'mint-ui'
import moment from 'moment'
import LyTab from 'ly-tab'
import echarts from 'echarts'

//设置axios
axios.defaults.baseURL = '/api';
Vue.prototype.axios = axios;
//设置mintui
import 'mint-ui/lib/style.min.css'
Vue.use(MintUI);
Vue.use(LyTab);
//设置moment
Vue.prototype.moment = moment
Vue.prototype.echarts = echarts;

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
