<template>
  <div>
    <el-dialog
        :visible.sync="dialogOpen"
        :title="title"
        width="50%"
        :before-close="cancel"
    >
      <div style="text-align: left">
        <el-form ref="form" label-width="100px" :model="form" >
          <el-form-item label="用户名字：" prop="menuName">
            <el-input v-model:value="form.userName"></el-input>
          </el-form-item>
        </el-form>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </span>

    </el-dialog>
  </div>

</template>

<script>
import {addUser} from "@/api/system/user/user";

export default {
  name: "UserForm",
  props: [],
  data(){
    return{
      dialogOpen: false,
      title: '',
      form: {
        "id": '',
        "userName": '',
        "password": '123456'
      }
    }
  },
  methods: {
    clearData(){
      this.form = {
        "id": '',
        "userName": '',
        "password": '123456'
      }
    },
    show(row){
      this.dialogOpen = true
      console.log("row",row)
      if(row.id){
        this.title = "修改"
        this.form = row
      }else {
        this.title = "增加"
        this.clearData()
      }
    },
    submitForm(){
      addUser(this.form).then(res => {
        this.$message.success("成功")
        this.$emit('refreshData')
      })
    },
    cancel(){
      this.dialogOpen = false
      this.$emit('refreshData')
    }
  }
}
</script>

<style scoped>

</style>
