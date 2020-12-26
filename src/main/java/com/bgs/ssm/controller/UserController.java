package com.bgs.ssm.controller;

import com.bgs.ssm.oss.AliOSSUtil;
import com.bgs.ssm.pojo.*;
import com.bgs.ssm.service.UserService;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RequestMapping("pro")
@Controller
public class UserController {

    @Autowired
    private UserService u;


    /* 用户登录 */
    @RequestMapping("/LoginPro")
    @ResponseBody
    public User LoginPro(@RequestBody Map<String, Object> map, HttpSession session) {
        User user = u.LoginPro(map, session);
        return user;
    }

    /* 菜单查询 */
    @RequestMapping("/LoginTree")
    @ResponseBody
    public List<Relation> LoginTree(@RequestBody Map<String, Object> map) {
        List<Relation> list = u.LoginTree(map);
        return list;
    }

    /* 获取验证码 */
    @RequestMapping("/getCode")
    @ResponseBody
    public String getCode(@RequestBody Map<String, Object> map) throws Exception {
        String code = u.getCode(map);
        return code;
    }

    /* 验证手机号 */
    @RequestMapping("/getCoders")
    @ResponseBody
    public User getCoders(@RequestBody Map<String, Object> map) {
        User list = u.getCoders(map);
        return list;
    }


    /*校验手机号完成调用方法进行登录*/
    @RequestMapping("/PhoneLogin")
    @ResponseBody
    public User PhoneLogin(@RequestBody Map<String, Object> map, HttpSession session) {
        User user = u.PhoneLogin(map, session);
        return user;
    }

    /*修改密码*/
    @RequestMapping("/SetPass")
    @ResponseBody
    public int SetPass(@RequestBody Map<String, Object> map) {
        int i = 0;
        i = u.SetPass(map);
        return i;
    }


    /*数据维护数据查询*/
    @RequestMapping("/queryInfo")
    @ResponseBody
    public List<Brand> queryInfo() {
        List<Brand> list = u.queryInfo();
        return list;
    }

    /*数据维护数据模糊查询*/
    @RequestMapping("/queryLikeInfo")
    @ResponseBody
    public List<Brand> queryLikeInfo(@RequestBody Map<String, Object> map) {
        List<Brand> list = u.queryLikeInfo(map);
        /*System.out.println("返回前端的数据："+list);*/
        return list;
    }

    /*数据维护数据添加*/
    @RequestMapping("/PutBrand")
    @ResponseBody
    public boolean PutBrand(@RequestBody Map<String, Object> map) {
        boolean b = false;
        b = u.PutBrand(map);
        return b;
    }

    /*数据维护数据修改*/
    @RequestMapping("/setState")
    @ResponseBody
    public boolean setState(@RequestBody Map<String, Object> map) {
        /*System.out.println(map);*/
        boolean b = false;
        b = u.setState(map);
        return b;
    }


    /*数据维护数据导入*/
    @RequestMapping("/ImportBrand")
    @ResponseBody
    public boolean ImportBrand(MultipartFile file) {
        boolean b = false;
        if (!file.isEmpty()) {
            b = u.ImportBrand(file);
        }
        return b;
    }

    /*数据维护数据导出*/
  /*  @RequestMapping("/exportBrand")
    @ResponseBody
    public boolean exportBrand(MultipartFile file,Integer roleId,HttpServletRequest request){
        boolean b = false;
        if(!file.isEmpty()){
            b = u.exportBrand(file,request);
        }
        return b;
    }*/

    /*模板下载*/
    @RequestMapping("/DownloadTemp")
    @ResponseBody
    public String DownloadTemp() {
        String b = "";
        b = u.DownloadTemp();
        return b;
    }


    /*  部门管理中的树节点展示 */
    @RequestMapping("/DepartmentNode")
    @ResponseBody
    public List<RelationCompDept> DepartmentNode(@RequestBody Map<String, Object> map) {
        List<RelationCompDept> list = u.DepartmentNode(map);
        /*System.out.println("Controller中接收的集合"+list);*/
        return list;
    }


    /*     品类区分配置品类取消原因下拉框数据回显     */
    @RequestMapping("/prodLike")
    @ResponseBody
    public List<ProdType> prodLike() {
        List<ProdType> list = u.prodLike();
        return list;
    }


    /*     品类区分配置取消原因全查     */
    @RequestMapping("/prodAll")
    @ResponseBody
    public List<ProdType> prodAll() {
        List<ProdType> list = u.prodAll();
        return list;
    }


