<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>厂商登录</title>

    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>

    <style>
        .back{
            background:url("${pageContext.request.contextPath}/static/images/2.jpg");
            background-size:100% 100%;
            height: 570px;
            padding-top: 200px;
        }

        .nc_scale {
            background: #e8e8e8 !important;
        }
        .nc_scale div.bc_bg {
            background: #7ac23c !important;
        }
        .nc_scale .scale_text2 {
            color: #fff !important;
        }
        .nc_scale span {
            border: 1px solid #ccc !important;
        }
        .errloading {
            border: #faf1d5 1px solid !important;
            color: #ef9f06 !important;
        }

    </style>

    <script>
    window.NVC_Opt = {
    appkey: "FFFF0N00000000009939",
    scene: "ic_login",
    trans: {"key1": "code0", "nvcCode":200},
    elements: [
    "//img.alicdn.com/tfs/TB17cwllsLJ8KJjy0FnXXcFDpXa-50-74.png",
    "//img.alicdn.com/tfs/TB17cwllsLJ8KJjy0FnXXcFDpXa-50-74.png"
    ],
    bg_back_prepared: "//img.alicdn.com/tps/TB1skE5SFXXXXb3XXXXXXXXXXXX-100-80.png",
    bg_front: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABQCAMAAADY1yDdAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAADUExURefk5w+ruswAAAAfSURBVFjD7cExAQAAAMKg9U9tCU+gAAAAAAAAAIC3AR+QAAFPlUGoAAAAAElFTkSuQmCC",
    obj_ok: "//img.alicdn.com/tfs/TB1rmyTltfJ8KJjy0FeXXXKEXXa-50-74.png",
    bg_back_pass: "//img.alicdn.com/tfs/TB1KDxCSVXXXXasXFXXXXXXXXXX-100-80.png",
    obj_error: "//img.alicdn.com/tfs/TB1q9yTltfJ8KJjy0FeXXXKEXXa-50-74.png",
    bg_back_fail: "//img.alicdn.com/tfs/TB1w2oOSFXXXXb4XpXXXXXXXXXX-100-80.png",
    /*upLang:{"cn":{
    _ggk_guide: "请摁住鼠标左键，刮出两面盾牌",
    _ggk_success: "恭喜您成功刮出盾牌<br/>继续下一步操作吧",
    _ggk_loading: "加载中",
    _ggk_fail: ["呀，盾牌不见了<br/>请","javascript:noCaptcha.reset()","再来一次","或","https://survey.taobao.com/survey/QgzQDdDd?token=%TOKEN","反馈问题"],
    _ggk_action_timeout: ["我等得太久啦<br/>请","javascript:noCaptcha.reset()","再来一次","或","https://survey.taobao.com/survey/QgzQDdDd?token=%TOKEN","反馈问题"],
    _ggk_net_err: ["网络实在不给力<br/>请","javascript:noCaptcha.reset()","再来一次","或","https://survey.taobao.com/survey/QgzQDdDd?token=%TOKEN","反馈问题"],
    _ggk_too_fast: ["您刮得太快啦<br/>请","javascript:noCaptcha.reset()","再来一次","或","https://survey.taobao.com/survey/QgzQDdDd?token=%TOKEN","反馈问题"]
    }
    }*/
    }
    </script>
    <script src="//g.alicdn.com/sd/nvc/1.1.112/guide.js"></script>
    <script>
        window.onload = function(){
            var ic = new smartCaptcha({
                renderTo: '#sc',
                width: 300,
                height: 42,
                default_txt: "点击按钮开始智能验证",
                success_txt: "验证成功",
                fail_txt: "验证失败，请在此点击按钮刷新",
                scaning_txt: "智能检测中",
                success: function(data) {
                    console.log(NVC_Opt.token)
                    console.log(data.sessionID);
                    console.log(data.sig);
                },
            });
            ic.init();
        }

    </script>

</head>

<body>



    <div id="app">

            <div class="back">
                <div style="width:450px;height:390px;background: white;margin: 0 auto;padding-left: 100px;">
                    <el-image :src="pic2" style="width:300px;height: 110px;padding-left: 35px;"></el-image>
                    <el-form style="width: 400px;height: 300px;" :model="ruleForm"   label-width="100px">

                        <el-form-item label="手机号"  prop="userPhone">
                            <el-input style="width: 200px;" type="text" placeholder="请输入手机号" v-model="ruleForm.userPhone" autocomplete="off"></el-input>
                        </el-form-item>

                        <el-form-item label="密码"  prop="userPassword">
                            <el-input style="width: 200px;" type="password" placeholder="请输入密码" v-model="ruleForm.userPassword" autocomplete="off"></el-input>
                        </el-form-item>

                        <script src="//g.alicdn.com/sd/smartCaptcha/0.0.1/index.js"></script>
                        <div id="sc" style="margin-top: 20px;margin-left: 20px;margin-bottom: 15px;"></div>

                        <el-form-item style="margin-left: -90px;">
                            <el-button type="primary" style="width: 330px;"v-on:click="SubLogin">登录</el-button>
                        </el-form-item>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                           <el-link href="${pageContext.request.contextPath}/index.jsp">返回首页</el-link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <el-link href="${pageContext.request.contextPath}/jsps/login/manufactureTest.jsp">手机验证码登录</el-link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                code: ''
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
                        location.href="${pageContext.request.contextPath}/jsps/login/AllLogin.jsp"
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },



        }


    })
</script>
</html>