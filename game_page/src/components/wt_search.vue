<template>
  <div class="top">
    <div class="search">
      <router-link to="/search">
        <input type="text" placeholder="请输入您感兴趣的内容" disabled>
      </router-link>
      <img src="../assets/images/icon/photo.png">
    </div>
    <ul>
      <li v-for="(elem,i) of tabs" :key="i">{{elem}}</li>
    </ul>
  </div>
</template>

<style>
.top .search input{
  width: 70%;
  height: 1.5rem;
  outline: none;
  border: 1px solid #ccc;
  border-radius: 0.75rem;
  margin-left: 4%;
  margin-top: 3%;
  background: #ddd url(../assets/images/icon/search_gray.png) no-repeat 3%;
  background-size: 1rem;
  padding-left: 8%;
}
.top .search img{
  display: inline;
  width: 1.25rem;
  margin-left: 5%;
  vertical-align: middle;
}
.top ul{
  margin-top: 3%;
  padding-right: 5%;
  height: 1.1rem;
  font-size: 1.1rem;
  color: #666;
  font-weight: 700;
  overflow: hidden;
}
.top ul>li{
  float: left;
  margin-left: 3%;
}
</style>

<script>
export default {
  data(){
    return {
      tabs:['热点','推荐','关注','精选','英雄联盟','王者荣耀','和平精英','我的世界']
    }
  }
}
</script>