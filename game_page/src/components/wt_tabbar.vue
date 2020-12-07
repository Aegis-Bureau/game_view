<template>
 <!-- 底部选项卡 -->
  <div class="tabbar">
    <router-link>
    <mt-tabbar v-model="selected" fixed>
      <mt-tab-item v-for="(elem,i) of tabs" :key="i" :id="i">
        <img slot="icon" :src="require('../assets/images/icon/tab_' + i + '_sel.png')" v-if="selected == i">
        <img slot="icon" :src="require('../assets/images/icon/tab_' + i + '_nor.png')" v-else>
        {{elem}}
      </mt-tab-item>
    </mt-tabbar>
  </div>  
</template>

<script>
export default {
  data(){
    return {
      tabs:{'index':'首页','match':'赛事','video':'直播','me':'我的'},
      selected:'index'
    }
  },
  mounted(){
  }
}
</script>