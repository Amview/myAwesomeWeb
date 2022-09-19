<template>
  <div>
    <el-dialog :visible.sync="dialogOpen" :title="title">

    </el-dialog>
  </div>

</template>

<script>
export default {
  name: "UserForm",
  props: ['title'],
  data(){
    return{
      dialogOpen: false
    }
  },
  methods: {
    show(){
      this.dialogOpen = true
    }
  }
}
</script>

<style scoped>

</style>
