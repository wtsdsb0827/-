package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.*;
import com.bgs.ssm.service.UserService;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
@RequestMapping("pro")
@Controller
public class UserController {

    @Autowired
    private UserService u;


    /* 用户登录 */
    @RequestMapping("/LoginUser")
    @ResponseBody
    public User LoginPro(@RequestBody Map<String,Object> map, HttpSession session){
       User user =  u.LoginPro(map,session);
       return user;
    }



    /* 菜单查询 */
    @RequestMapping("/LoginTree")
    @ResponseBody
    public List<Relation> LoginTree(@RequestBody Map<String,Object> map){
        List<Relation> list = u.LoginTree(map);
        return list;
    }

    /* 获取验证码 */

    @RequestMapping("/getCode")
    @ResponseBody
    public String getCode(@RequestBody Map<String,Object> map) throws Exception{
        String code = u.getCode(map);
        return code;
    }


    /*  校验手机号完成调用方法进行登录  */
    @RequestMapping("/PhoneLogin")
    @ResponseBody
    public User PhoneLogin(@RequestBody Map<String,Object> map,HttpSession session){
        User user = u.PhoneLogin(map,session);
        return user;
    }


    /*            规则维护数据查询                       */
    @RequestMapping("/queryInfo")
    @ResponseBody
    public List<Brand> queryInfo(@RequestBody Map<String,Object> map){
        List<Brand> list = u.queryInfo(map);
        return list;
    }

    /*            模糊查询              */
    @RequestMapping("/queryLikeInfo")
    @ResponseBody
    public List<Brand> queryLikeInfo(@RequestBody Map<String,Object> map){
        List<Brand> list = u.queryLikeInfo(map);
        System.out.println("返回前端的数据："+list);
        return list;
    }


    /*                 添加              */
    @RequestMapping("/PutBrand")
    @ResponseBody
    public boolean PutBrand(@RequestBody Map<String,Object> map){
        boolean b = false;
        b = u.PutBrand(map);
        return b;
    }






    /*  部门管理中的树节点展示 */
    @RequestMapping("/DepartmentNode")
    @ResponseBody
    public List<RelationCompDept> DepartmentNode(@RequestBody Map<String,Object> map){
        List<RelationCompDept> list = u.DepartmentNode(map);
        System.out.println("Controller中接收的集合"+list);
        return list;
    }




}
