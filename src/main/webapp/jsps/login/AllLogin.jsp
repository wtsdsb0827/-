<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
<script src="${pageContext.request.contextPath}/static/element/index.js"></script>
<script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
<script src="${pageContext.request.contextPath}/static/jquery/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-tab.js"></script>

<body>
<div id="app">


    <div class="row">
        <div style="height: 1200px;width: 300px;background-color: #eeeeee" class="col-sm-2">
            <el-input placeholder="输入关键字查询" v-model="filterText"></el-input>

            <el-tree class="filter-tree"
                     :props="defaultProps"
                     :data="treeArray"
                     @node-click="handleNodeClick"
                     default-expand-all
                     ref="tree"
                     style="background-color:#eeeeee "
            ></el-tree>
        </div>

        <div class="col-sm-10" style=" background-image:url('${pageContext.request.contextPath}/static/images/9.jpg')">
            <div style="margin-left: 1000px;margin-top: 25px;">
                <h4 style="color: red">当前用户：[${user.userName}]</h4>
                <h4>
                    <a href="${pageContext.request.contextPath}/jsps/login/departmentLogin.jsp">退出重新登录</a>
                </h4>
            </div>
            <iframe frameBorder=0 scrolling=auto width="100%" height="100%" :src="srchref"></iframe>
        </div>

    </div>


</div>
</body>


<script>


    new Vue({
        el: "#app",
        data: {
            treeArray: [],
            filterText: '',
            ii: '',
            defaultProps: {
                children: 'childList',
                label: 'permissionName'
            },
            srchref: "",


        },

        mounted: function () {
            var _this = this;
            var ii = ${user.userId}
                axios.post('${pageContext.request.contextPath}/pro/LoginTree', {
                    id: ii
                })
                    .then(function (res) {
                        _this.treeArray = res.data;
                    })
                    .catch(function (error) {
                        console.log(error)
                    })

        },

        methods: {
            handleNodeClick(data) {
                var _this = this;
                _this.srchref = "${pageContext.request.contextPath}/" + data.permissonUrl
            }
        },
    })
</script>

</html>
