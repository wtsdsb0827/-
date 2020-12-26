<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>验证码登录</title>

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
<script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
<script src="${pageContext.request.contextPath}/static/element/index.js"></script>
<script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
<body>


<div id="app">

    <div class="back">
        <div style="width:450px;height:390px;background: white;margin: 0 auto;padding-left: 100px;">
            <el-image :src="pic2" style="width:300px;height: 110px;padding-left: 35px;"></el-image>
            <el-form style="width: 700px;height: 300px;" :model="ruleForm" label-width="100px">

                <el-form-item label="手机号" prop="userPhone">
                    <el-input style="width: 200px;" type="text" placeholder="请输入手机号" v-model="ruleForm.userPhone"
                              autocomplete="off"></el-input>
                </el-form-item>

                <el-form-item label="短信验证码" prop="userCode">
                    <el-input style="width: 200px;" type="text" placeholder="请输入短信验证码" v-model="ruleForm.userCode"
                              autocomplete="off"></el-input>
                    <el-button type="primary" style="width: 100px;" v-on:click="getCode">获取验证码</el-button>
                </el-form-item>


                <el-form-item style="margin-left: -90px;">
                    <el-button type="primary" style="width: 330px;" v-on:click="SubLogin">登录</el-button>
                </el-form-item>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <el-link href="${pageContext.request.contextPath}/jsps/login/departmentLogin.jsp">返回上一页</el-link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                userCode: '',
                code: '',
            },
        },

        methods: {
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


            SubLogin: function () {
                var vv = this;
                var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
                if (vv.ruleForm.userPhone == "") {
                    alert("请先输入手机号")
                } else if (!myreg.test(vv.ruleForm.userPhone)) {
                    alert("手机号格式不正确");
                } else if (vv.code == "") {
                    alert("请输入验证码")
                } else if (vv.code != vv.ruleForm.userCode) {
                    alert("验证码有误，拒绝登录")
                } else {
                    axios.post('${pageContext.request.contextPath}/pro/PhoneLogin', {        //登录操作，到后台将登录的用户存到session中
                        userPhone: vv.ruleForm.userPhone,
                    })
                        .then(function (res) {
                            console.log(res.data)
                            location.href = "${pageContext.request.contextPath}/jsps/login/AllLogin.jsp"
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
