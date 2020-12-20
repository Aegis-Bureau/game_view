<template>
<div>
<mt-header class="title" style=" background-color: #fff; color:#000;border-bottom: solid 1px #ccc;" title="暂未开发">
        <mt-button  @click="prev" icon="back" slot="left"></mt-button>
    </mt-header>
  <div>
    <img style="width:100%;" src="/img/ak_game/all/00.jpg">
    <img style="width:100%;" src="/img/404.png">
  </div>
  </div>
</template>
<script>
export default {
  methods:{
    prev(){
      this.$router.go(-1)
    }
  }
}
</script>