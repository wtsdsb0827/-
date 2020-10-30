package com.bgs.ssm.service;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.bgs.ssm.mapper.UserMapper;
import com.bgs.ssm.pojo.Relation;
import com.bgs.ssm.pojo.User;
import com.bgs.ssm.util.AliYunMessageUtil;
import com.bgs.ssm.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImp implements UserService {


    @Autowired
    private UserMapper u;

    @Override
    public User LoginPro(Map<String,Object> map, HttpSession session) {
       String userPhone = (String) map.get("userPhone");
       String userPassword = (String) map.get("userPassword");
       User user = u.LoginPro(userPhone,MD5Utils.md5(userPassword));
       if(user!=null){
           session.setAttribute("user",user);
       }
        return user;
    }

    @Override
    public List<Relation> LoginTree(Map<String,Object> map) {
        Integer id = (Integer) map.get("id");
        List<Relation> list = u.LoginTree(id);

        List<Relation> Plist = new ArrayList<>();
        for (Relation relation:list){
            if(relation.getPermissionPid()==0){
                Plist.add(relation);
            }
        }

        for(Relation relation:Plist){
            List<Relation> relations = new ArrayList<>();
           for (Relation relation1:list){
               if(relation.getPermissionId()==relation1.getPermissionPid()){
                   relations.add(relation1);
                   List<Relation> relationss = new ArrayList<>();
                       for(Relation relation2:list){
                           if(relation1.getPermissionId()==relation2.getPermissionPid()){
                               relationss.add(relation2);
                           }
                       }
                       relation1.setChildList(relationss);
               }
           }
           relation.setChildList(relations);
        }
        /*System.out.println(Plist);*/
        return Plist;
    }

    @Override
    public String getCode(Map<String,Object> map) throws Exception {
        String userPhone= (String) map.get("userPhone");
        User user = u.getCode(userPhone);
        String coder = "";
        if(userPhone.equals(user.getUserPhone())){
            coder = getCoder();
            AliYunMessageUtil.sendSms(userPhone, coder);
        }
        return coder;
    }


    public String getCoder() {
        int newcode = (int)(Math.random()*9999)+100;
        String s =Integer.toString(newcode);
        return s;
    }

}
