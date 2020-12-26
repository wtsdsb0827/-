<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据维护</title>

    <script src="${pageContext.request.contextPath}/static/jquery/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
    <script src="${pageContext.request.contextPath}/download/excel.js"></script>
    <script src="${pageContext.request.contextPath}/download/xlsx.core.min.js"></script>


</head>
<body>

<div id="app">
    <div style="margin-top: 20px;margin-left: 30px;width: 100%">
        <div style="height: 30px;width: 400px;">     <%--文件的长度和宽度--%>


            模板：
            <el-button @click="DownloadTemp">下载</el-button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <el-button style="margin-left: 10px;" type="success" size="big" @click="submitUpload">导入文件</el-button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <el-button size="big" type="success" @click="exportBrand">导出文件</el-button>
            <br/><br/>

            <el-upload
                    class="upload-demo"
                    ref="upload"
                    action=""
                    :on-preview="handlePreview"
                    :on-change="handleChange"
                    :on-remove="handleRemove"
                    :auto-upload="false">     <%--false表示手动上传--%>
                上传：
                <el-button type="primary" style="margin-left: 10px;" size="big">选取文件</el-button>
            </el-upload>
            <br/>


        </div>

        <div style="margin-top: 130px;">
            <template>                        <%--tables标签页--%>
                <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
                    <el-tab-pane label="品牌名称" name="first"></el-tab-pane>
                    <el-tab-pane label="服务类型" name="second"></el-tab-pane>
                    <el-tab-pane label="预约时间段范围" name="third"></el-tab-pane>
                </el-tabs>
            </template>
        </div>
        <div style="height: 200px;width: 100%;">
            <el-row>
                综合查询：
                <el-input style="width: 200px;margin-right: 50px;" v-model="brandName" placeholder="名称"></el-input>
                <template>
                    状态：
                    <el-select v-model="brandState" placeholder="全部">
                        <el-option
                                v-for="item in stateFor"
                                :label="item.brandState"
                                :value="item.brandId">
                        </el-option>
                    </el-select>
                </template>&nbsp;&nbsp;&nbsp;&nbsp;
                <el-button @click="queryLikeInfo">查询</el-button>&nbsp;&nbsp;&nbsp;&nbsp;
                <el-button @click="dialogVisible = true">新增</el-button>
            </el-row>


            <el-dialog
                    title="品牌新增"
                    :visible.sync="dialogVisible"
                    width="30%"
                    :before-close="handleClose">
                品牌名称：
                <el-input style="width: 250px;" v-model="brandMingCheng"></el-input>
                <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="brandCommit">确 定</el-button>
                          <el-button @click="dialogVisible = false">取 消</el-button>
                      </span>
            </el-dialog>
        </div>

        <div style="margin-top: -100px">
            <template>
                <el-table id="TempId" border :data="tableData" style="width: 100%">
                    <el-table-column prop="brandId" label="编号" width="300"></el-table-column>
                    <el-table-column prop="brandName" label="品牌名称" width="400"></el-table-column>
                    <el-table-column prop="brandState" label="状态" width="500"></el-table-column>
                    <el-table-column fixed="right" width="200" label="操作">
                        <template slot-scope="scope">
                            <el-button type="text" @click="StartState(scope.row)" v-if="scope.row.brandState=='停用中'">
                                启用
                            </el-button>
                            <el-button type="text" @click="StopState(scope.row)" v-if="scope.row.brandState=='使用中'">停用
                            </el-button>
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
        el: "#app",
        data: {
            activeName: 'first',
            tableData: [],
            stateFor: [{brandState: '使用中', brandId: '使用中'}, {brandState: '停用中', brandId: '停用中'},],
            brandState: '',
            brandName: '',
            brandMingCheng: '',
            dialogVisible: false,
            files: "",
            str: 1
        },

        mounted: function () {
            var _this = this;
            axios.post('${pageContext.request.contextPath}/pro/queryInfo')
                .then(function (res) {
                    _this.tableData = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })
        },


        methods: {
            submitUpload() {            //选择文件 = >导入数据
                alert(this.files)
                if (this.files == "")
                    alert("请先选择文件")
                else {
                    var params = new FormData();
                    params.append("file", this.files);
                    var headers = "{content-type':'multipart/form-data}"
                    axios.post("${pageContext.request.contextPath}/pro/ImportBrand", params, headers)
                        .then(function (res) {
                            alert("导入数据成功")
                            location.reload();
                        })

                        .catch(function (error) {
                            console.log(error)
                        })
                }
            },

            /*  exportBrand:function(){         //选择文件 = >导出数据
                  var params = new FormData();
                  params.append("file", this.files);
                  var headers="{content-type':'multipart/form-data}"
                  axios.post("{pageContext.request.contextPath}/pro/exportBrand",params,headers)
                      .then(function (res) {
                          alert("导出数据成功")
                          console.log(res)
                      })
                      .catch(function (error) {
                          console.log(error)
                      })
              },*/

            /*模板下载*/
            DownloadTemp: function () {
                axios.post("${pageContext.request.contextPath}/pro/DownloadTemp")
                    .then(function (res) {
                        if (res.data != null) {
                            console.log(res.data)
                            alert("文件下载成功，请去" + res.data + "查看")
                        } else {
                            alert("下载失败")
                        }
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            handleRemove(file) {
                console.log(file);
            },


            handleChange(file) {
                this.files = file.raw;     //将得到的file文件赋值给files
            },

            handlePreview(file) {
                console.log(file);
            },

            exportBrand: function () {        //导出下载
                var table = document.getElementById('TempId');
                var sheet = XLSX.utils.table_to_sheet(table);
                openDownloadDialog(sheet2blob(sheet), 'DownLoadExcel.xlsx');
            },


            /*  数据维护状态的修改（使用中/停用中） */
            StartState: function (row) {
                var _this = this;
                var brandState = row.brandState;
                var brandId = row.brandId;
                axios.post('${pageContext.request.contextPath}/pro/setState', {
                    brandState: brandState,
                    brandId: brandId,
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },
            /*  数据维护状态的修改（使用中/停用中） */
            StopState: function (row) {
                var _this = this;
                var brandState = row.brandState;
                var brandId = row.brandId;
                axios.post('${pageContext.request.contextPath}/pro/setState', {
                    brandState: brandState,
                    brandId: brandId,
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },


            handleClick(tab, event) {       //标签页被选中时触发
                console.log(tab, event);
            },
            queryLikeInfo: function () {         //查询按钮
                var _this = this;
                axios.post('${pageContext.request.contextPath}/pro/queryLikeInfo', {
                    brandName: _this.brandName,
                    brandState: _this.brandState,
                })
                    .then(function (res) {
                        _this.tableData = res.data
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },
            handleClose(done) {      //确认关闭弹出框
                this.$confirm('确认关闭？')
                    .then(function (res) {
                        done();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            brandCommit: function () {
                var _this = this;
                if (_this.brandMingCheng == "")
                    alert("品牌名称不能为空")
                else {               //先去判断要添加品牌名不能是重复的
                    axios.post('${pageContext.request.contextPath}/pro/queryBrandAll', {
                        brandName: _this.brandMingCheng
                    })
                        .then(function (res) {
                            if (res.data == true)
                                alert("品牌名已经存在，拒绝添加")
                            else {
                                axios.post('${pageContext.request.contextPath}/pro/PutBrand', {
                                    brandMingCheng: _this.brandMingCheng,
                                    brandState: "停用中"
                                })
                                    .then(function (res) {
                                        alert("添加成功")
                                        location.reload();
                                    })
                                    .catch(function (error) {
                                        console.log(error)
                                    })
                            }
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                }

            },


        }


    })
</script>
</html>
