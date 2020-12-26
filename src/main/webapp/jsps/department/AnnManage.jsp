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

                综合查询：
                <el-input style="width: 200px;" placeholder="标题/关键字" v-model="noticeLike"></el-input>

                <template>
                    发布时间：
                    <el-date-picker v-model="noticeStartTime" type="datetime" placeholder="选择开始时间"></el-date-picker>
                    截止时间：
                    <el-date-picker v-model="noticeEndTime" type="datetime" placeholder="选择截止时间"></el-date-picker>
                    <br/><br/>
                </template>
                <template>
                    发布部门：
                    <el-select v-model="noticeDepart" @change="selectSecondUser" placeholder="全部">
                        <el-option
                                v-for="item in DepartArray"
                                :label="item.departmentName"
                                :value="item.departmentId">
                        </el-option>
                    </el-select>
                </template>

                <template>
                    发布人：
                    <el-select v-model="noticeUser" placeholder="全部">
                        <el-option
                                v-for="item in UserArray"
                                :label="item.userName"
                                :value="item.userName">
                        </el-option>
                    </el-select>
                </template>

            </div>


            <div style="margin-top: 30px;margin-left: 350px;">
                <el-button @click="selectLike">查询</el-button>
                <el-button @click="AddNotice">新增</el-button>
            </div>

            <el-dialog
                    title="公告新增"
                    :visible.sync="dialogNotice"
                    width="40%"
                    :before-close="handleClose">


                <el-form ref="form" id="updateFrom" :model="form" label-width="80px">
                    <el-form-item label="标题">
                        <el-input style="width: 200px;" v-model="form.noticeTitle"></el-input>
                    </el-form-item>

                    <el-form-item label="关键字">
                        <el-input style="width: 200px;" v-model="form.noticeKeyword"></el-input>
                    </el-form-item>

                    <el-form-item label="发布对象">
                        <el-select v-model="form.roleId" placeholder="请选择">
                            <el-option
                                    v-for="item in NoticeRoleArray"
                                    :label="item.roleName"
                                    :value="item.roleId">
                            </el-option>
                        </el-select>
                    </el-form-item>

                    <el-form-item label="上传附件">
                        <el-upload
                                class="upload-demo"
                                ref="upload"
                                action=""
                                style="height: 50px;"
                                :on-change="handleChanges1"
                                :on-remove="handleRemoves1"
                                :auto-upload="false">     <%--false表示手动上传--%>
                            <el-button slot="trigger" size="big">选择文件（%）</el-button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <%--<el-radio v-model="form.radioes">可下载</el-radio>--%>
                        </el-upload>
                    </el-form-item>
                    <br/><br/>

                    <el-form-item label="封面图片">
                        <el-upload
                                class="upload-demo"
                                ref="upload"
                                action=""
                                style="height: 50px;margin-bottom: 36px;"
                                :on-change="handleChanges2"
                                :on-remove="handleRemoves2"
                                :auto-upload="false">      <%--false表示手动上传--%>
                            <el-button slot="trigger" v-model="form.noticePic" size="big">选择图片（%）</el-button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </el-upload>
                    </el-form-item>

                   <%-- <el-form-item label="长期有效">
                        <el-switch
                                v-model="form.Longterm"
                                active-color="#13ce66"
                                inactive-color="#ff4949">
                        </el-switch>
                    </el-form-item>--%>

                    <el-form-item label="截止时间">
                        <el-date-picker
                                v-model="form.noticeReleasetime"
                                type="datetime"
                                placeholder="选择日期时间">
                        </el-date-picker>
                    </el-form-item>

                   <%-- <el-form-item label="是否置顶">
                        <el-switch
                                v-model="form.settop"
                                active-color="#13ce66"
                                inactive-color="#ff4949">
                        </el-switch>
                    </el-form-item>--%>

                    <el-form-item label="正文">
                        <el-input
                                type="textarea"
                                placeholder="请输入内容"
                                v-model="form.noticeText"
                                maxlength="400"
                                show-word-limit>
                        </el-input>
                    </el-form-item>

                    <el-form-item>

                        <el-radio-group v-model="radioers">
                            <el-radio :label="0" >立即发布</el-radio>
                            <el-radio :label="1" >定时发布</el-radio>
                        </el-radio-group>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        定时时间：<el-date-picker
                                v-model="form.noticeEndtime"
                                type="datetime"
                                placeholder="选择日期时间">
                        </el-date-picker>

                    </el-form-item>



                </el-form>

                <span slot="footer" class="dialog-footer">
                          <el-button type="primary" @click="submitCommit">确 定</el-button>
                          <el-button @click="dialogNotice = false">取 消</el-button>
                      </span>
            </el-dialog>

            <div style="margin-top: 30px;">
                <template>
                    <el-table
                            :data="FirstTab"
                            border
                            style="width: 100%">
                        <el-table-column
                                prop="noticeId"
                                label="序号"
                                width="100">
                        </el-table-column>
                        <el-table-column
                                prop="noticeTitle"
                                label="标题"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="noticeKeyword"
                                label="关键字"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="departmentName"
                                label="发布部门"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="userName"
                                label="发布人"
                                width="150">
                        </el-table-column>
                        <el-table-column
                                prop="noticeReleasetime"
                                label="发布时间"
                                width="220">
                        </el-table-column>
                        <el-table-column
                                prop="noticeEndtime"
                                label="截止时间"
                                width="220">
                        </el-table-column>
                        <el-table-column
                                prop="noticeNumbervis"
                                label="浏览人数"
                                width="100">
                        </el-table-column>
                        <el-table-column fixed="right" label="操作">
                            <template slot-scope="scope">
                                <el-button type="text" size="big">编辑</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </template>
            </div>
        </template>
    </div>
