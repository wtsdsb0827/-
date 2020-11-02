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
                   <el-button type="primary" style="margin-left: 400px;">新增</el-button>
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
                       状态： <el-select  v-model="value" placeholder="请选择">
                           <el-option
                                   v-for="item in options"
                                   :key="item.value"
                                   :label="item.label"
                                   :value="item.value">
                           </el-option>
                       </el-select>
                   </template>
               </el-row>

              <div style="margin-top: 30px;margin-left: 300px;">
                  <el-button>查询</el-button>
                  <el-button>导出</el-button>
              </div>
           </div>

           <div>
               <template>
                   <el-table :data="tableData" style="width: 100%">
                       <el-table-column prop="brandId" label="编号" width="180"></el-table-column>
                       <el-table-column prop="brandName" label="品牌名称" width="180"></el-table-column>
                       <el-table-column prop="address" label="状态"></el-table-column>
                       <el-table-column prop="address" label="操作"></el-table-column>
                       <el-table-column fixed="right" label="操作" width="100">
                           <template slot-scope="scope">
                               <el-button type="text" size="small">停用</el-button>
                               <el-button type="text" size="small">启用</el-button>
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
        data:{
            activeName: 'first',
            tableData:[],
            value:'',
        },
        methods:{
            handleClick(tab, event) {
                console.log(tab, event);
            }
        }
    })
</script>
</html>
