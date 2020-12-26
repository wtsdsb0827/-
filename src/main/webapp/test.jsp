<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
    <script src="${pageContext.request.contextPath}/static/jquery/js/jquery-3.2.1.min.js"></script>
</head>
<body>

<div id="app">
    <template>
        <div class="block">
            <el-date-picker
                    v-model="value1"
                    type="datetimerange"
                    range-separator="至"
                    start-placeholder="开始日期"
                    end-placeholder="结束日期">
            </el-date-picker>
        </div>
    </template>

    <el-button @click="subCom">查询</el-button>
    <br/><br/><br/><br/>

    <h5><a :href=path>百度</a></h5>

    <el-cascader :options="options" v-model="shuzu" clearable></el-cascader>


    <el-upload
            class="upload-demo"
            ref="upload"
            action=""
            :on-preview="handlePreview"
            :on-change="handleChange"
            :on-remove="handleRemove"
            :on-success="handleAccess"
            :http-request="updateFile"
            :auto-upload="false">     <%--false表示手动上传--%>
        上传：
        <el-button type="primary" style="margin-left: 10px;" size="big">选取文件</el-button>
        <el-button @click="huoqu">获取</el-button>
    </el-upload>
    <br/>

    <el-button @click="shangchuanFile">上传</el-button>

</div>

</body>

<script>
    new Vue({
        el: '#app',
        data: {
            path: "https://www.baidu.com/",
            value1: '',
            options: [{
                value: 'zhinan', label: '指南',
                children: [{value: 'zhibei', label: '指北',}]
            }],
            shuzu: [1, 2, 3],
            files: '',

        },
        methods: {

            updateFile: function (val) {
                alert(val.file.action);
            },

            huoqu: function () {
                alert(this.files)
            },

            handleRemove(file) {
                console.log(file);
            },


            handleChange(file) {
                this.files = file.raw;     //将得到的file文件赋值给files
            },

            handlePreview(file) {
                console.log(file);
            },

            shangchuanFile: function () {
                var t = this;
                var params = new FormData();
                params.append("file", this.files);
                var headers = "{content-type':'multipart/form-data}"
                axios.post("${pageContext.request.contextPath}/pro/ceshi", params, headers)
                    .then(function (res) {
                        console.log(res)
                    })

                    .catch(function (error) {
                        console.log(error)
                    })
            },

            subCom: function () {
                var t = this;
                var date = t.value1;
                axios.post('${pageContext.request.contextPath}/pro/DateTest', {
                    datett: date
                })
                    .then(function (value) {
                        console.log(value)
                    })

                    .catch(function (error) {
                        console.log(error)
                    })
            }
        },
    })
</script>
</html>
