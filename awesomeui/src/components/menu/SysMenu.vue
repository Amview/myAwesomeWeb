<template>
  <div>
    <el-col>
      <el-menu style="width: 200px" router >
        <el-menu-item v-for="menu in menuList" :key="menu.id" :index="menu.menuPath">
          {{menu.menuName}}
        </el-menu-item>
      </el-menu>
    </el-col>
  </div>
</template>

<script>

import {getSysMenu} from "@/api/menu";

export default {
  name: "Menu",
  props: {
    items: Array,
    isCollapse:Boolean
  },
  data(){
    return{
      menuList: [],
      queryParams:{
        pageNum: 1,
        pageSize: 10
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList(){
      getSysMenu(this.queryParams).then(res => {
        this.menuList = res.data.result.list
      })
    },
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    }
  }
}
</script>

<style scoped>
  a{
    text-decoration: none;
  }
</style>
