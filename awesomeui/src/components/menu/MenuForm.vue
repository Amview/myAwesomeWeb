<template>
  <div>
    <el-dialog
        :title="title"
        :visible.sync="dialogOpen"
        width="35%"
        style="text-align: center">
      <div style="text-align: left">
        <el-form ref="form" label-width="80px" :rules="rules" :model="form">
          <el-form-item label="菜单名字" prop="menuName">
            <el-input v-model:value="form.menuName"></el-input>
          </el-form-item>
          <el-form-item label="菜单路径" prop="menuPath">
            <el-input v-model:value="form.menuPath"></el-input>
          </el-form-item>
          <el-form-item label="父菜单id">
            <el-input v-model:value="form.menuPid"></el-input>
          </el-form-item>
          <el-form-item label="菜单序号" >
            <el-input v-model:value="form.menuOrder"></el-input>
          </el-form-item>
          <el-form-item label="菜单类型" prop="menuTypeValue">
            <el-select v-model:value="form.menuTypeValue" style="width: 100%">
              <el-option value="" v-for="(item,index) in menuTypeList" :label="item.dictName" v-model:value="item.dictId" :key="item.dictId">
              </el-option>
            </el-select>
          </el-form-item>
        </el-form>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="dialogOpen = false">取 消</el-button>
      </span>

    </el-dialog>
  </div>
</template>

<script>
import {addMenu, updateSysMenu} from "@/api/menu";

export default {
  name: "MenuForm",
  props: {
    title: {
      type: String,
      default(){
        return 'form页面'
      }
    },
    menuDictList: {
      type: Array,
      default() {
        return [];
      }
    },
    menuTypeList: {
      type: Array,
      default() {
        return [];
      }
    },
    btns: {
      type: Array,
      default(){
        return []
      }
    }
  },
  data(){
    return{
      dialogOpen: false,
      showData: {
      },
      form: {
        "menuId": "",
        "menuName": "",
        "menuPath": "",
        "menuPermission": '',
        "menuPid": "",
        "menuOrder": '',
        "menuType": "menu_type",
        "menuTypeValue": '',
        "componentPath": '',
        "menuTypeName": '',
        "children": ''
      },
      rules: {
        menuName: [{ required: true, message: '请输入菜单名称', trigger: 'blur' }],
        menuPath: [{ required: true, message: '请输入菜单路径', trigger: 'blur' }],
        menuTypeValue: [{ required: true, message: '请选择菜单类型', trigger: 'blur' }]
      }
    }
  },
  created() {

    console.log('this.$props',this.$props);
  },
  methods: {
    refreshData(){
      this.form = {
        "menuId": "",
            "menuName": "",
            "menuPath": "",
            "menuPermission": '',
            "menuPid": "",
            "menuOrder": '',
            "menuType": "menu_type",
            "menuTypeValue": '',
            "componentPath": '',
            "menuTypeName": '',
            "children": ''
      }
    },
    add(){
      this.dialogOpen =  true
      this.refreshData()
    },
    update(row){
      this.dialogOpen =  true
      this.form = row
    },
    submitForm(){
      this.$refs.form.validate(valid => {
        //验证通过
        if(valid){
          if(this.form.menuId != ''){
            updateSysMenu(this.form).then(res => {
              this.dialogOpen = false
            })
          }else {
            addMenu(this.form).then(res => {
              this.dialogOpen = false
              this.$parent.event.getList()
            })
          }
        }
      })
      console.log('this.showData.form',this.showData.form)
    }
  }
}
</script>

<style scoped>

</style>
