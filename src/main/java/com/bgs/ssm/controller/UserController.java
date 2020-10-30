package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.Relation;
import com.bgs.ssm.pojo.User;
import com.bgs.ssm.service.UserService;
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





}