    /*     品类区分配置取消原因模糊查询    */
    @RequestMapping("/SelectLike")
    @ResponseBody
    public List<ProdType> SelectLike(@RequestBody Map<String, Object> map) {
        List<ProdType> list = u.SelectLike(map);
        return list;
    }

    /*     品类区分配置回访内容模糊查询    */
    @RequestMapping("/SelectLikeVisit")
    @ResponseBody
    public List<ProdType> SelectLikeVisit(@RequestBody Map<String, Object> map) {
        List<ProdType> list = u.SelectLikeVisit(map);
        return list;
    }


    /*     品类区分配置取消原因添加   */
    @RequestMapping("/prodtypeAdd")
    @ResponseBody
    public int prodtypeAdd(@RequestBody Map<String, Object> map) {
        int i = 0;
        if (i == 0) {
            i = u.prodtypeAdd(map);
        }
        return i;
    }

    /*     品类区分配置回访内容全查     */
    @RequestMapping("/prodAllVis")
    @ResponseBody
    public List<ProdType> prodAllVis() {
        List<ProdType> list = u.prodAllVis();
        return list;
    }

    /*     品类区分配置回访内容添加   */
    @RequestMapping("/ConcontAdd")
    @ResponseBody
    public int ConcontAdd(@RequestBody Map<String, Object> map) {
        int i = 0;
        if (i == 0) {
            i = u.ConcontAdd(map);
        }
        return i;
    }


    /*     品类区分配置取消原因修改   */
    @RequestMapping("/prodtypeUpdate")
    @ResponseBody
    public int prodtypeUpdate(@RequestBody Map<String, Object> map) {
        int i = 0;
        if (i == 0) {
            i = u.prodtypeUpdate(map);
        }
        return i;
    }

    /*     品类区分配置回访内容修改   */
    @RequestMapping("/ConcontentUpdate")
    @ResponseBody
    public int ConcontentUpdate(@RequestBody Map<String, Object> map) {
        int i = 0;
        if (i == 0) {
            i = u.ConcontentUpdate(map);
        }
        return i;
    }



    /*             维修措施归类                         */

    @RequestMapping("/selectRepair")        //查询下拉值维修措施
    @ResponseBody
    public List<ProdType> selectRepair() {
        List<ProdType> list = u.selectRepair();
        return list;
    }

    @RequestMapping("/selectRepairClass")   //查询下拉值维修措施大类
    @ResponseBody
    public List<ProdType> selectRepairClass() {
        List<ProdType> list = u.selectRepairClass();
        return list;
    }


    @RequestMapping("/SelectLikeRepair")
    @ResponseBody
    public List<ProdType> SelectLikeRepair(@RequestBody Map<String, Object> map) {
        List<ProdType> list = u.SelectLikeRepair(map);
        return list;
    }


    /*     查询二级品类         */
    @RequestMapping("/SelectrepairPro")
    @ResponseBody
    public List<ProdType> SelectrepairPro(@RequestBody Map<String, Object> map) {
        List<ProdType> list = u.SelectrepairPro(map);
        return list;
    }


    /*     品类区分配置维修措施归类添加   */
    @RequestMapping("/repairAdd")
    @ResponseBody
    public int repairAdd(@RequestBody Map<String, Object> map) {
        int i = 0;
        if (i == 0) {
            i = u.repairAdd(map);
        }
        return i;
    }


    /*     品类区分配置维修措施归类全查     */
    @RequestMapping("/prodAllRepair")
    @ResponseBody
    public List<ProdType> prodAllRepair() {
        List<ProdType> list = u.prodAllRepair();
        return list;
    }


    /*   品类区分配置维修措施归类修改查询二级品类   */
    @RequestMapping("/selectSecondrepair")
    @ResponseBody
    public List<ProdType> selectSecondrepair(@RequestBody Map<String, Object> map) {
        List<ProdType> list = u.selectSecondrepair(map);
        return list;
    }


    /*   品类区分配置维修措施归类修改   */
    @RequestMapping("/UpdateRepairSet")
    @ResponseBody
    public int UpdateRepairSet(@RequestBody Map<String, Object> map) {
        int i = 0;
        if (i == 0) {
            i = u.UpdateRepairSet(map);
        }
        return i;
    }


    /*   接口配置全查   */
    @RequestMapping("/queryPort")
    @ResponseBody
    public List<Brand> queryPort() {
        List<Brand> list = u.queryPort();
        return list;
    }

