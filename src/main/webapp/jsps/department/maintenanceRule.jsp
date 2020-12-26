<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>规则维护</title>

    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
    <script src="${pageContext.request.contextPath}/download/excel.js"></script>
    <script src="${pageContext.request.contextPath}/download/xlsx.core.min.js"></script>
</head>
<body>
<div id="app">
    <div style="margin-top:20px;margin-left: 50px; ">
        <template>
            <el-tabs v-model="activeName" type="card">
                <el-tab-pane label="产品层次" name="first">
                    <template>
                        产品层次：
                        <el-cascader :options="options" :props="defaultProps" v-model="proLike" clearable></el-cascader>

                        状态：
                        <el-select v-model="StateLike" placeholder="请选择">
                            <el-option
                                    v-for="item in ProStateArr"
                                    :label="item.productinfoState"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                    </template>


                    <el-dialog
                            title="产品层次新增"
                            :visible.sync="dialogVisible"
                            width="40%"
                            height="100%"
                            :before-close="handleClose">


                        <span v-if="showers">品类：</span>
                        <el-select v-model="addFirstPro" v-if="showers" placeholder="请选择">
                            <el-option

                                    v-for="item in FirstPinLeiArray"
                                    :label="item.prodtypeName"
                                    :value="item.prodtypeId">
                            </el-option>
                        </el-select>

                        <span v-if="shower" style="margin-left: 20px;">父节点名称：</span>
                        <el-input style="width: 190px;" v-if="shower" type="text" v-model="FatherProNode"></el-input>

                        <br/><br/><br/>
                        <span v-if="showers">二级品类：</span>
                        <el-input v-if="showers" style="width: 185px;" type="text" v-model="addSecondPro"></el-input>
                        <br/><br/><br/>


                        <span v-if="showers">商品组：</span>
                        <el-input v-if="showers" style="width: 200px;" type="text" v-model="addThirdPro"></el-input>


                        <span slot="footer" class="dialog-footer">
                                <el-button v-if="showers" type="primary" @click="ProCommit">确 定</el-button>
                                <el-button type="danger" v-if="shower" @click="ProCommit2">确 定</el-button>
                                <el-button @click="dialogVisible = false">取 消</el-button>
                                 <el-button type="danger" @click="AddFatherPro">添加父级品类</el-button>
                                 <el-button type="danger" @click="AddFatherProReset">重置</el-button>
                            </span>

                    </el-dialog>


                    <div style="margin-top: 30px;margin-left: 150px;">
                        <el-button @click="SelectLikeButton">查询</el-button>
                        <el-button @click="DownloadTemp">导出</el-button>
                        <el-button @click="AddProd">新增</el-button>
                        <el-button @click="flushReload">重置</el-button>
                    </div>

                    <div style="margin-top: 30px;">
                        <template>
                            <el-table
                                    id="TempId"
                                    :data="FirstTab"
                                    border
                                    style="width: 100%">
                                <el-table-column
                                        prop="productinfoId"
                                        v-if="show">
                                </el-table-column>
                                <el-table-column
                                        prop="productinfoType"
                                        label="品类"
                                        width="250">
                                </el-table-column>

                                <el-table-column
                                        prop="productinfoSecond"
                                        label="二级品类"
                                        width="250">
                                </el-table-column>
                                <el-table-column
                                        prop="productinfoGroup"
                                        label="商品组"
                                        width="250">
                                </el-table-column>
                                <el-table-column
                                        prop="productinfoState"
                                        label="状态"
                                        width="250">
                                </el-table-column>
                                <el-table-column fixed="right" label="操作" width="300">
                                    <template slot-scope="scope">
                                        <el-button type="text" @click="StartState(scope.row)"
                                                   v-if="scope.row.productinfoState=='停用中'">启用
                                        </el-button>
                                        <el-button type="text" @click="StopState(scope.row)"
                                                   v-if="scope.row.productinfoState=='使用中'">停用
                                        </el-button>
                                        <el-button type="text" @click="SetPro(scope.row)">修改</el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </template>
                    </div>
                </el-tab-pane>

                <el-dialog
                        title="产品层次修改"
                        :visible.sync="dialogVisibleSet"
                        width="40%"
                        height="100%"
                        :before-close="handleClose">


                    品类：
                    <el-input style="width: 235px;" type="text" v-model="SetFirstPro" disabled="disabled"></el-input>
                    <br/><br/>
                    二级品类：
                    <el-input style="width: 235px;" type="text" v-model="SetSecondPro"></el-input>
                    <br/><br/>
                    商品组：
                    <el-input style="width: 250px;" type="text" v-model="SetThirdPro"></el-input>
                    <br/><br/>

                    <template>
                        <el-radio v-model="usingss" label="使用中">使用中</el-radio>
                        <el-radio v-model="usingss" label="停用中">停用中</el-radio>
                    </template>


                    <span slot="footer" class="dialog-footer">
                                <el-button type="primary" @click="ProSetrCommit">确 定</el-button>
                                <el-button @click="dialogVisibleSet = false">取 消</el-button>
                            </span>

                </el-dialog>


                <el-tab-pane label="型号归类" name="second">

                    <template>
                        品牌：
                        <el-select v-model="BrandLike" placeholder="请选择">
                            <el-option
                                    v-for="item in BrandLikeArray"
                                    :key="item.brandId"
                                    :label="item.brandName"
                                    :value="item.brandId">
                            </el-option>
                        </el-select>
                    </template>
                    <template>
                        产品型号：
                        <el-input style="width: 200px;" v-model="productinfoLikeSize"></el-input>
                    </template>
                    <template>
                        产品层次：
                        <el-cascader :options="options" :props="defaultProps" v-model="ProCengciLike"
                                     clearable></el-cascader>
                    </template>


                    <template>
                        状态：
                        <el-select v-model="SizeLikeState" placeholder="全部">
                            <el-option
                                    v-for="item in ProStateArr"
                                    :label="item.productinfoState"
                                    :value="item.value">
                            </el-option>
                        </el-select>
                    </template>

                    <div style="margin-top: 30px;margin-left: 400px;">
                        <el-button @click="LikeSub">查询</el-button>
                        <el-button>导出</el-button>
                        <el-button @click="AddSizeButton">新增</el-button>
                    </div>

                    <el-dialog
                            title="产品层次增加"
                            :visible.sync="dialogSizeAdd"
                            width="40%"
                            height="100%"
                            :before-close="handleClose">


                        品牌：
                        <el-select v-model="BrandAdd" placeholder="请选择">
                            <el-option
                                    v-for="item in BrandLikeArray"
                                    :key="item.brandId"
                                    :label="item.brandName"
                                    :value="item.brandId">
                            </el-option>
                        </el-select>
                        <br/><br/>
                        产品层次：
                        <el-cascader :options="options" :props="defaultProps" v-model="ProCengciAdd"
                                     clearable></el-cascader>
                        <br/><br/>
                        产品型号：
                        <el-input style="width: 200px;" v-model="productinfoAddSize"></el-input>

                        <span slot="footer" class="dialog-footer">
                                <el-button type="primary" @click="AddSizeInfo">确 定</el-button>
                                <el-button @click="dialogSizeAdd = false">取 消</el-button>
                            </span>

                    </el-dialog>

                    <div style="margin-top: 30px;">
                        <template>
                            <el-table
                                    :data="SecondTab"
                                    border
                                    style="width: 100%">
                                <el-table-column
                                        prop="prodinfoId"
                                        v-if="showview">
                                </el-table-column>
                                <el-table-column
                                        prop="protypesizeId"
                                        v-if="showview">
                                </el-table-column>
                                <el-table-column
                                        prop="brandName"
                                        label="品牌"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="productinfoType"
                                        label="品类"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="productinfoSecond"
                                        label="二级品类"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="productinfoGroup"
                                        label="商品组">
                                </el-table-column>
                                <el-table-column
                                        prop="protypesizeName"
                                        label="产品型号"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="productinfoState"
                                        label="状态">
                                </el-table-column>

                                <el-table-column fixed="right" label="操作" width="200">
                                    <template slot-scope="scope">
                                        <el-button type="text" size="big" @click="SetSizeButton(scope.row)">编辑
                                        </el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </template>
                    </div>

                    <el-dialog
                            title="产品层次修改"
                            :visible.sync="dialogSizeSet"
                            width="40%"
                            height="100%"
                            :before-close="handleClose">

                        品牌：
                        <el-select v-model="BrandSet" disabled="disabled" placeholder="请选择">
                            <el-option
                                    v-for="item in BrandLikeArray"
                                    :key="item.brandId"
                                    :label="item.brandName"
                                    :value="item.brandId">
                            </el-option>
                        </el-select>
                        <br/><br/>
                        产品层次：
                        <el-cascader :options="options" :props="defaultProps" v-model="ThirdArray"
                                     clearable></el-cascader>
                        <br/><br/>
                        产品型号：
                        <el-input style="width: 200px;" v-model="productinfoSetSize"></el-input>

                        <template>
                            <el-radio v-model="using" label="使用中">使用中</el-radio>
                            <el-radio v-model="using" label="停用中">停用中</el-radio>
                        </template>

                        <span slot="footer" class="dialog-footer">
                                <el-button type="primary" @click="SetSizeInfo">确 定</el-button>
                                <el-button @click="dialogSizeSet = false">取 消</el-button>
                            </span>

                    </el-dialog>


                </el-tab-pane>
                <%--    <el-tab-pane label="销单规则" name="third">




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



               </el-tab-pane>--%>
            </el-tabs>
        </template>
    </div>
