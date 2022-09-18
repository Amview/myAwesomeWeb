<template>
  <div class="main">
    <el-form :inline="true">
      <el-row :gutter="10"  style="display:flex; flex-wrap:wrap;flex-direction: row">
        <el-col :span="2"><el-button size="mini" @click="add">添加</el-button></el-col>
        <el-col :span="5"><el-input size="mini" style="width: 200px"></el-input></el-col>
        <el-col :span="2"><el-button size="mini">查询</el-button></el-col>
      </el-row>
    </el-form>
      <el-table :data="tableData.list">
      <el-table-column type="index" label="序号" header-align="center" align="center"></el-table-column>
      <el-table-column v-for="(item,index) in cols" :label="item.label" :key="item.prop" :prop="item.prop">
        <template slot-scope="scope">
          <span v-if="item.prop == 'menuTypeValue'">
            {{displayDataLabelFromValue(menuTypeDict,scope.row.menuTypeValue)}}
          </span>
          <span v-else>
            {{scope.row[item.prop]}}
          </span>
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


    <MenuForm ref="MenuUpdate"
             :title="componentProp.title"
             :menuDictList="menuDictList"
              >
    </MenuForm>
    <MenuForm ref="MenuAdd"
             :title="componentProp.title"
             >
    </MenuForm>
  </div>
</template>

<script>
import api from "@/api/api";
import {request} from "@/utils/request"
import MenuForm from "@/components/menu/MenuForm";
import {displayDataLabelFromValue} from "@/utils/base";

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
      cols: [
        {
          label:"菜单id",
          prop: "menuId",
          width:"180"
        },
        {
          label:"菜单类型",
          prop: "menuTypeValue",
          width:"180",
          handle() {
          }
        },
        {
          label:"菜单名称",
          prop: "menuName",
          width:"180"
        },
        {
          label:"菜单路径",
          prop: "menuPath",
          width:"180"
        },
        {
          label:"菜单路径",
          prop: "menuPath",
          width:"180"
        }
      ],
    }
  },
  created() {
    this.getList()
  },
  mounted() {

  },
  methods: {
    getList(){
      request(api.system_menu.getMenuList,this.queryParams).then(res => {
        this.tableData = res.data.result
      })
      request(api.system_dict.getMenuDictList).then(res => {
        this.menuDictList = res.result
      })
      request(api.system_dict.getByDictType, {
          dictType: 'menu_type'
      }).then(res => {
        this.menuTypeDict = res.data.result
      })
    },
    add(){
      this.$refs.MenuAdd.add()
      this.componentProp.title = "增加"
      for (let addParamsKey in this.addParams) {
        this.addParams[addParamsKey] = ''
      }
      this.addParams.menuType = 'menu_type'
    },
    updateMenu(row){
      this.$refs.MenuUpdate.update(row)
      this.componentProp.title = "修改"
    },
    deleteItem(id){
      this.$confirm('是否删除?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        request(api.system_menu.deleteMenuById,{
          id: id
        }).then(res => {
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
      request(api.system_menu.addMenu,this.addParams).then(res => {
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
