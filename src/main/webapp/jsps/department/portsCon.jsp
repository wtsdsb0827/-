<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>接口配置</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
</head>
<body>
<div id="app">
    <div style="margin-top:20px;margin-left: 50px; ">
        <template>
            综合查询：
            <el-input placeholder="接口名称" style="width: 200px;" v-model="portLike"></el-input>&nbsp;&nbsp;
            <template>
                状态：
                <el-select v-model="portstateLike" placeholder="全部">
                    <el-option
                            v-for="item in stateLikeArray"
                            :label="item.portState"
                            :value="item.value">
                    </el-option>

                </el-select>&nbsp;&nbsp;
                <el-button @click="selectLike">查询</el-button>
                <el-button @click="portAdd" size="big">新增</el-button>
            </template>


            <el-dialog
                    title="接口新增"
                    :visible.sync="dialogPortAdd"
                    width="50%"
                    :before-close="handleClose">
                <template>
                    品牌名称：
                    <el-select v-model="brandNameAdd" placeholder="全部">
                        <el-option
                                v-for="item in portNameAddArray"
                                :label="item.brandName"
                                :value="item.brandId">
                        </el-option>

                    </el-select>
                    <br/><br/>
                    接口名称：
                    <el-input style="width: 200px;" v-model="portNameAdd"></el-input>
                    <br/><br/>
                </template>

                <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="portAddCom">确 定</el-button>
                          <el-button @click="dialogPortAdd = false">取 消</el-button>
                      </span>
            </el-dialog>

            <el-dialog
                    title="接口修改"
                    :visible.sync="dialogPortUp"
                    width="50%"
                    :before-close="handleClose">
                <template>
                    接口名称：
                    <el-input :disabled="true" style="width: 200px;" v-model="portNameUp"></el-input>
                    <br/><br/>
                </template>
                <template>
                    接口状态：
                    <el-select v-model="portStateUp" placeholder="请选择">
                        <el-option
                                v-for="item in stateLikeArray"
                                :label="item.portState"
                                :value="item.value">
                        </el-option>
                    </el-select>
                </template>


                <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="portUpdateCom">确 定</el-button>
                          <el-button @click="dialogPortUp = false">取 消</el-button>
                      </span>
            </el-dialog>

            <div style="margin-top: 30px;">
                <template>
                    <el-table
                            :data="FirstTab"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="brandId"
                                v-if="shower">
                        </el-table-column>
                        <el-table-column
                                prop="portId"
                                v-if="shower">
                        </el-table-column>
                        <el-table-column
                                prop="brandName"
                                label="品牌名称"
                                width="400">
                        </el-table-column>
                        <el-table-column
                                prop="portName"
                                label="接口名称"
                                width="300">
                        </el-table-column>
                        <el-table-column
                                prop="portState"
                                label="接口状态"
                                width="300">
                        </el-table-column>
                        <el-table-column fixed="right" label="操作" width="400">
                            <template slot-scope="scope">
                                <el-button @click="portUpdate(scope.row)" type="text" size="big">修改</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </template>
    </div>
</div>
</body>

<script>
    new Vue({
        el: "#app",
        data: {
            portLike: '',
            portstateLike: '',
            stateLikeArray: [{portState: '使用中', value: '使用中'}, {portState: '停用中', value: '停用中'}],
            portName: '',
            portNameAdd: '',
            portState: '',
            FirstTab: [],
            using: '使用中',
            dialogPortAdd: false,
            shower: false,
            dialogPortUp: false,
            portStateUp: '',
            portNameUp: '',
            brandId: '',
            portId: '',
            brandNameAdd: '',
            portNameAddArray: []
        },

        mounted: function () {
            var _this = this;
            axios.post('${pageContext.request.contextPath}/pro/queryPort')
                .then(function (res) {
                    _this.FirstTab = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })
        },

        methods: {

            handleClose(done) {      //确认关闭弹出框
                this.$confirm('确认关闭？')
                    .then(function (res) {
                        done();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            portAdd: function () {     //接口新增
                var _this = this;
                _this.dialogPortAdd = true

                axios.post('${pageContext.request.contextPath}/pro/selectBrandName')        //回显下拉框品哦名
                    .then(function (res) {
                        console.log(res.data)
                        _this.portNameAddArray = res.data
                    })
                    .catch(function (error) {
                        console.log(error)
                    })

            },


            portUpdate: function (row) {
                var _this = this;
                _this.dialogPortUp = true
                _this.portNameUp = row.portName
                _this.portStateUp = row.portState
                _this.portId = row.portId      //修改的ID是主键
            },

            portAddCom: function () {      //接口新增
                var _this = this;
                alert(_this.brandNameAdd);
                axios.post('${pageContext.request.contextPath}/pro/portAdd', {
                    brandId: _this.brandNameAdd,
                    portName: _this.brandNameAdd,
                    portState: '停用中',
                })
                    .then(function (res) {
                        alert("添加成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },


            portUpdateCom: function () {       //接口修改，只能修改状态
                var _this = this;

                axios.post('${pageContext.request.contextPath}/pro/portSet', {
                    portId: _this.portId,
                    portState: _this.portStateUp
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            selectLike: function () {          //模糊查询
                var _this = this;
                axios.post('${pageContext.request.contextPath}/pro/selectLike', {
                    brandId: _this.brandId,
                    portState: _this.portstateLike
                })
                    .then(function (res) {
                        _this.FirstTab = res.data
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            }

        },
    })
</script>

</html>
