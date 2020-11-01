<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>规则维护</title>

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
                    <el-tab-pane label="产品层次" name="first">
                        <template>
                           产品层次： <el-select v-model="value1" placeholder="请选择">
                                <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </template>
                        <template>
                            <el-select v-model="value2" placeholder="请选择">
                                <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </template>
                        <template>
                            <el-select v-model="value3" placeholder="请选择">
                                <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </template>
                        <template>
                            状态：<el-select v-model="value4" placeholder="请选择">
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
                                            label="二级品类"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="商品组">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="状态">
                                    </el-table-column>


                                    <el-table-column fixed="right" label="操作" width="100">
                                        <template slot-scope="scope">
                                            <el-button type="text" size="small">停用</el-button>
                                            <el-button type="text" size="small">启用</el-button>
                                        </template>
                                    </el-table-column>
                                </el-table>
                            </template>
                        </div>

                    </el-tab-pane>
                    <el-tab-pane label="型号归类" name="second">

                        <template>
                           品牌： <el-select v-model="value5" placeholder="请选择">
                                <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </template>
                        <template>
                            产品型号：<el-input style="width: 200px;" v-model="proSize"></el-input>
                        </template><br/><br/>
                        <template>
                           产品层次： <el-select v-model="value6" placeholder="请选择">
                                <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </template>
                        <template>
                            <el-select v-model="value7" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>
                        <template>
                            <el-select v-model="value8" placeholder="请选择">
                                <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </template>

                        <template>
                           状态： <el-select v-model="value9" placeholder="全部">
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
                                            label="二级品类"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="商品组">
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
                    <el-tab-pane label="销单规则" name="third">




                        <template>
                            品牌： <el-select v-model="value10" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>

                        <template>
                            品牌二级品类： <el-select v-model="value11" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>
                        <template>
                            <el-select v-model="value12" placeholder="请选择">
                                <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </template>


                        <template>
                            状态： <el-select v-model="value13" placeholder="全部">
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
                                            label="品牌"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="name"
                                            label="品类"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="二级品类">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="销单规则">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="销单图片张数要求">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="状态">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="测试条码">
                                    </el-table-column>


                                    <el-table-column fixed="right" label="操作" width="100">
                                        <template slot-scope="scope">
                                            <el-button type="text" size="small">编辑</el-button>
                                            <el-button type="text" size="small">测试</el-button>
                                        </template>
                                    </el-table-column>
                                </el-table>
                            </template>
                        </div>

                    </el-tab-pane>
                    <el-tab-pane label="工单等级归类" name="fourth">


                        <template>
                            工单类型<el-select v-model="value14" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>
                        <template>
                            工单内容分类： <el-select v-model="value15" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>
                        <template>
                          工单等级  <el-select v-model="value16" placeholder="请选择">
                                <el-option
                                        v-for="item in options"
                                        :key="item.value"
                                        :label="item.label"
                                        :value="item.value">
                                </el-option>
                            </el-select>
                        </template>


                        <template>
                            状态 <el-select v-model="value17" placeholder="全部">
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
                                        :data="tableData4"
                                        border
                                        style="width: 100%">
                                    <el-table-column
                                            prop="date"
                                            label="工单类型"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="name"
                                            label="工单内容分类"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="address"
                                            label="工单等级">
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
                    <el-tab-pane label="奖惩类型及原因归类" name="fifth">



                        <template>
                            奖惩类型<el-select v-model="value18" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>
                        <template>
                            奖惩原因： <el-select v-model="value19" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>

                        <template>
                            状态 <el-select v-model="value20" placeholder="全部">
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
                                        :data="tableData5"
                                        border
                                        style="width: 100%">
                                    <el-table-column
                                            prop="date"
                                            label="奖惩类型"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="name"
                                            label="奖惩原因"
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
                    <el-tab-pane label="短信模板" name="sixth">



                        <template>
                            品类：<el-select v-model="value21" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>
                        <template>
                            服务单状态： <el-select v-model="value22" placeholder="请选择">
                            <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                        </template>

                        <template>
                            状态 <el-select v-model="value23" placeholder="全部">
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
                                        :data="tableData6"
                                        border
                                        style="width: 100%">
                                    <el-table-column
                                            prop="date"
                                            label="品类"
                                            width="180">
                                    </el-table-column>
                                    <el-table-column
                                            prop="name"
                                            label="服务单状态"
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
                </el-tabs>
            </template>
        </div>
    </div>
</body>

<script>
    new Vue({
        el:"#app",
        data:{
            activeName:'',
            value1:'',
            value2:'',
            value3:'',
            value4:'',
            value5:'',
            value6:'',
            value7:'',
            value8:'',
            value8:'',
            value9:'',
            value10:'',
            value11:'',
            value12:'',
            value13:'',
            value14:'',
            value15:'',
            value16:'',
            value17:'',
            value18:'',
            value19:'',
            value20:'',
            value21:'',
            value22:'',
            value23:'',
            tableData1:[],
            tableData2:[],
            tableData3:[],
            tableData4:[],
            tableData5:[],
            tableData6:[],
            proSize:'',
        },
        methods:{

        }
    })
</script>
</html>
