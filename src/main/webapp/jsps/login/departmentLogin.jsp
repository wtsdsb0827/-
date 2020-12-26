<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>

    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>

    <style>
        .back {
            background: url("${pageContext.request.contextPath}/static/images/2.jpg");
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
        <div style="width:450px;height:390px;background: white;margin: 0 auto;padding-left: 100px;">
            <el-image :src="pic2" style="width:300px;height: 110px;padding-left: 35px;"></el-image>
            <el-form style="width: 400px;height: 300px;" :model="ruleForm" label-width="100px">

                <el-form-item label="手机号" prop="userPhone">
                    <el-input style="width: 200px;" type="text" placeholder="请输入手机号" v-model="ruleForm.userPhone"
                              autocomplete="off"></el-input>
                </el-form-item>

                <el-form-item label="密码" prop="userPassword">
                    <el-input style="width: 200px;" type="password" placeholder="请输入密码" v-model="ruleForm.userPassword"
                              autocomplete="off"></el-input>
                </el-form-item>

                <el-form-item style="margin-left: -90px;">
                    <el-button type="primary" style="width: 330px;" v-on:click="SubLogin">登录</el-button>
                </el-form-item>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <el-link href="${pageContext.request.contextPath}/index.jsp">返回首页</el-link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <el-link href="${pageContext.request.contextPath}/jsps/login/manufactureTest.jsp">手机验证码登录</el-link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <el-link href="${pageContext.request.contextPath}/jsps/login/ForgetPass.jsp">忘记密码?</el-link>
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
            },
        },

        methods: {
            SubLogin: function () {
                var vv = this;
                var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
                if (vv.ruleForm.userPhone == "")
                    alert("请先输入手机号");
                else if (!myreg.test(vv.ruleForm.userPhone)) {
                    alert("手机号格式不正确");
                }
                else if (vv.ruleForm.userPassword == "") {
                    alert("请输入密码");
                }
                else {
                    axios.post('${pageContext.request.contextPath}/pro/LoginPro', {
                        userPhone: vv.ruleForm.userPhone,
                        userPassword: vv.ruleForm.userPassword
                    })
                        .then(function (res) {
                            if (vv.ruleForm.userPhone != res.data.userPhone && vv.ruleForm.userPassword != res.data.userPassword) {
                                alert("用户名或密码不正确")
                            } else {
                                location.href = "${pageContext.request.contextPath}/jsps/login/AllLogin.jsp"
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