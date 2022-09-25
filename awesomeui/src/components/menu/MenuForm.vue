<template>
  <div>
    <el-dialog
        :title="title"
        :visible.sync="dialogOpen"
        width="35%"
        :before-close="cancel"
        style="text-align: center">
      <div style="text-align: left">
        <el-form ref="form" label-width="80px" :rules="rules" :model="form">
          <el-form-item label="菜单名字" prop="menuName">
            <el-input v-model:value="form.menuName"></el-input>
          </el-form-item>
          <el-form-item label="菜单路径" prop="menuPath">
            <el-input v-model:value="form.menuPath" placeholder="/system/***"></el-input>
          </el-form-item>
          <el-form-item label="父菜单id">
            <el-input v-model:value="form.menuPid"></el-input>
          </el-form-item>
          <el-form-item label="菜单序号" >
            <el-input-number v-model="form.menuOrder":min="0" :max="10"></el-input-number>
          </el-form-item>

          <el-form-item label="菜单类型" prop="menuTypeValue">
            <el-select v-model:value="form.menuTypeValue" style="width: 100%">
              <el-option value="" v-for="(item,index) in menuTypeDict" :label="item.dictLabel" :value="item.dictValue" :key="item.dictId">
              </el-option>
            </el-select>
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
import {addMenu, updateSysMenu} from "@/api/system/menu/menu";

export default {
  name: "MenuForm",
  props: {
    menuTypeDict: {
      type: Array,
      default() {
        return [];
      }
    },
  },
  data(){
    return{
      dialogOpen: false,
      title: '',
      defaultProps: {
        children: 'children',
        label: 'label'
      },
      data: [
        {
          label: '一级 1',
          children: [{
            label: '二级 1-1',
            children: [{
              label: '三级 1-1-1'
            }]
          }]
        },
        {
          label: '2级',
        }
      ],
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
  },
  methods: {
    clearData(){
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
    show(row){
      if(row.menuId){
        this.title = "修改"
        this.form = row
        this.form.menuTypeValue = this.form.menuTypeValue+''
      }else {
        this.title = "增加"
        this.clearData()
      }
      console.log('表格数据',row)
      this.dialogOpen =  true
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
              this.$message.success("修改成功")
            })
          }else {
            addMenu(this.form).then(res => {
              this.dialogOpen = false
              this.$message.success("新增成功")
              this.$parent.event.getList()
            })
          }
        }
      })
      console.log('this.showData.form',this.showData.form)
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
