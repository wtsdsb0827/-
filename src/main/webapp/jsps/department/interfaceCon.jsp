<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>接口配置</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
</head>
<body>
<div id="app">
    <div style="margin-top:50px;margin-left: 50px; ">
        <template>
                    综合查询：<el-input style="width: 200px;" v-model="proName"></el-input>
                    <template>
                        状态：<el-select v-model="value1" placeholder="全部">
                        <el-option
                                v-for="item in options"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value">
                        </el-option>
                    </el-select>
                    </template>

                    <div style="margin-top: 30px;margin-left: 350px;">
                        <el-button>查询</el-button>
                        <el-button>新增</el-button>
                        <el-button>修改</el-button>
                    </div>

                    <div  style="margin-top: 30px;">
                        <template>
                            <el-table
                                    :data="tableData"
                                    border
                                    style="width: 100%">
                                <el-table-column
                                        prop="date"
                                        label="部门名称"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="name"
                                        label="部门工号"
                                        width="180">
                                </el-table-column>
                                <el-table-column fixed="right" label="操作" >
                                    <template slot-scope="scope">
                                        <el-button type="text" size="small">编辑</el-button>
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
        el:"#app",
        data:{
            proName:'',
            tableData:[],
            value1:'',
        },
        methods:{

        }
    })
</script>

</html>
