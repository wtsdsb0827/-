<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>品类区分配置</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div id="app">
    <div style="margin-top:20px;margin-left: 50px; ">
        <template>
            <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
                <el-tab-pane label="取消原因" name="first">
                    综合查询：
                    <el-input placeholder="取消原因名称" style="width: 200px;" v-model="conReasonLike"></el-input>
                    <template>
                        品类：
                        <el-select v-model="prodtypeNameLike" placeholder="请选择">
                            <el-option
                                    v-for="item in proArray"
                                    :label="item.prodtypeName"
                                    :value="item.prodtypeName">
                            </el-option>
                        </el-select>
                    </template>
                    <template>
                        状态：
                        <el-select v-model="conStateLike" placeholder="全部">
                            <el-option
                                    v-for="item in stateArray"
                                    :label="item.conState"
                                    :value="item.conId">
                            </el-option>
                        </el-select>
                    </template>

                    <div style="margin-top: 30px;margin-left: 350px;">
                        <el-button @click="SelectLike">查询</el-button>
                        <el-button>导出</el-button>
                        <el-button @click="dialogVisible = true">新增</el-button>
                    </div>
                    <%--点击新增弹出的框--%>
                    <el-dialog
                            title="取消原因新增"
                            :visible.sync="dialogVisible"
                            width="30%"
                            :before-close="handleClose">
                        <template>
                            品类：
                            <el-select v-model="prodtypeNameAdd" placeholder="请选择">
                                <el-option
                                        v-for="item in proArray"
                                        :label="item.prodtypeName"
                                        :value="item.prodtypeId">
                                </el-option>
                            </el-select>
                        </template>
                        <br/><br/>
                        取消原因：
                        <el-input placeholder="取消原因名称" style="width: 200px;" v-model="conReasonAdd"></el-input>
                        <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="prodtypeCommit">确 定</el-button>
                          <el-button @click="dialogVisible = false">取 消</el-button>
                      </span>
                    </el-dialog>
                    <div style="margin-top: 30px;">
                        <template>
                            <el-table
                                    :data="FirstTab"
                                    border
                                    style="width: 100%">
                                <el-table-column
                                        prop="prodtypeId"
                                        v-if="show">
                                </el-table-column>
                                <el-table-column
                                        prop="conId"
                                        v-if="shower">
                                </el-table-column>

                                <el-table-column
                                        prop="prodtypeName"
                                        label="品类"
                                        width="200">
                                </el-table-column>
                                <el-table-column
                                        prop="conReason"
                                        label="取消原因名称"
                                        width="600">
                                </el-table-column>
                                <el-table-column
                                        prop="conState"
                                        label="状态">
                                </el-table-column>
                                <el-table-column fixed="right" label="操作" width="200">
                                    <template slot-scope="scope">
                                        <el-button type="text" size="big" @click="UpCon(scope.row)">编辑</el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </template>
                    </div>
                </el-tab-pane>
                <%--点击修改弹出的框--%>
                <el-dialog
                        title="取消原因修改"
                        :visible.sync="dialogVisibleSet"
                        width="30%"
                        :before-close="handleClose">
                    <template>
                        品类：
                        <el-select v-model="prodtypeNameSet" placeholder="请选择">
                            <el-option
                                    v-for="item in proArray"
                                    :label="item.prodtypeName"
                                    :value="item.prodtypeId">
                            </el-option>
                        </el-select>
                    </template>
                    <br/><br/>
                    取消原因：
                    <el-input style="width: 350px;" v-model="conReasonSet"></el-input>
                    <br/><br/>

                    <template>
                        <el-radio v-model="using" label="使用中">使用中</el-radio>
                        <el-radio v-model="using" label="停用中">停用中</el-radio>
                    </template>
                    <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="prodtypeUpdate">确 定</el-button>
                          <el-button @click="dialogVisibleSet = false">取 消</el-button>
                      </span>
                </el-dialog>


                <el-tab-pane label="回访内容" name="second">
                    综合查询：
                    <el-input placeholder="回访内容名称" style="width: 200px;" v-model="contentLike"></el-input>
                    <template>
                        品类：
                        <el-select v-model="pinleimodel" placeholder="请选择">
                            <el-option
                                    v-for="item in pinleiArray"
                                    :label="item.prodtypeName"
                                    :value="item.prodtypeName">
                            </el-option>
                        </el-select>
                    </template>
                    <template>
                        状态：
                        <el-select v-model="statemodel" placeholder="全部">
                            <el-option
                                    v-for="item in zhuangtaiArray"
                                    :label="item.conState"
                                    :value="item.conId">
                            </el-option>
                        </el-select>
                    </template>

                    <div style="margin-top: 30px;margin-left: 350px;">
                        <el-button @click="MoHuLike">查询</el-button>
                        <el-button>导出</el-button>
                        <el-button @click="dialogCon = true">新增</el-button>
                    </div>

                    <%--点击新增弹出的框--%>
                    <el-dialog
                            title="取消原因新增"
                            :visible.sync="dialogCon"
                            width="30%"
                            :before-close="handleClose">
                        <template>
                            品类：
                            <el-select v-model="prodtypeNameCon" placeholder="请选择">
                                <el-option
                                        v-for="item in proArray"
                                        :label="item.prodtypeName"
                                        :value="item.prodtypeId">
                                </el-option>
                            </el-select>
                        </template>
                        <br/><br/>
                        回访内容名称：
                        <el-input style="width: 200px;" v-model="conReasonCon"></el-input>
                        <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="contentCommit">确 定</el-button>
                          <el-button @click="dialogCon = false">取 消</el-button>
                      </span>
                    </el-dialog>

                    <div style="margin-top: 30px;">
                        <template>
                            <el-table
                                    :data="SecondTab"
                                    border
                                    style="width: 100%">
                                <el-table-column
                                        prop="prodtypeId"
                                        v-if="show">
                                </el-table-column>
                                <el-table-column
                                        prop="visitId"
                                        v-if="shower">
                                </el-table-column>
                                <el-table-column
                                        prop="prodtypeName"
                                        label="品类"
                                        width="200">
                                </el-table-column>
                                <el-table-column
                                        prop="visitName"
                                        label="回访内容名称"
                                        width="600">
                                </el-table-column>
                                <el-table-column
                                        prop="visitState"
                                        label="状态">
                                </el-table-column>
                                <el-table-column fixed="right" label="操作" width="300">
                                    <template slot-scope="scope">
                                        <el-button type="text" @click="UpdateEdit(scope.row)" size="big">编辑</el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </template>
                    </div>
                </el-tab-pane>
                <%--点击修改弹出的框--%>
                <el-dialog
                        title="回访内容修改"
                        :visible.sync="dialogContentSet"
                        width="30%"
                        :before-close="handleClose">
                    <template>
                        品类：
                        <el-select v-model="prodtypeNameConset" placeholder="请选择">
                            <el-option
                                    v-for="item in proArray"
                                    :label="item.prodtypeName"
                                    :value="item.prodtypeId">
                            </el-option>
                        </el-select>
                    </template>
                    <br/><br/>
                    取消原因：
                    <el-input style="width: 350px;" v-model="conReasonConSet"></el-input>
                    <br/><br/>

                    <template>
                        <el-radio v-model="usings" label="使用中">使用中</el-radio>
                        <el-radio v-model="usings" label="停用中">停用中</el-radio>
                    </template>
                    <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="UpdateContent">确 定</el-button>
                          <el-button @click="dialogContentSet = false">取 消</el-button>
                      </span>
                </el-dialog>


                <el-tab-pane label="维修措施归类" name="third">

                    <%--综合查询：<el-input placeholder="维修措施名称" style="width: 200px;" v-model="repairModel"></el-input>--%>
                    <template>
                        维修措施：
                        <el-select v-model="repairmeasures" placeholder="请选择" style="width: 180px;">
                            <el-option
                                    v-for="item in repairCuoshiArray"
                                    :label="item.repairDoing"         <%--显示的--%>
                                    :value="item.repairDoing"> <%--传后台的值--%>
                            </el-option>
                        </el-select>
                    </template>

                    <template>
                        维修措施大类：
                        <el-select v-model="Bigrepairmeasures" placeholder="请选择" style="width: 180px;">
                            <el-option
                                    v-for="item in BigrepairCuoshiArray"
                                    :label="item.repairClass"
                                    :value="item.repairClass">
                            </el-option>
                        </el-select>
                    </template>
                    <template>
                        品类：
                        <el-select v-model="repairPinlei" placeholder="请选择">
                            <el-option
                                    v-for="item in repairArray"
                                    :label="item.prodtypeName"
                                    :value="item.prodtypeName">
                            </el-option>
                        </el-select>
                    </template>


                    <template>
                        状态：
                        <el-select v-model="repairState" placeholder="全部" style="width: 180px;">
                            <el-option
                                    v-for="item in repairStateArr"
                                    :label="item.conState"
                                    :value="item.conId">
                            </el-option>
                        </el-select>
                    </template>

                    <div style="margin-top: 30px;margin-left: 350px;">
                        <el-button @click="repairSe">查询</el-button>
                        <el-button>导出</el-button>
                        <el-button @click="repairAdd">新增</el-button>
                    </div>

                    <el-dialog
                            title="维修措施归类新增"
                            :visible.sync="dialogRepair"
                            width="50%"
                            :before-close="handleClose">
                        <template>
                            品类二级分类：
                            <el-select v-model="prodtypeNameRepair" @change="repairChange" placeholder="请选择">
                                <el-option
                                        v-for="item in proArray"
                                        :label="item.prodtypeName"
                                        :value="item.prodtypeId">
                                </el-option>
                            </el-select>

                            <el-select v-model="SeprodtypeNameRepair" placeholder="请选择">
                                <el-option
                                        v-for="item in SecondReapirArr"
                                        :label="item.prodtypeName"
                                        :value="item.prodtypeName">
                                </el-option>
                            </el-select>
                        </template>
                        <br/><br/>
                        维修措施类型：
                        <el-input style="width: 200px;" v-model="conRepairKind"></el-input>
                        <br/><br/>
                        维修措施：
                        <el-input style="width: 200px;" v-model="conRepairAdd"></el-input>
                        <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="repairCommit">确 定</el-button>
                          <el-button @click="dialogRepair = false">取 消</el-button>
                      </span>
                    </el-dialog>

                    <div style="margin-top: 30px;">
                        <template>
                            <el-table
                                    :data="ThirdTab"
                                    border
                                    style="width: 100%">

                                <el-table-column
                                        prop="prodtypeId"
                                        v-if="show">
                                </el-table-column>
                                <el-table-column
                                        prop="repairId"
                                        v-if="shower">
                                </el-table-column>

                                <el-table-column
                                        prop="prodtypeName"
                                        label="品类"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="repairDoing"
                                        label="维修措施"
                                        width="180">
                                </el-table-column>
                                <el-table-column
                                        prop="repairKind"
                                        label="维修措施类型">
                                </el-table-column>
                                <el-table-column
                                        prop="repairState"
                                        label="状态">
                                </el-table-column>

                                <el-table-column fixed="right" label="操作" width="200">
                                    <template slot-scope="scope">
                                        <el-button @click="repairUp(scope.row)" type="text" size="big">编辑</el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </template>
                    </div>

                </el-tab-pane>
                <%--点击修改弹出的框--%>
                <el-dialog
                        title="回访内容修改"
                        :visible.sync="dialogRepairSet"
                        width="50%"
                        :before-close="handleClose">
                    <template>
                        品类二级品类：
                        <el-select v-model="prodtypeNameRepSet" placeholder="请选择">
                            <el-option
                                    v-for="item in proArray"
                                    :label="item.prodtypeName"
                                    :value="item.prodtypeId">
                            </el-option>
                        </el-select>

                        <el-select v-model="SeprodtypeNameRepairSet">
                            <el-option v-for="item in SecondReapirArrSet"
                                       :label="item.prodtypeName"
                                       :value="item.prodtypeId">
                            </el-option>
                        </el-select>
                    </template>
                    <br/><br/>
                    维修措施类型：
                    <el-input style="width: 200px;" v-model="conRepairKindSet"></el-input>
                    <br/><br/>
                    维修措施：
                    <el-input style="width: 200px;" v-model="conRepairSet"></el-input>
                    <br/><br/>
                    <template>
                        <el-radio v-model="usingss" label="使用中">使用中</el-radio>
                        <el-radio v-model="usingss" label="停用中">停用中</el-radio>
                    </template>
                    <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="UpdateRepairSet">确 定</el-button>
                          <el-button @click="dialogRepairSet = false">取 消</el-button>
                      </span>
                </el-dialog>
            </el-tabs>
        </template>
    </div>
