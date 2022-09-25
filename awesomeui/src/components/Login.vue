<template>
  <div class="main">
    <div class="loginForm">
<!--      <el-form label-width="50px">-->
<!--        <div style="font-size: 30px;margin-bottom: 10px">登录</div>-->
<!--        <el-form-item label="账户" >-->
<!--          <el-input v-model:value="form.userName"></el-input>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="密码">-->
<!--          <el-input v-model:value="form.password"></el-input>-->
<!--        </el-form-item>-->
<!--        <el-form-item style="text-align: center">-->
<!--          <el-button type="primary" style="width: 100%">登录</el-button>-->
<!--        </el-form-item>-->
<!--        <el-form-item style="text-align: left">-->
<!--          <a href="#">注册</a>&emsp;-->
<!--          <a href="#">找回密码</a>-->
<!--        </el-form-item>-->

<!--      </el-form>-->
      <div class="login">
        <p>Login</p>
        <input type="text" placeholder="用户名">
        <input type="password" placeholder="密码">
        <input type="submit" class="btn" value="登  录">
      </div>

    </div>

  </div>
</template>

<script>
export default {
  name: "Login",
  data(){
    return{
      form: {
        userName: '',
        password: ''
      }
    }
  }
}
</script>

<style scoped>
  .main{
    width: 100%;
    height: 100%;
    text-align: center;
    /*border: solid black 1px;*/
    /*background-image: url("/public/img/bg.jpg");*/
    background-color: whitesmoke;
    background-size: cover;
  }
  /*.loginForm{*/
  /*  background-color: #fff5f5;*/
  /*  border-radius: 10px;*/
  /*  padding: 20px 20px 5px 20px;*/
  /*  width: 500px;*/
  /*  margin: 0 auto;*/
  /*  margin-top: 15%;*/
  /*}*/
  input{
    background-color: white;
    width: 100%;
    height: 48px;
    margin-bottom: 10px;
    border: none;
    border-bottom: 2px solid silver;
    /* 下面的会覆盖上面的步伐 */
    outline: none;
    font-size: 22px;
  }
  .btn{
    background-color: #59c2c5;
    width: 38%;
    height: 48px;
    border-radius: 8px;
    margin-top: 40px;
    font-size: 28px;
    font-weight: 600;
    color: white;
  }
  .btn:hover{
    background-color: #59c2a0;
  }
  p{
    font-size: 42px;
    font-weight: 600;
  }
  .login{
    position: absolute;
    top: 50%;
    margin-top: -200px;
    left: 50%;
    margin-left: -200px;
    /* absolute居中的一种方法 */
    background-color: white;
    width: 400px;
    height: 400px;
    border-radius: 25px;
    text-align: center;
    padding: 5px 40px;
    box-sizing: border-box;
    /* 这样padding就不会影响大小 */
  }
  *{
    user-select: none;
    /* 无法选中，整体感更强 */
  }
</style>
<style>

</style>
