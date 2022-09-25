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
        <el-table-column label="用户名字" prop="userName" header-align="center" align="center"></el-table-column>
        <el-table-column label="操作" header-align="center" align="center">
          <template slot-scope="scope">
            <el-button type="primary" size="small" @click="update(scope.row)">修改</el-button>
            <el-button type="danger" size="small" @click="delete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <div style="display: flex;flex-direction: row;text-align: center;margin-top: 10px">
        <el-pagination
            background
            layout="prev, pager, next"
            :total="tableData.total"
        >
          <!--            @size-change="handleSizeChange"-->
          <!--            @current-change="handleCurrentChange"-->
        </el-pagination>
      </div>

    <UserForm
        ref="UserForm"
        @refreshData="getList"
    ></UserForm>
    </div>
</template>

<script>
import {getUserList} from "@/api/system/user/user";
import UserForm from "@/components/user/page/UserForm";

export default {
  name: "User",
  components: {
    UserForm
  },
  data(){
    return{
      tableData: {
        list: []
      },
      queryParams:{
        pageNum: 1,
        pageSize: 10
      },
      title: ''
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList(){
      getUserList(this.queryParams).then(res => {
        this.tableData = res.data.result
      })
    },
    add(row){
      this.title = "添加"
      this.$refs.UserForm.show(row)
    },
    update(row){
      this.title = "修改"
      this.$refs.UserForm.show(row)
    },

  }
}
</script>

<style scoped>
  .main{
    margin: 10px 20px 10px 20px;
  }

</style>
