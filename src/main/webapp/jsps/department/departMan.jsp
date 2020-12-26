<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门管理</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
</head>
<body>

<div id="app">
    <div style="width: 300px;height: 100%;margin-top: 50px;margin-left: 50px;">
        <el-tree :data="treeArray"
                 :props="defaultProps"
                 default-expand-all
                 @node-click="handleNodeClick"
        <%--style="background-color: #EFDBDC"--%>
        ></el-tree>
    </div>
</div>

</body>

<script>
    new Vue({
        el: "#app",
        data: {
            defaultProps: {
                children: 'childList',
                label: 'departmentName'
            },
            treeArray: [],

        },
        methods: {
            handleNodeClick(data) {
                console.log(data);
            }
        },
        mounted: function () {
            var roleId =${user.userId};
            var _this = this;
            axios.post('${pageContext.request.contextPath}/pro/DepartmentNode', {
                roleId: roleId,
            })
                .then(function (res) {
                    _this.treeArray = res.data;
                })
                .catch(function (error) {
                    console.log(error)
                })
        }
    })
</script>

</html>
