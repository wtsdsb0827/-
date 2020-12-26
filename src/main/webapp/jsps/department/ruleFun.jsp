<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色功能配置</title>
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
            <el-input style="width: 200px;" v-model="roleNameLike"></el-input>
            <template>
                角色类型：
                <el-select v-model="roleKindLike" placeholder="全部">
                    <el-option
                            v-for="item in roleKindLikeArray"
                            :label="item.roleKind"
                            :value="item.roleKind">
                    </el-option>
                </el-select>
            </template>

            <div style="margin-top: 30px;margin-left: 200px;">
                <el-button @click="selectLikeButton">查询</el-button>
                <el-button @click="AddRoleButton">新增</el-button>
            </div>

            <el-dialog
                    title="角色功能新增"
                    :visible.sync="dialogVisibleAdd"
                    width="30%"
                    :before-close="handleClose">

                <template>
                    角色类型：
                    <el-select v-model="roleKindAdd" placeholder="全部">
                        <el-option
                                v-for="item in roleKindLikeArray"
                                :label="item.roleKind"
                                :value="item.roleKind">
                        </el-option>
                    </el-select>
                </template>
                <br/><br/>

                角色名称：
                <el-input style="width: 220px;" v-model="roleNameAdd"></el-input>

                <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="AddRoleSubmit">确 定</el-button>
                          <el-button @click="dialogVisibleAdd = false">取 消</el-button>
                </span>
            </el-dialog>
            <el-dialog
                    title="角色功能修改"
                    :visible.sync="dialogVisibleSet"
                    width="30%"
                    :before-close="handleClose">

                角色类型：
                <el-input style="width: 220px;" v-model="roleKindSet"></el-input>
                <br/><br/>
                角色名称：
                <el-input style="width: 220px;" v-model="roleNameSet"></el-input>
                <br/><br/>
                用户名称：
                <el-input style="width: 220px;" v-model="userNameSet"></el-input>

                <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="SetRoleSubmit">确 定</el-button>
                          <el-button @click="dialogVisibleSet = false">取 消</el-button>
                </span>
            </el-dialog>

            <div style="margin-top: 30px;">
                <template>
                    <el-table
                            :data="FirstTab"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="roleKind"
                                label="角色类型"
                                width="500">
                        </el-table-column>
                        <el-table-column
                                prop="roleName"
                                label="角色名称"
                                width="600">
                        </el-table-column>
                        <el-table-column fixed="right" label="操作" width="300">
                            <template slot-scope="scope">
                                <el-button type="text" size="big" @click="SetRoleButton(scope.row)">编辑</el-button>
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
            roleNameLike: '',
            roleNameAdd: '',
            roleKindLike: '',
            roleKindAdd: '',
            roleKindLikeArray: [],
            FirstTab: [],
            dialogVisibleAdd: false,
            dialogVisibleSet: false,
            roleKindSet: '',
            roleNameSet: '',
            userNameSet: '',
        },

        mounted: function () {
            var t = this;
            axios.post('${pageContext.request.contextPath}/pro/selectRoleKind')
                .then(function (res) {
                    t.roleKindLikeArray = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })


            axios.post('${pageContext.request.contextPath}/pro/selectAllRole')
                .then(function (res) {
                    t.FirstTab = res.data
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

            selectLikeButton: function () {      //模糊查询
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/selectRoleLike', {
                    roleName: t.roleNameLike,
                    roleKind: t.roleKindLike
                })
                    .then(function (res) {
                        t.FirstTab = res.data
                        console.log(res.data)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            AddRoleButton: function () {         //点击添加按钮触发函数
                var t = this;
                t.dialogVisibleAdd = true

            },

            AddRoleSubmit: function () {         //点击添加按钮进行添加
                var t = this;
                if (t.roleKindAdd == "") {
                    alert("角色类型不能为空")
                } else {
                    axios.post('${pageContext.request.contextPath}/pro/selectRoleAdd', {
                        roleName: t.roleNameAdd,
                    })//添加之前先去查询数据库中是否已经存在相同名字的管理员
                        .then(function (res) {
                            console.log(res.data);
                            if (res.data == true) {
                                alert("职位已经存在，拒绝添加")
                            }
                            else {
                                axios.post('${pageContext.request.contextPath}/pro/AddRole', {
                                    roleName: t.roleNameAdd,
                                    roleKind: t.roleKindAdd
                                })
                                    .then(function (res) {
                                        console.log(res.data)
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

            SetRoleButton: function (row) {     //点击编辑按钮触发事件
                var t = this;
                t.dialogVisibleSet = true
                t.roleKindSet = row.roleKind,
                    t.roleNameSet = row.roleName,
                    t.userNameSet = row.userName
            },


            SetRoleSubmit: function () {         //点击确定按钮修改角色
                var t = this;
            }


        }
    })
</script>

</html>
