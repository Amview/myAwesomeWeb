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
        <!--@size-change="handleSizeChange"-->
        <!--@current-change="handleCurrentChange"-->
      </el-pagination>
    </div>

    <Form
        ref="Form"
        :title="title"
    >
    </Form>
  </div>
</template>

<script>
import Form from "@/components/template/page/Form";
export default {
  name: "Main",
  components:{
    Form
  },
  data(){
    return{
      tableData: {
        list: [
          {
            label: '1',
            value: '1'
          },
        ]
      },
      queryParams:{
        pageNum: 1,
        pageSize: 10
      },
      title: ''
    }
  },
  methods: {
    add(row) {
      this.title = "添加"
      this.$refs.Form.show(row)
    },
    update(row) {
      this.title = "修改"
      this.$refs.Form.show(row)
    }
  }
}
</script>

<style scoped>
  .main{
    margin: 10px 20px 10px 20px;
  }
</style>
