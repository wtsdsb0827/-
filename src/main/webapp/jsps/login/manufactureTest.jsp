<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>厂商验证码登录</title>

    <style>
        .back{
            background:url("${pageContext.request.contextPath}/static/images/2.jpg");
            background-size:100% 100%;
            height: 570px;
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
                    <el-form style="width: 700px;height: 300px;" :model="ruleForm"   label-width="100px">

                        <el-form-item label="手机号"  prop="userPhone">
                            <el-input style="width: 200px;" type="text" placeholder="请输入手机号" v-model="ruleForm.userPhone" autocomplete="off"></el-input>
                        </el-form-item>

                        <el-form-item label="短信验证码"  prop="userPassword">
                            <el-input style="width: 200px;" type="text" placeholder="请输入短信验证码" v-model="ruleForm.userCode" autocomplete="off"></el-input>
                            <el-button type="primary" style="width: 100px;" v-on:click="getCode">获取验证码</el-button>
                        </el-form-item>


                        <el-form-item style="margin-left: -90px;">
                            <el-button type="primary" style="width: 330px;"v-on:click="SubLogin">登录</el-button>
                        </el-form-item>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                           <el-link href="${pageContext.request.contextPath}/index.jsp">返回首页</el-link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <el-link href="${pageContext.request.contextPath}/index.jsp">手机验证码登录</el-link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <el-link >忘记密码?</el-link>
                    </el-form>
                </div>
            </div>

    </div>
</body>

<script>
    new Vue({
      el:"#app",
        data:{
            pic2:'${pageContext.request.contextPath}/static/images/1.jpg',
            ruleForm: {
                userPhone: '',
                userPassword: '',
                userCode:'',
                code:'',
            },
        },

        methods:{
            SubLogin:function () {
                var vv = this;
                axios.post('${pageContext.request.contextPath}/pro/LoginUser',{
                    userPhone:vv.ruleForm.userPhone,
                    userPassword:vv.ruleForm.userPassword
                })
                    .then(function (res) {
                        location.href="${pageContext.request.contextPath}/jsps/common/AllLogin.jsp"
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            //获取验证码操作
            getCode:function () {
                var vv = this;
                axios.post('${pageContext.request.contextPath}/pro/getCode',{
                    userPhone:vv.ruleForm.userPhone,
                })
                    .then(function (res) {
                        vv.code=res.data
                        console.log(res.data)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            }



        }


    })
</script>
</html>
