import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
     // 登录的状态
     
     isLogined: localStorage.getItem('isLogined') || 0,
     info: JSON.parse(localStorage.getItem('info')) || {},
  },
  mutations: {
    // 登录
    loginMutation(state,payload){
      state.isLogined = 1;
      state.info = payload;
  },
  // 注销
  logoutMutation(state){
    localStorage.removeItem('isLogined');
    state.isLogined = 0;
    state.info = {};
    localStorage.removeItem('info');
  },
},
  actions: {
  },
  modules: {
  }
})
