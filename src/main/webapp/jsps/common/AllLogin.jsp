<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
        <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
        <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
        <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
<body>
    <div id="app">

        <div style="height: 100%;width: 300px;">
            <el-input placeholder="输入关键字查询" v-model="filterText"></el-input>

            <el-tree class="filter-tree"
                     :props="defaultProps"
                     :data="treeArray"
                     ref="tree"
            ></el-tree>
        </div>



    </div>
</body>


    <script>


        new Vue({
            el:"#app",
            data:{
                treeArray: [],
                defaultProps: {
                    children: 'childList',
                    label: 'permissionName'
                },
                    filterText: '',
                ii:'',

            },

            mounted: function () {
                var _this = this;
               var ii = ${user.roleId}
                axios.post('${pageContext.request.contextPath}/pro/LoginTree',{
                    id:ii
                })
                    .then(function (res) {
                        _this.treeArray = res.data;
                        console.log(res.data)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })

            },

            methods:{


            },

        })
    </script>

</html>
