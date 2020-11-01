<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>品类区分配置</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
</head>
<body>
<div id="app">
    <div style="margin-top:50px;margin-left: 50px; ">
    <template>
        <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
            <el-tab-pane label="取消原因" name="first">
                综合查询：<el-input style="width: 200px;" v-model="proName"></el-input>
                <template>
                    品类：<el-select v-model="value1" placeholder="请选择">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
                </template>
                <template>
                    状态：<el-select v-model="value2" placeholder="全部">
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
                    <el-button>导出</el-button>
                    <el-button>新增</el-button>
                    <el-button>修改</el-button>
                </div>

                <div  style="margin-top: 30px;">
                    <template>
                        <el-table
                                :data="tableData1"
                                border
                                style="width: 100%">
                            <el-table-column
                                    prop="date"
                                    label="品类"
                                    width="180">
                            </el-table-column>
                            <el-table-column
                                    prop="name"
                                    label="取消原因名称"
                                    width="180">
                            </el-table-column>
                            <el-table-column
                                    prop="address"
                                    label="状态">
                            </el-table-column>
                            <el-table-column fixed="right" label="操作" width="100">
                                <template slot-scope="scope">
                                    <el-button type="text" size="small">编辑</el-button>
                                </template>
                            </el-table-column>
                        </el-table>
                    </template>
                </div>

            </el-tab-pane>
            <el-tab-pane label="回访内容" name="second">
                综合查询：<el-input style="width: 200px;" v-model="proName2"></el-input>
                <template>
                    品类：<el-select v-model="value3" placeholder="请选择">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
                </template>
                <template>
                    状态：<el-select v-model="value4" placeholder="全部">
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
                    <el-button>导出</el-button>
                    <el-button>新增</el-button>
                    <el-button>修改</el-button>
                </div>

                <div  style="margin-top: 30px;">
                    <template>
                        <el-table
                                :data="tableData2"
                                border
                                style="width: 100%">
                            <el-table-column
                                    prop="date"
                                    label="品类"
                                    width="180">
                            </el-table-column>
                            <el-table-column
                                    prop="name"
                                    label="取消原因名称"
                                    width="180">
                            </el-table-column>
                            <el-table-column
                                    prop="address"
                                    label="状态">
                            </el-table-column>
                            <el-table-column fixed="right" label="操作" width="100">
                                <template slot-scope="scope">
                                    <el-button type="text" size="small">编辑</el-button>
                                </template>
                            </el-table-column>
                        </el-table>
                    </template>
                </div>

            </el-tab-pane>
            <el-tab-pane label="维修措施归类" name="third">

                综合查询：<el-input style="width: 200px;" v-model="proName3"></el-input>
                <template>
            维修措施： <el-select v-model="value5" placeholder="请选择" style="width: 180px;">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
                </template>

                <template>
                    维修措施大类： <el-select v-model="value6" placeholder="请选择" style="width: 180px;">
                    <el-option
                            v-for="item in options"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
                </template>
                <template>
                  品类：  <el-select v-model="value7" placeholder="请选择" style="width: 180px;">
                        <el-option
                                v-for="item in options"
                                :key="item.value"
                                :label="item.label"
                                :value="item.value">
                        </el-option>
                    </el-select>
                </template>


                <template>
                    状态： <el-select v-model="value8" placeholder="全部" style="width: 180px;">
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
                    <el-button>导出</el-button>
                    <el-button>新增</el-button>
                    <el-button>修改</el-button>
                </div>

                <div style="margin-top: 30px;">
                    <template>
                        <el-table
                                :data="tableData3"
                                border
                                style="width: 100%">
                            <el-table-column
                                    prop="date"
                                    label="品类"
                                    width="180">
                            </el-table-column>
                            <el-table-column
                                    prop="name"
                                    label="维修措施"
                                    width="180">
                            </el-table-column>
                            <el-table-column
                                    prop="address"
                                    label="维修措施类型">
                            </el-table-column>
                            <el-table-column
                                    prop="address"
                                    label="状态">
                            </el-table-column>

                            <el-table-column fixed="right" label="操作" width="100">
                                <template slot-scope="scope">
                                    <el-button type="text" size="small">编辑</el-button>
                                </template>
                            </el-table-column>
                        </el-table>
                    </template>
                </div>

            </el-tab-pane>
        </el-tabs>
    </template>
</div>
</div>
</body>

<script>
    new Vue({
        el:"#app",
        data:{
            proName:'',
            proName2:'',
            proName3:'',

            tableData1:[],
            tableData2:[],
            tableData3:[],
            value1:'',
            value2:'',
            value3:'',
            value4:'',
            value5:'',
            value6:'',
            value7:'',
            value8:'',
            value8:'',
        },
        methods:{

        }
    })
</script>
</html>
