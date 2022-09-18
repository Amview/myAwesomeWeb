<template>
  <div class="main">
    <el-form>
        <el-form-item label="用户" label-width="100">
          <el-input v-model:value="test"></el-input>
        </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "Login",
  data(){
    return{
      test: ''
    }
  }
}
</script>

<style scoped>
  .main{
    margin: 0 auto;
    width: 500px;
  }
</style>
