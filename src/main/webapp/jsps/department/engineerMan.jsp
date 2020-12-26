<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工程师管理</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
</head>
<body>
<div id="app">
    <div style="margin-top:50px;margin-left: 50px; ">
        <template>
            综合查询：
            <el-input style="width: 200px;" v-model="proName"></el-input>
            <template>
                签约上游：
                <el-select v-model="value1" placeholder="全部">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </template>

            <template>
                省：
                <el-select v-model="value2" placeholder="全部">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
                市：
                <el-select v-model="value3" placeholder="全部">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
                区：
                <el-select v-model="value4" placeholder="全部">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
                <br/><br/><br/>
            </template>

            <template>
                状态：
                <el-select v-model="value5" placeholder="全部">
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
            </div>

            <div style="margin-top: 30px;">
                <template>
                    <el-table
                            :data="tableData"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="date"
                                label="工程师编码"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="签约上游"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="工程师姓名"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="工程师电话"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="省"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="市"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="区"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="详细地址"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="name"
                                label="状态"
                                width="120">
                        </el-table-column>

                        <el-table-column fixed="right" label="操作">
                            <template slot-scope="scope">
                                <el-button type="text" size="small">解约</el-button>
                                <el-button type="text" size="small">签约能力范围</el-button>
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
        el: "#app",
        data: {
            proName: '',
            tableData: [],
            value1: '',
            value2: '',
            value3: '',
            value4: '',
            value5: '',
            value6: '',
        },
        methods: {}
    })
</script>
</html>
