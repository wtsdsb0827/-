<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
<script src="${pageContext.request.contextPath}/static/element/index.js"></script>
<script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
<body>

<div id="vue" style="margin:-8px;">
    <div>
        <el-menu :default-active="activeIndex" mode="horizontal" active-text-color="#ffd04b">
            <el-menu-item>
                <el-image :src="photo" style="margin-left: 250px;"></el-image>
            </el-menu-item>
            <el-menu-item index="1" style="margin-left: 200px;">首页</el-menu-item>
            <el-menu-item index="2" style="margin-left: 50px;">我要下单</el-menu-item>
            <el-menu-item index="3" style="margin-left: 50px;">关于山山</el-menu-item>
            <el-menu-item index="4" style="margin-left: 50px;">APP下载</el-menu-item>
            <el-submenu index="5" style="margin-left: 50px;">
                <template slot="title">登录/注册</template>
                <el-menu-item index="2-1">
                    <el-link href="${pageContext.request.contextPath}/jsps/login/departmentLogin.jsp" target="_blank">
                        登录
                    </el-link>
                </el-menu-item>
                <el-menu-item index="2-1">
                    <el-link href="${pageContext.request.contextPath}/jsps/login/departmentRegister.jsp"
                             target="_blank">注册
                    </el-link>
                </el-menu-item>

            </el-submenu>
        </el-menu>
    </div>

    <%--轮播图--%>
    <template>
        <el-carousel :interval="3000" height="700px" arrow="always">
            <el-carousel-item v-for="oo in pic">
                <el-image :src="oo" style="height: 100%"></el-image>
            </el-carousel-item>
        </el-carousel>
    </template>
</div>


</body>


<script>

    new Vue({
        el: "#vue",
        data: {
            activeIndex: '1', /*默认显示颜色*/
            pic: [
                '${pageContext.request.contextPath}/static/images/5.jpg',
                '${pageContext.request.contextPath}/static/images/6.jpg',
                '${pageContext.request.contextPath}/static/images/7.jpg',
                '${pageContext.request.contextPath}/static/images/8.jpg'
            ],
            photo: '${pageContext.request.contextPath}/static/images/1.jpg',

        },
    })

</script>


</html>