</div>

</body>
<style>


</style>

<script>
    new Vue({
        el: "#app",
        data: {
            form: {
                noticeTitle: '',    //公告标题
                noticeKeyword: '',  //关键字
                roleId: '',     //发布对象
                /*radioes: '',
                Longterm: false,
                settop: false,*/
                noticePic:'',   //封面图片

                noticeReleasetime:'',
                noticeEndtime:'',
                noticeText: '',
            },
            NoticeRoleArray: [],
            noticeLike: '',
            noticeStartTime: '',
            noticeEndTime: '',
            noticeDepart: '',
            DepartArray: [],
            noticeUser: '',
            UserArray: [],
            FirstTab: [],
            departTimeLike: '',      //用于获取模糊查询的label值
            dialogNotice: false,
            radioers:0,
            TimingModel:'',
            files1:'',

        },

        mounted: function () {
            var t = this;
            axios.post('${pageContext.request.contextPath}/pro/selectNotice')     //table表全查
                .then(function (res) {
                    console.log(res.data)
                    t.FirstTab = res.data
                })
                .catch(function (error) {
                    console.log(error)
                })


            axios.post('${pageContext.request.contextPath}/pro/selectDepartment')       //发布部门下拉框查询
                .then(function (res) {
                    console.log(res.data)
                    t.DepartArray = res.data
                })
                .catch(function (error) {
                    console.log(error)
                })
        },


        methods: {


            submitCommit:function(){
                var t = this;
                var notice = t.form;
                var fm = new FormData();
                fm.append("file",t.files1)
                fm.append("notice",notice)
                var headers = "{content-type':'multipart/form-data}"
                /*var obj = $("#updateFrom").serializeObject();
                obj.method="updateEmployee";*/
                axios.post('${pageContext.request.contextPath}/pro/AddNotice',fm,headers)

                    .then(function (res) {
                        console.log(res.data)
                    })
                    .catch(function (error) {
                        console.log(error)
                    })





















/*
                var ii = {user.roleId}
                 if(ii==t.form.NoticeRole)
                       alert("管理员不能给自己发布公告")
                   else{
                         if(t.radioers ==0){
                             alert("添加数据到数据库")
                         }else if(t.radioers ==1){
                             alert("222")
                         }else{
                             alert("出错了，重新尝试下吧")
                         }
                   }*/
            },

            AddNotice: function () {       //新增公告
                 var t = this;
                 t.dialogNotice = true
                 axios.post('${pageContext.request.contextPath}/pro/selectRoleKind',{

                 })
                     .then(function (res) {
                         t.NoticeRoleArray = res.data
                         console.log(res.data)
                     })
                     .catch(function (error) {
                         console.log(error)
                     })
            },

            selectLike: function () {    //模糊查询
                var t = this;
                alert(t.noticeStartTime)
                if (t.noticeStartTime == "" && t.noticeEndTime == "") {
                    alert("请输入时间查询")
                } else {
                    axios.post('${pageContext.request.contextPath}/pro/selectNoticeLike', {
                        noticeKeyword: t.noticeLike,     //综合查询
                        noticeReleasetime: t.noticeStartTime,  //发布时间
                        noticeEndTime: t.noticeEndTime,      //截止时间
                        departmentName: t.departTimeLike,  //发布部门
                        userName: t.noticeUser// 发布人
                    })
                        .then(function (res) {
                            if (res.data == null) {
                                alert("日期不能为空")
                            }
                            console.log(res.data)
                            t.FirstTab = res.data
                        })
                        .catch(function (error) {
                            console.log(error)
                        })
                }
            },


            selectSecondUser: function (val) {      //根据部门查询发布人
                var t = this;
                var obj = {};
                obj = t.DepartArray.find((item) => {     //遍历list的数据
                    return item.departmentId === val;   //筛选出匹配数据
            })
                ;
                t.departTimeLike = obj.departmentName,  ////获取list里面的name

                    axios.post('${pageContext.request.contextPath}/pro/selectNoticeUser', {           //发布人下拉框查询
                        departmentId: t.noticeDepart,
                    })
                        .then(function (res) {
                            console.log(res.data)
                            t.UserArray = res.data
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
            handleRemoves1(file) {
                console.log(file);
            },
            handleRemoves2(file) {
                console.log(file);
            },
            handleChanges1:function(file){
                this.files1 = file.raw;     //将得到的file文件赋值给files
            },
            handleChanges2:function(file){
                this.form.noticePic = file.raw;     //将得到的file文件赋值给files
            },


        },
    })
</script>
</html>
