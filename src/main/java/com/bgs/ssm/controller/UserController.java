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


    @RequestMapping("/LoginUser")
    @ResponseBody
    public User LoginPro(@RequestBody Map<String,Object> map, HttpSession session){
       User user =  u.LoginPro(map,session);
       return user;
    }



    @RequestMapping("/LoginTree")
    @ResponseBody
    public List<Relation> LoginTree(@RequestBody Map<String,Object> map){
        List<Relation> list = u.LoginTree(map);
        return list;
    }






}