</div>
</body>

<script>
    new Vue({
        el: "#app",
        data: {

            /*     取消原因   */
            activeName: 'first',     //first表示从第一个标签页展示
            conReasonLike: '',       //模糊查询字段（取消原因名称）
            prodtypeNameLike: '',    //模糊查询字段（品类）
            conStateLike: '',        //模糊查询字段（状态）

            show: false,     //隐藏id
            shower: false,     //隐藏id

            proArray: [],     //品类下拉数组
            FirstTab: [],       //全查显示的数组
            stateArray: [{conState: '使用中', conId: '使用中'}, {conState: '停用中', conId: '停用中'},],      //状态下拉列表

            dialogVisible: false,   //新增功能
            prodtypeNameAdd: '',
            conReasonAdd: '',

            dialogVisibleSet: false,     //修改功能
            prodtypeNameSet: '',
            conReasonSet: '',
            using: '使用中',

            /*     回访内容     */
            contentLike: '',
            pinleimodel: '',
            pinleiArray: [],
            statemodel: '',
            SecondTab: [],
            zhuangtaiArray: [{conState: '使用中', conId: '使用中'}, {conState: '停用中', conId: '停用中'},],
            dialogCon: false,
            dialogContentSet: false,
            prodtypeNameCon: '',
            conReasonCon: '',
            prodtypeNameConset: '',
            conReasonConSet: '',
            usings: '使用中',


            /*     维修措施归类     */

            /*repairModel:'',*/
            repairmeasures: '',
            Bigrepairmeasures: '',
            repairPinlei: '',
            repairArray: [],
            repairCuoshiArray: [],
            BigrepairCuoshiArray: [],
            repairStateArr: [{conState: '使用中', conId: '使用中'}, {conState: '停用中', conId: '停用中'}],
            ThirdTab: [],
            dialogRepair: false,
            prodtypeNameRepair: '',
            SeprodtypeNameRepair: '',
            SecondReapirArr: [],
            SecondReapirArrSet: [],
            conRepairKind: '',
            conRepairAdd: '',
            repairId: '',
            repairDoing: '',
            repairClass: '',
            repairState: '',
            dialogRepairSet: false,
            usingss: '使用中',
            prodtypeNameRepSet: '',
            SeprodtypeNameRepairSet: '',
            conRepairKindSet: '',
            conRepairSet: '',
            proArrayRepair: [],

        },

        mounted: function () {
            var _this = this;
            axios.post('${pageContext.request.contextPath}/pro/prodLike')      //查询下拉值
                .then(function (res) {
                    _this.proArray = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })


            axios.post('${pageContext.request.contextPath}/pro/prodAll')       //全查数据
                .then(function (res) {
                    _this.FirstTab = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })

            /*                 回访内容             */
            axios.post('${pageContext.request.contextPath}/pro/prodLike')      //查询下拉值
                .then(function (res) {
                    _this.pinleiArray = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })

            axios.post('${pageContext.request.contextPath}/pro/prodLike')      //查询下拉值
                .then(function (res) {
                    _this.repairArray = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })


            axios.post('${pageContext.request.contextPath}/pro/prodAllRepair')       //全查数据
                .then(function (res) {
                    _this.ThirdTab = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })


            axios.post('${pageContext.request.contextPath}/pro/selectRepair')      //查询下拉值维修措施
                .then(function (res) {
                    _this.repairCuoshiArray = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })


            axios.post('${pageContext.request.contextPath}/pro/selectRepairClass')      //查询下拉值维修措施大类
                .then(function (res) {
                    _this.BigrepairCuoshiArray = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })


            axios.post('${pageContext.request.contextPath}/pro/prodAllVis')       //全查数据
                .then(function (res) {
                    _this.SecondTab = res.data
                    console.log(res)
                })
                .catch(function (error) {
                    console.log(error)
                })


        },

        methods: {

            handleClose(done) {      //确认关闭弹出框
                this.$confirm('确认关闭？')
                    .then(function (res) {
                        done();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },
            handleClick(tab, event) {
                console.log(tab, event);
            },


            /*                                          取消原因                                */
            SelectLike: function () {
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/SelectLike', {       //模糊查询
                    conReason: t.conReasonLike,
                    prodtypeName: t.prodtypeNameLike,
                    conState: t.conStateLike
                })
                    .then(function (res) {
                        t.FirstTab = res.data
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })

            },

            prodtypeCommit: function () {
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/prodtypeAdd', {       //新增取消原因
                    prodtypeName: t.prodtypeNameAdd,
                    conReason: t.conReasonAdd,
                    conState: '停用中'
                })
                    .then(function (res) {
                        alert("添加成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            /*   点击编辑触发事件   */
            UpCon: function (row) {
                var t = this;
                t.dialogVisibleSet = true       //触发dialog对话框
                t.prodtypeNameSet = row.prodtypeId
                t.conReasonSet = row.conReason
                t.using = row.conState      //数据回显

                t.conId = row.conId     //将config表中的id查到进行绑定
            },

            /*   点击确定按钮执行修改操作  */
            prodtypeUpdate: function () {
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/prodtypeUpdate', {       //修改取消原因
                    prodtypeName: t.prodtypeNameSet,
                    conReason: t.conReasonSet,
                    conState: t.using,
                    conId: t.conId,          //因为我全查的是prodtype表，所以要将这个字段加到config实体类中，通过v-model进行动态绑定
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },


            /*                                                  回访内容                                        */
            MoHuLike: function () {          //模糊查询
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/SelectLikeVisit', {       //模糊查询
                    visitName: t.contentLike,
                    prodtypeName: t.pinleimodel,
                    visitState: t.statemodel
                })
                    .then(function (res) {
                        t.SecondTab = res.data
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },


            contentCommit: function () {
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/ConcontAdd', {       //新增回访内容
                    prodtypeName: t.prodtypeNameCon,
                    visitName: t.conReasonCon,
                    visitState: '停用中'
                })
                    .then(function (res) {
                        alert("添加成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            /*   点击编辑触发事件   */
            UpdateEdit: function (row) {
                var t = this;
                t.dialogContentSet = true       //触发dialog对话框
                t.prodtypeNameConset = row.prodtypeId,
                    t.conReasonConSet = row.visitName,
                    t.usings = row.visitState     //数据回显
                t.visitId = row.visitId     //将config表中的id查到进行绑定
            },


            UpdateContent: function () {
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/ConcontentUpdate', {
                    prodtypeName: t.prodtypeNameConset,
                    visitName: t.conReasonConSet,
                    visitState: t.usings,
                    visitId: t.visitId,
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            repairSe: function () {
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/SelectLikeRepair', {       //模糊查询
                    /*repairModel: t.repairModel,*/
                    repairDoing: t.repairmeasures,
                    repairClass: t.Bigrepairmeasures,
                    prodtypeName: t.repairPinlei,
                    repairState: t.repairState
                })
                    .then(function (res) {
                        t.ThirdTab = res.data
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            /*     添加维修措施归类     */
            repairAdd: function () {
                var t = this;
                t.dialogRepair = true;      //触发弹框
            },


            /*      下拉框修改事件        */
            repairChange: function () {
                var t = this;
                /*               根据一级品类去查找二级品类                            */
                axios.post('${pageContext.request.contextPath}/pro/SelectrepairPro', {       //查询二级品类(因为第一级已经查出来了，所以根据第一级的value去查第二级)
                    proId: t.prodtypeNameRepair,
                })
                    .then(function (res) {
                        t.SecondReapirArr = res.data
                        console.log(res)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },


            /*       点击确定按钮进行添加       */
            repairCommit: function () {
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/repairAdd', {       //新增取消原因
                    prodtypeName: t.prodtypeNameRepair, //绑定的是ID
                    repairKind: t.conRepairKind,  //维修措施类型
                    repairDoing: t.conRepairAdd,   //维修措施
                    repairState: '停用中'          //状态
                })
                    .then(function (res) {
                        alert("添加成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            },

            /*       点击编辑按钮进行数据回显       */
            repairUp: function (row) {
                var t = this;
                t.dialogRepairSet = true       //触发dialog对话框
                t.prodtypeNameRepSet = row.prodtypeName
                t.conRepairKindSet = row.repairKind,
                    t.conRepairSet = row.repairDoing,
                    t.usingss = row.repairState,
                    t.repairId = row.repairId           //将主键赋值给v-model

                /*     根据ID去查询二级品类     */
                axios.post('${pageContext.request.contextPath}/pro/selectSecondrepair', {
                    prodtypeId: row.prodtypeId,
                })
                    .then(function (res) {
                        t.SecondReapirArrSet = res.data
                        t.SeprodtypeNameRepairSet = res.data.prodtypeName
                        console.log(res.data)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })


            },

            /*      修改        */
            UpdateRepairSet: function () {
                var t = this;
                axios.post('${pageContext.request.contextPath}/pro/UpdateRepairSet', {
                    repairId: t.repairId,        //主键
                    prodtypeId: t.prodtypeNameRepSet,    //品类ID
                    repairKind: t.conRepairKindSet,     //维修措施类型
                    repairDoing: t.conRepairSet,     //维修措施
                    repairState: t.usingss       //状态
                })
                    .then(function (res) {
                        alert("修改成功")
                        location.reload();
                    })
                    .catch(function (error) {
                        console.log(error)
                    })
            }
        }
    })
</script>

</html>
