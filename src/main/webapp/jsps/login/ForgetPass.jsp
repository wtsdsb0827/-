<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>

    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>

    <style>
        .back {
            background: url("${pageContext.request.contextPath}/static/images/3.jpg");
            background-size: 100% 100%;
            height: 750px;
            margin-top: 15px;
            padding-top: 200px;
        }
    </style>
</head>
<body>
<div id="app">

    <div class="back">
        <div style="width:450px;height:500px;background: white;margin: 0 auto;padding-left: 100px;margin-left: 1100px;padding-left: 90px">
            <el-image :src="pic2" style="width:300px;height: 110px;padding-left: 35px;"></el-image>
            <el-form style="width: 400px;height: 300px;" :model="ruleForm" label-width="100px">


                <el-form-item label="手机号" prop="userPhone">
                    <el-input style="width: 200px;" type="text" placeholder="请输入手机号" v-model="ruleForm.userPhone"
                              autocomplete="off"></el-input>
                </el-form-item>

                <el-form-item label="验证码" style="width: 600px;" prop="userCode">
                    <el-input style="width: 100px;" type="text" placeholder="请输入验证码" v-model="ruleForm.userCode"
                              autocomplete="off"></el-input>&nbsp;&nbsp;
                    <el-button style="width: 92px;padding-left: 9px" type="primary" v-on:click="getCode">获取验证码
                    </el-button>
                </el-form-item>

                <el-form-item label="新密码" prop="userPassword">
                    <el-input style="width: 200px;" type="password" placeholder="请输入新密码" v-model="ruleForm.userPassword"
                              autocomplete="off"></el-input>
                </el-form-item>

                <el-form-item label="密码确认" prop="RePassword">
                    <el-input style="width: 200px;" type="password" placeholder="请确认输入密码" v-model="ruleForm.RePassword"
                              autocomplete="off"></el-input>
                </el-form-item>

                <el-form-item style="margin-left: -90px;">
                    <el-button type="primary" style="width: 330px;" v-on:click="SetPass">修改</el-button>
                </el-form-item>

                <el-form-item style="margin-left: -90px;">
                    <el-link href="${pageContext.request.contextPath}/jsps/login/departmentLogin.jsp">返回登录</el-link>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <el-link href="${pageContext.request.contextPath}/index.jsp">返回首页</el-link>

                </el-form-item>


            </el-form>
        </div>
    </div>

</div>
</body>

<script>
    new Vue({
        el: "#app",
        data: {
            pic2: '${pageContext.request.contextPath}/static/images/1.jpg',
            ruleForm: {
                userPhone: '',
                userPassword: '',
                RePassword: '',
                userCode: '',

            },
            code: ''
        },

        methods: {

            //获取验证码操作
            getCode: function () {
                var vv = this;
                axios.post('${pageContext.request.contextPath}/pro/getCoders', {
                    userPhone: vv.ruleForm.userPhone,
                })
                    .then(function (res) {
                        if (res.data.userPhone != vv.ruleForm.userPhone)
                            alert("该手机号未在平台下注册！！！")
                        else {
                            axios.post('${pageContext.request.contextPath}/pro/getCode', {
                                userPhone: vv.ruleForm.userPhone,
                            })
                                .then(function (res) {
                                    vv.code = res.data
                                    console.log(res.data)
                                })
                                .catch(function (error) {
                                    console.log(error)
                                })
                        }

                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },


            //修改密码
            SetPass: function () {
                var t = this;
                var userPhone = t.ruleForm.userPhone;
                var userPassword = t.ruleForm.userPassword;
                var RePassword = t.ruleForm.RePassword
                var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
                if (t.ruleForm.userPhone == "") {
                    alert("请输入手机号")
                } else if (!myreg.test(t.ruleForm.userPhone)) {
                    alert("手机号格式不正确");
                } else if (t.ruleForm.userCode == "") {
                    alert("请先输入验证码")
                } else if (t.code != t.ruleForm.userCode) {
                    alert("两次输入结果不一致")
                } else if (t.ruleForm.userPassword == "") {
                    alert("请输入新密码")
                } else if (t.ruleForm.RePassword == "") {
                    alert("请确认密码")
                } else if (t.ruleForm.userPassword != t.ruleForm.RePassword) {
                    alert("两次密码输入不一致，请重新输入")
                } else {
                    axios.post('${pageContext.request.contextPath}/pro/SetPass', {
                        userPassword: userPassword,
                        userPhone: userPhone
                    })
                        .then(function (res) {
                            alert("密码修改成功")
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                }


            }


        }
    })
</script>
</html>