    /*    接口配置查询      */
    @RequestMapping("/queryBrandAll")
    @ResponseBody
    public boolean queryBrandAll(@RequestBody Map<String, Object> map) {
        boolean b = false;
        b = u.queryBrandAll(map);
        return b;
    }


    /*接口配置模糊查询*/
    @RequestMapping("/selectLike")
    @ResponseBody
    public List<Brand> selectLike(@RequestBody Map<String, Object> map) {
        List<Brand> list = u.selectLike(map);
        return list;
    }


    /*接口配置查询品牌名*/

    @RequestMapping("/selectBrandName")
    @ResponseBody
    public List<Brand> selectBrandName() {
        List<Brand> list = u.selectBrandName();
        return list;
    }


    /*接口配置新增*/
    @RequestMapping("/portAdd")
    @ResponseBody
    public int portAdd(@RequestBody Map<String, Object> map) {
        int i = 0;
        if (i == 0) {
            i = u.portAdd(map);
        }
        return i;
    }


    /*接口配置模糊新增*/
    @RequestMapping("/portSet")
    @ResponseBody
    public int portSet(@RequestBody Map<String, Object> map) {
        int i = 0;
        if (i == 0) {
            i = u.portSet(map);
        }
        return i;
    }


    /*规格维护全查*/
    @RequestMapping("/selectGuiZe")
    @ResponseBody
    public List<ProdType> selectGuiZe() {
        List<ProdType> list = u.selectGuiZe();
        return list;
    }

    /*规格维护状态判断*/
    @RequestMapping("/setProductinfoState")
    @ResponseBody
    public boolean setProductinfoState(@RequestBody Map<String, Object> map) {
        boolean b = false;
        b = u.setProductinfoState(map);
        return b;
    }

    /*规则维护查询下拉框*/
    @RequestMapping("/selectProtype")
    @ResponseBody
    public List<ProdType> selectProtype() {
        List<ProdType> list = u.selectProtype();
        return list;
    }

    /*规则维护模糊查询*/
    @RequestMapping("/ProtypeLike")
    @ResponseBody
    public List<Productinfo> ProtypeLike(@RequestBody Map<String, Object> map) {
        List<Productinfo> list = u.ProtypeLike(map);
        return list;
    }


    /*添加时查询一级下拉框*/
    @RequestMapping("/selectFirstPro")
    @ResponseBody
    public List<ProdType> selectFirstPro() {
        List<ProdType> list = u.selectFirstPro();
        return list;
    }


    /*添加产品层次*/
    @RequestMapping("/AddProSub")
    @ResponseBody
    public int AddProSub(@RequestBody Map<String, Object> map) {
        int i = 0;
        i = u.AddProSub(map);
        return i;
    }

    /*添加产品层次父节点*/
    @RequestMapping("/AddProFatherNode")
    @ResponseBody
    public int AddProFatherNode(@RequestBody Map<String, Object> map) {
        int i = 0;
        i = u.AddProFatherNode(map);
        return i;
    }


    /*根据名称查ID*/
    @RequestMapping("/selectProFirstId")
    @ResponseBody
    public ProdType selectProFirstId(@RequestBody Map<String, Object> map) {
        ProdType prodType = u.selectProFirstId(map);
        return prodType;
    }

    @RequestMapping("/selectProSecondId")
    @ResponseBody
    public ProdType selectProSecondId(@RequestBody Map<String, Object> map) {
        ProdType prodType = u.selectProSecondId(map);
        return prodType;
    }


    /*修改产品层次信息*/
    @RequestMapping("/SetProSub")
    @ResponseBody
    public boolean SetProSub(@RequestBody Map<String, Object> map) {
        boolean b = false;
        b = u.SetProSub(map);
        return b;
    }


    /*型号归类全查*/
    @RequestMapping("/selectProSize")
    @ResponseBody
    public List<Brand> selectProSize() {
        List<Brand> list = u.selectProSize();
        return list;
    }

    /*型号归类模糊查询品牌*/
    @RequestMapping("/selectProBrand")
    @ResponseBody
    public List<Brand> selectProBrand() {
        List<Brand> list = u.selectProBrand();
        return list;
    }

    /*型号归类模糊查询品牌*/
    @RequestMapping("/selectSizeLike")
    @ResponseBody
    public List<Brand> selectSizeLike(@RequestBody Map<String, Object> map) {
        List<Brand> list = u.selectSizeLike(map);
        return list;
    }