</div>
</body>

<script>
    new Vue({
        el: "#app",
        data: {
            activeName: 'first',
            /*产品层次*/
            FirstTab: [],
            StateLike: '',
            ProStateArr: [{productinfoState: '使用中', value: '使用中'}, {productinfoState: '停用中', value: '停用中'}],
            show: false,     //隐藏ID
            shower: false,     //展示/隐藏父节点
            showers: true,
            FatherProNode: '',
            options: [],
            proLike: '',
            SizeLike: '',
            defaultProps: {
                value: 'prodtypeId',
                label: 'prodtypeName',
                children: 'childList',
            },
            dialogVisible: false,
            dialogVisibleSet: false,
            addFirstPro: '',
            SetFirstPro: '',
            addSecondPro: '',
            SetSecondPro: '',
            addThirdPro: '',
            SetThirdPro: '',
            FirstPinLeiArray: [],
            usingss: '使用中',
            FirstId: {},
            SecondId: {},
            productinfoType: '',
            productinfoSecond: '',
            prodinfoId: '',
            protypesizeId: '',

            /*******************************************************************型号归类***********************************************************************/

            BrandLike: '', /*模糊查询*/
            BrandLikeArray: [],
            productinfoLikeSize: '',
            SizeLikeState: '',
            ProCengciLike: '',
            SecondTab: [], /*Table表格*/

            dialogSizeAdd: false, /*新增*/
            BrandAdd: '',
            productinfoAddSize: '',
            ProCengciAdd: '',

            dialogSizeSet: false, /*修改*/
            BrandSet: '',
            productinfoSetSize: '',
            using: '使用中',
            showview: false,
            ThirdArray: [],      //接收前端传过来的三级联动的ID


        },
        mounted: function () {
            var _this = this;


            /*************************************************************产品层次*************************************************************************/
            axios.post('${pageContext.request.contextPath}/pro/selectFirstPro')        //添加时查询一级下拉框
                .then(function (res) {
                    _this.FirstPinLeiArray = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })

            axios.post('${pageContext.request.contextPath}/pro/selectGuiZe')        //全查规则维护
                .then(function (res) {
                    _this.FirstTab = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })

            axios.post('${pageContext.request.contextPath}/pro/selectProtype')        //模糊查询产品层次
                .then(function (res) {
                    _this.options = res.data
                    console.log(res.data)

                })
                .catch(function (error) {
                    console.log(error)
                })


            /*************************************************************型号归类*************************************************************************/
            axios.post('${pageContext.request.contextPath}/pro/selectProSize')        //型号归类全查
                .then(function (res) {
                    _this.SecondTab = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })

            axios.post('${pageContext.request.contextPath}/pro/selectProBrand')        //模糊查询品牌字段
                .then(function (res) {
                    _this.BrandLikeArray = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })


        },
        methods: {
            /*************************************************************型号归类*************************************************************************/
            LikeSub: function () {         //点击查询实现模糊查询
                var t = this;
                if (t.BrandLike == "")
                    alert("品牌不能为空");
                if (t.ProCengciLike == "")
                    alert("产品层次不能为空");
                else {
                    axios.post('${pageContext.request.contextPath}/pro/selectSizeLike', {
                        brandName: t.BrandLike,
                        protypesizeName: t.productinfoLikeSize,
                        proSizeCengCi: t.ProCengciLike,
                        productinfoState: t.SizeLikeState,
                    })
                        .then(function (res) {
                            t.SecondTab = res.data
                            console.log(res)
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                }
            },

            AddSizeButton: function () {           //点击新增按钮触发的函数
                var t = this;
                t.dialogSizeAdd = true
            },

            AddSizeInfo: function () {             //新增产品型号
                var t = this;

                if (t.BrandAdd == "" || t.ProCengciAdd == "" || t.productinfoAddSize == "")
                    alert("请输入数据")
                else {
                    axios.post('${pageContext.request.contextPath}/pro/AddSizeInfo', {
                        /*品类表*/
                        brandId: t.BrandAdd,
                        ProCengciAdd: t.ProCengciAdd,
                        protypesizeName: t.productinfoAddSize,
                    })
                        .then(function (res) {
                            alert("添加成功")
                            location.reload();
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                }
            },


            SetSizeButton: function (row) {       //点击修改按钮回显数据
                var t = this;
                t.protypesizeId = row.protypesizeId,
                    t.prodinfoId = row.prodinfoId,
                    axios.post('${pageContext.request.contextPath}/pro/selectThirdId', {     //根据ID去查询三级的ID
                        prodinfoId: row.prodinfoId
                    })
                        .then(function (res) {
                            var arr = [res.data.productinfoTyper, res.data.productinfoSeconder, res.data.productinfoGrouper]
                            t.ThirdArray = arr

                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                t.dialogSizeSet = true
                /*回显数据*/
                t.BrandSet = row.brandName,
                    t.productinfoSetSize = row.protypesizeName,
                    t.using = row.productinfoState
            },

            SetSizeInfo: function () {         /*修改数据*/
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/UpdateSizeInfo', {
                    protypesizeId: t.protypesizeId,
                    productinfoId: t.prodinfoId,         //因为型号表和产品信息表关联，所以ID是相同的
                    protypesizeName: t.productinfoSetSize,
                    productinfoState: t.using
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },


            /*************************************************************产品层次*************************************************************************/
            ProSetrCommit: function () {   //点击确定按钮进行修改
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/SetProSub', {
                    prodFirstId: t.FirstId,
                    prodSecondId: t.SecondId,
                    SetSecondPro: t.SetSecondPro,
                    SetThirdPro: t.SetThirdPro,
                    productinfoState: t.usingss,      //状态
                    productinfoId: t.productinfoId,

                })
                    .then(function (res) {
                        console.log(res)
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            SetPro: function (row) {      //点击修改按钮触发函数回显数据
                var t = this;
                t.dialogVisibleSet = true
                t.SetFirstPro = row.productinfoType
                t.SetSecondPro = row.productinfoSecond
                t.SetThirdPro = row.productinfoGroup
                t.usingss = row.productinfoState
                t.productinfoId = row.productinfoId,

                    axios.post('${pageContext.request.contextPath}/pro/selectProFirstId', {
                        productinfoSecond: row.productinfoSecond,
                    })
                        .then(function (res) {
                            console.log(res)
                            t.FirstId = res.data.prodtypeId     //将得到的数据赋值给FirstId
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                axios.post('${pageContext.request.contextPath}/pro/selectProSecondId', {
                    productinfoGroup: row.productinfoGroup
                })
                    .then(function (res) {
                        console.log(res)
                        t.SecondId = res.data.prodtypeId     //将得到的数据赋值给FirstId
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            flushReload: function () {         //刷新页面的方法
                location.reload();
            },


            AddFatherPro: function () {       //添加父节点按钮
                var t = this;
                t.shower = true
                t.showers = false
            },

            AddFatherProReset: function () {        //添加父节点重置按钮
                var t = this;
                t.shower = false
                t.showers = true

            },

            ProCommit: function () {       //点击添加中的确定按钮
                var t = this;
                if (t.addSecondPro == "" || t.addThirdPro == "" || t.addFirstPro == "")
                    alert("请输入数据")
                else {
                    axios.post('${pageContext.request.contextPath}/pro/AddProSub', {
                        /*品类表*/
                        secondName: t.addSecondPro,     //第二级
                        thirdName: t.addThirdPro,        //第三级
                        prodtypePid: t.addFirstPro,      //PID
                        productinfoState: '停用中',
                    })
                        .then(function (res) {
                            alert("添加成功")
                            location.reload();
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                }
            },

            ProCommit2: function () {          /*添加父节点*/
                var t = this;
                if (t.FatherProNode == "")
                    alert("请输入数据")
                else {
                    axios.post('${pageContext.request.contextPath}/pro/AddProFatherNode', {
                        FatherProName: t.FatherProNode,      //父节点名字
                    })
                        .then(function (res) {
                            alert("添加成功")
                            location.reload();
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                }
            },

            AddProd: function () {
                var t = this;
                t.dialogVisible = true;
            },

            DownloadTemp: function () {        //下载模板
                var table = document.getElementById('TempId');
                var sheet = XLSX.utils.table_to_sheet(table);
                openDownloadDialog(sheet2blob(sheet), '商品类.xlsx');
            },

            SelectLikeButton: function () {        /*模糊查询*/
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/ProtypeLike', {
                    proCengCi: t.proLike,
                    productinfoState: t.StateLike
                })
                    .then(function (res) {
                        t.FirstTab = res.data
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            /*  规则维护状态的修改（使用中/停用中） */
            StartState: function (row) {
                var _this = this;
                var productinfoState = row.productinfoState;
                var productinfoId = row.productinfoId;
                axios.post('${pageContext.request.contextPath}/pro/setProductinfoState', {
                    productinfoState: productinfoState,
                    productinfoId: productinfoId,
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },
            /*  规则维护状态的修改（使用中/停用中） */
            StopState: function (row) {
                var _this = this;
                var productinfoState = row.productinfoState;
                var productinfoId = row.productinfoId;
                axios.post('${pageContext.request.contextPath}/pro/setProductinfoState', {
                    productinfoState: productinfoState,
                    productinfoId: productinfoId,
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },
            handleClose(done) {      //确认关闭弹出框
                this.$confirm('确认关闭？')
                    .then(function (res) {
                        done();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

        }
    })
</script>
</html>
