<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告管理</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
</head>
<body>
<div id="app">
    <div style="margin-top:50px;margin-left: 50px; ">
        <template>
            <div style="width: 100%">

                    综合查询：<el-input style="width: 200px;" v-model="proName"></el-input>

                       <template>
                               发布时间： <el-date-picker v-model="value1" type="datetime" placeholder="选择开始时间"></el-date-picker>
                               截止时间： <el-date-picker v-model="value2" type="datetime" placeholder="选择截止时间"></el-date-picker><br/><br/>
                       </template>
                    <template>
                        发布部门：<el-select v-model="value3" placeholder="全部">
                        <el-option
                                v-for="item in options"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value">
                        </el-option>
                    </el-select>
                    </template>

                    <template>
                        发布人：<el-select v-model="value4" placeholder="全部">
                        <el-option
                                v-for="item in options"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value">
                        </el-option>
                    </el-select>
                    </template>

            </div>


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
                                prop="id"
                                label="序号"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="标题"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="jurisdiction"
                                label="关键字"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="jurisdiction1"
                                label="发布部门"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="jurisdiction2"
                                label="发布人"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="jurisdiction3"
                                label="发布时间"
                                width="180">
                        </el-table-column>
                        <el-table-column
                                prop="jurisdiction4"
                                label="截止时间"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="jurisdiction5"
                                label="浏览人数"
                                width="100">
                        </el-table-column>
                        <el-table-column fixed="right" label="操作">
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
            value2:'',
            value3:'',
            value4:'',
        },
        methods:{

        }
    })
</script>
</html>
