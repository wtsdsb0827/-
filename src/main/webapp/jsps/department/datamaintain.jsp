<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据维护</title>

    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
</head>
<body>

    <div id = "app">
       <div style="margin-top: 50px;margin-left: 50px;width: 100%">
           <div>
               <el-row>
                   模板：<el-button>下载</el-button>
                   上传：<el-button type="primary">选择文件</el-button>
                   <el-button type="primary">确定导入</el-button>
               </el-row>
           </div>

          <div style="margin-top: 20px;">
              <template>
                  <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
                      <el-tab-pane label="品牌名称" name="first"></el-tab-pane>
                      <el-tab-pane label="服务类型" name="second"></el-tab-pane>
                      <el-tab-pane label="预约时间段范围" name="third"></el-tab-pane>
                  </el-tabs>
              </template>
          </div>
           <div style="height: 200px;width: 100%;">
               <el-row >
                   综合查询：<el-input style="width: 200px;margin-right: 50px;" v-model="brandName" placeholder="名称"></el-input>
                   <template>
                       状态： <el-select  v-model="brandState" placeholder="全部">
                           <el-option
                                   v-for="item in stateFor"
                                   :label="item.brandState"
                                   :value="item.brandId">
                           </el-option>
                       </el-select>
                   </template>
               </el-row>

              <div style="margin-top: 30px;margin-left: 200px;">
                  <el-button @click="queryLikeInfo">查询</el-button>
                  <el-button>导出</el-button>
                  <el-button @click="dialogVisible = true" >新增</el-button>

                  <el-dialog
                          title="品牌新增"
                          :visible.sync="dialogVisible"
                          width="30%"
                          :before-close="handleClose">
                      品牌名称：<el-input style="width: 250px;" v-model="brandMingCheng"></el-input>
                      <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="brandCommit">确 定</el-button>
                          <el-button @click="dialogVisible = false">取 消</el-button>
                      </span>
                  </el-dialog>
              </div>
           </div>

           <div>
               <template>
                   <el-table :data="tableData" style="width: 100%">
                       <el-table-column prop="brandId" label="编号" width="150"></el-table-column>
                       <el-table-column prop="brandName" label="品牌名称" width="150"></el-table-column>
                       <el-table-column prop="brandState" label="状态" width="150"></el-table-column>
                       <el-table-column fixed="right" label="操作">
                           <template slot-scope="scope">
                               <el-button type="text" size="big">停用</el-button>
                               <el-button type="text" size="big">启用</el-button>
                           </template>
                       </el-table-column>
                   </el-table>
               </template>
           </div>
       </div>
    </div>

</body>

<script>
    new Vue({
        el:"#app",

        mounted:function(){
            var _this = this;
            var id1 = ${user.roleId}
                axios.post('${pageContext.request.contextPath}/pro/queryInfo',{
                    roleId:id1,
                })
                    .then(function (res) {
                        _this.tableData = res.data
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
        },

        data:{
            activeName: 'first',
            tableData:[],
            stateFor:[
                {brandState:'使用中',brandId:'使用中'},
                {brandState:'停用中',brandId:'停用中'},
                        ],
            brandState:'',
            brandName:'',
            brandMingCheng:'',
            dialogVisible: false,
        },
        methods:{
            handleClick(tab, event) {
                console.log(tab, event);
            },
            queryLikeInfo:function () {         //查询按钮
                var _this = this;
                    axios.post('${pageContext.request.contextPath}/pro/queryLikeInfo',{
                        brandName:_this.brandName,
                        brandState:_this.brandState,
                    })
                        .then(function (res) {
                            _this.tableData = res.data
                            console.log(res)
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
            },
            handleClose(done){
                this.$confirm('确认关闭？')
                    .then(function (res) {
                        done();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })

            },
            brandCommit:function () {
                var _this = this;
                var brandMingCheng = _this.brandMingCheng;
                var roleId = ${user.roleId};
                axios.post('${pageContext.request.contextPath}/pro/PutBrand',{
                    roleId:roleId,
                    brandMingCheng:brandMingCheng,
                })
                    .then(function (res) {
                        alert("添加成功")
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },


}



    })
</script>
</html>