    /*型号归类模糊查询品牌*/
    @RequestMapping("/AddSizeInfo")
    @ResponseBody
    public int AddSizeInfo(@RequestBody Map<String, Object> map) {
        int i = 0;
        i = u.AddSizeInfo(map);
        return i;
    }


    /*型号归类查询ID*/
    @RequestMapping("/selectThirdId")
    @ResponseBody
    public Productinfo selectThirdId(@RequestBody Map<String, Object> map) {
        Productinfo list = u.selectThirdId(map);
        return list;
    }


    /*修改产品层次*/
    @RequestMapping("/UpdateSizeInfo")
    @ResponseBody
    public boolean UpdateSizeInfo(@RequestBody Map<String, Object> map) {
        boolean b = false;
        b = u.UpdateSizeInfo(map);
        return b;
    }


    /*公告管理全查 */
    @RequestMapping("/selectNotice")
    @ResponseBody
    public List<Notice> selectNotice() {
        List<Notice> list = u.selectNotice();
        return list;
    }


    /*公告管理部门下拉框查询*/
    @RequestMapping("/selectDepartment")
    @ResponseBody
    public List<Department> selectDepartment() {
        List<Department> list = u.selectDepartment();
        return list;
    }


    /*公告管理部门下拉框查询*/
    @RequestMapping("/selectNoticeUser")
    @ResponseBody
    public List<User> selectNoticeUser(@RequestBody Map<String, Object> map) {
        List<User> list = u.selectNoticeUser(map);
        return list;
    }


    /*公告管理模糊查询*/
    @RequestMapping("/selectNoticeLike")
    @ResponseBody
    public List<Notice> selectNoticeLike(@RequestBody Map<String, Object> map) {
        List<Notice> list = u.selectNoticeLike(map);
        return list;
    }


    /*公告管理新增*/
    @RequestMapping("/AddNotice")
    @ResponseBody
    public boolean AddNotice(MultipartFile file, @ModelAttribute("notice")Notice notice){
        System.out.println(file);
        System.out.println(notice);
        boolean b = false;
        return b;
    }


/*
    @RequestMapping(value = "/AddNotice",method = RequestMethod.POST)
    @ResponseBody
    public boolean AddNotice(MultipartFile file,Notice notice){
        System.out.println(file);
        System.out.println(notice);
        boolean b = false;
        return b;
    }*/


    /*角色功能配置*/
    @RequestMapping("/selectRoleKind")
    @ResponseBody
    public List<Role> selectRoleKind() {
        List<Role> list = u.selectRoleKind();
        return list;
    }


    /*角色功能全查*/
    @RequestMapping("/selectAllRole")
    @ResponseBody
    public List<Role> selectAllRole() {
        List<Role> list = u.selectAllRole();
        return list;
    }


    /*角色功能模糊查询*/
    @RequestMapping("/selectRoleLike")
    @ResponseBody
    public List<Role> selectRoleLike(@RequestBody Map<String, Object> map) {
        List<Role> list = u.selectRoleLike(map);
        return list;
    }


    /*角色功能添加之前先去查询数据库中是否已经存在相同名字的管理员*/
    @RequestMapping("/selectRoleAdd")
    @ResponseBody
    public Boolean selectRoleAdd(@RequestBody Map<String, Object> map) {
        boolean b = false;
        b = u.selectRoleAdd(map);
        return b;
    }

    /*角色功能新增*/
    @RequestMapping("/AddRole")
    @ResponseBody
    public boolean AddRole(@RequestBody Map<String, Object> map) {
        boolean b = false;
        b = u.AddRole(map);
        return b;
    }





    /******************************厂商管理********************************/
    /*厂商全查*/
    @RequestMapping("/selectManAll")
    @ResponseBody
    public List<Manufacture> selectManAll() {
        List<Manufacture> list = u.selectManAll();
        return list;
    }


    /*查询省*/
    @RequestMapping("/selectProvince")
    @ResponseBody
    public List<Province> selectProvince() {
        List<Province> list = u.selectProvince();
        return list;
    }

    /*查询市*/
    @RequestMapping("/selectCity")
    @ResponseBody
    public List<Province> selectCity(@RequestBody Map<String, Object> map) {
        List<Province> list = u.selectCity(map);
        return list;
    }

    /*查询区*/
    @RequestMapping("/selectArea")
    @ResponseBody
    public List<Province> selectArea(@RequestBody Map<String, Object> map) {
        List<Province> list = u.selectArea(map);
        return list;
    }









}
