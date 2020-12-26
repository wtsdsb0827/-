<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>厂商管理</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div id="app">
    <div style="margin-top:50px;margin-left: 50px; ">
        <template>
            综合查询：
            <el-input style="width: 200px;" v-model="MaLikeName"></el-input>
            <template>
                厂商类型：
                <el-select v-model="ManLikeType" placeholder="全部">
                    <el-option
                            v-for="item in TypeArray"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </template>

            <template>
                省市区：
                <el-select @change="queryProvince" v-model="ManLikeProvince" placeholder="全部">
                    <el-option
                            v-for="item in ProvinceArray"
                            :label="item.provincePro"
                            :value="item.provincePro">
                    </el-option>
                </el-select>
                <el-select @change="queryCity" v-model="ManLikeCity" placeholder="全部">
                    <el-option v-for="item in CityArray"
                               :label="item.provinceCity"
                               :value="item.provinceCity">
                    </el-option>
                </el-select>
                <el-select v-model="ManLikeArea" placeholder="全部">
                    <el-option v-for="item in AreaArray"
                               :label="item.provinceArea"
                               :value="item.provinceArea">
                    </el-option>
                </el-select>

                <br/><br/><br/>
            </template>

            <template>
                状态：
                <el-select v-model="ManLikeState" placeholder="全部">
                    <el-option
                            v-for="item in StateArry"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </template>

            <template>
                签约部门：
                <el-select v-model="ManLikeDept" placeholder="全部">
                    <el-option
                            v-for="item in deptArray"
                            :label="item.departmentName"
                            :value="item.departmentId">
                    </el-option>
                </el-select>
            </template>

            <div style="margin-top: 30px;margin-left: 350px;">
                <el-button>查询</el-button>
                <el-button>新增厂商</el-button>
            </div>

            <div style="margin-top: 30px;">
                <template>
                    <el-table
                            :data="tableData"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="manufacturerCode"
                                label="厂商编码"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="manufacturerType"
                                label="厂商类型"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="manufacturerName"
                                label="厂商公司名称"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="departmentName"
                                label="签约部门"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="manufacturerPhone"
                                label="厂商电话"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="manfactureDeposit"
                                label="账户余额"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="provincePro"
                                label="省"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="provinceCity"
                                label="市"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="provinceArea"
                                label="区"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="manufactureAddress"
                                label="详细地址"
                                width="120">
                        </el-table-column>
                        <el-table-column
                                prop="manufactureState"
                                label="状态"
                                width="120">
                        </el-table-column>

                        <el-table-column fixed="right" label="操作">
                            <template slot-scope="scope">
                                <el-button type="text" size="big">解约</el-button>
                                <el-button type="text" size="big">编辑</el-button>
                                <el-button type="text" size="big">签约</el-button>
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
            MaLikeName:'',
            ManLikeType:'',
            cityLike:'',
            ManLikeState:'',
            ManLikeDept:'',
            tableData: [],
            deptArray:[],
            ManLikeProvince:'',
            ManLikeCity:'',
            ManLikeArea:'',
            ProvinceArray:[],
            CityArray:[],
            AreaArray:[],
            TypeArray:[{label:'预付类型',value:'预付类型'},{label:'固定结算型',value:'固定结算型'}],
            StateArry:[{label:'使用中',value:'使用中'},{label:'停用中',value:'停用中'}],
            defaultProps: {
                value: 'provinceId',
                label: 'procityarea',
                children: 'childList',
            },
        },
        mounted:function(){
          var t = this;


          axios.post('${pageContext.request.contextPath}/pro/selectManAll')     //厂商全查
              .then(function (res) {
                  console.log(res.data)
                  t.tableData = res.data
              })
              .catch(function (error) {
                  console.log(error)
              })


            axios.post('${pageContext.request.contextPath}/pro/selectProvince')       //查询省市区下拉
                .then(function (res) {
                    t.ProvinceArray = res.data
                })
                .catch(function (error) {
                    console.log(error)
                })

            axios.post('${pageContext.request.contextPath}/pro/selectDepartment')       //查询签约部门下拉
                .then(function (res) {
                    t.deptArray = res.data
                })
                .catch(function (error) {
                    console.log(error)
                })

        },
        methods: {

            queryProvince:function () {     //根据第一级查询第二级
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/selectCity',{
                    provincePro:t.ManLikeProvince
                })
                    .then(function (res) {
                        t.CityArray = res.data
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },
            queryCity:function () {      //根据第二级查询第三级
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/selectArea',{
                    provinceCity:t.ManLikeCity
                })
                    .then(function (res) {
                        t.AreaArray = res.data
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            }

        }
    })
</script>

</html>
