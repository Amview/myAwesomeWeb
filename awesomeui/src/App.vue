<template>
  <div id="app">
    <div v-if="$route.path != '/login'" class="menu">
      <keep-alive>
        <sys-menu></sys-menu>
        <sys-menu2></sys-menu2>
      </keep-alive>
    </div>
    <div v-if="$route.path != '/login'" class="content">
      <router-view></router-view>
    </div>
    <router-view v-if="$route.path == '/login'"></router-view>

  </div>
</template>

<script>
import SysMenu from "@/components/menu/SysMenu"
import SysMenu2 from "@/components/menu/SysMenu2"
export default {
  name: 'App',
  components: {
    SysMenu,
    SysMenu2
  }
}
</script>

<style scoped>
  #app{
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: row;
  }
  .menu{
    width: 200px;
    height: 100%;
    background-color: lightgray;
    text-align: center;
  }
  .content{
    width: 100%;
    height: 100%;
  }
</style>
