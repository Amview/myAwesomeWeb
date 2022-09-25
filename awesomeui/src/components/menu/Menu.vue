<template>
  <div class="main">
    <el-form :inline="true">
      <el-row :gutter="10"  style="display:flex; flex-wrap:wrap;flex-direction: row">
        <el-col :span="2"><el-button size="mini" @click="openForm">添加</el-button></el-col>
        <el-col :span="5"><el-input size="mini" style="width: 200px"></el-input></el-col>
        <el-col :span="2"><el-button size="mini">查询</el-button></el-col>
      </el-row>
    </el-form>
      <el-table :data="tableData.list">
        <el-table-column type="index" label="序号" header-align="center" align="center"></el-table-column>
        <el-table-column label="菜单名称" prop="menuName" header-align="center" align="center"></el-table-column>
        <el-table-column label="菜单类型" prop="menuTypeValue" header-align="center" align="center">
          <template slot-scope="scope">
            {{displayDataLabelFromValue(menuTypeDict,scope.row.menuTypeValue)}}
          </template>
        </el-table-column>
        <el-table-column label="菜单路径" prop="menuPath" header-align="center" align="center"></el-table-column>
        <el-table-column label="操作" header-align="center" align="center">
          <template slot-scope="scope">
            <el-button type="primary" size="small" @click="openForm(scope.row)">修改</el-button>
            <el-button type="danger" size="small" @click="deleteMenu(scope.row)">删除</el-button>
          </template>
        </el-table-column>
    </el-table>

    <div style="display: flex;flex-direction: row;text-align: center;margin-top: 10px">
      <el-pagination
          background
          layout="prev, pager, next"
          :total="tableData.total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
      >
      </el-pagination>
    </div>

    <MenuForm ref="MenuForm"
              :title="componentProp.title"
              :menu-type-dict="menuTypeDict"
              @refreshData="getList"
        >
    </MenuForm>
  </div>
</template>

<script>
import MenuForm from "@/components/menu/MenuForm";
import {addMenu, deleteMenuById, getMenuList} from "@/api/system/menu/menu";
import {getByDictType, getMenuDictList} from "@/api/dcit";

export default {
  name: "Menu",
  components: {
    MenuForm
  },
  data(){
    return {
      dictData: [],
      dialogVisible: false,
      addParams: {
        "menuName": "",
        "menuPath": "",
        "menuPermission": '',
        "menuPid": '',
        "menuOrder": '',
        "menuType": 'menu_type',
        "menuTypeValue": ''
      },
      queryParams:{
        pageNum: 1,
        pageSize: 10
      },
      rules: {
        menuName: {
          require: true,
          trigger: 'blur'
        }
      },
      componentProp: {
        title: '',
        buttons: [
          {
            name: '取消',
            type: '',
          },{
            name: '确认',
            type: 'primary',
          }
        ]
      },
      menuDictList: [],
      menuTypeDict: [],
      tableData: {
        list: [],
        total: 0,
        pageNum: '',
        pageSize: '',
        size: '',
      },
    }
  },
  created() {
    this.getList()
  },
  mounted() {

  },
  methods: {
    getList(){
      getMenuList(this.queryParams).then(res => {
        console.log('数据',res)
        this.tableData = res.data.result
      })
      getMenuDictList().then(res => {
        this.menuDictList = res.result
      })
      getByDictType('menu_type').then(res => {
        this.menuTypeDict = res.data.result
      })
    },
    openForm(row){
      this.$refs.MenuForm.show(row)
      for (let addParamsKey in this.addParams) {
        this.addParams[addParamsKey] = ''
      }
      this.addParams.menuType = 'menu_type'
    },
    deleteMenu(row){
      this.$confirm('是否删除?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        deleteMenuById(row.menuId).then(res => {
          this.$message.success("删除成功"+res.data.data)
          console.log(res)
          this.getList()
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });

    },
    addSubmit(){
      addMenu(this.addParams).then(res => {
        this.$message.success("添加成功")
        this.dialogVisible = false
        this.getList()
      })
    },
    handleSizeChange(val) {
    },
    handleCurrentChange(val) {
      this.queryParams.pageNum = val
      this.getList()
    }
  }

}
</script>

<style scoped>
  .main{
    margin: 10px 20px 10px 20px;
  }
  el-input{
    width: 50px;
    height: 20px;
  }
  .tableAdd{
    sborder: black solid 1px;
    width: 100%
  }
  .tableAdd tr>td:first-child{
    width: 80px;
  }
</style>
