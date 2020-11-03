package com.bgs.ssm.service;

import com.bgs.ssm.mapper.UserMapper;
import com.bgs.ssm.pojo.*;
import com.bgs.ssm.util.AliYunMessageUtil;
import com.bgs.ssm.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedList;
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
        System.out.println("传过来的电话："+userPhone);
        User user = u.getCode(userPhone);
        System.out.println("User中的电话："+user.getUserPhone());
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
        System.out.println(s);
        return s;
    }


    @Override
    public User PhoneLogin(Map<String, Object> map,HttpSession session) {
        String userPhone = (String) map.get("userPhone");
       User user = u.PhoneLogin(userPhone);
        session.setAttribute("user",user);
        return user;
    }



    @Override
    public List<Brand> queryInfo(Map<String, Object> map) {
        Integer roleId = (Integer) map.get("roleId");
        List<Brand> list = u.queryInfo(roleId);
        return list;
    }


    @Override
    public List<Brand> queryLikeInfo(Map<String,Object> map){
        String brandName = (String) map.get("brandName");
        String brandState = (String) map.get("brandState");

        List<Brand> list = u.queryLikeInfo(brandState,brandName);
        return list;
    }

    @Override
    public boolean PutBrand(Map<String, Object> map) {
        String brandMingCheng = (String) map.get("brandMingCheng");
        Integer roleId = (Integer) map.get("roleId");
       boolean b = u.PutBrand(brandMingCheng,roleId);
        return b;
    }


    @Override
    public List<RelationCompDept> DepartmentNode(Map<String, Object> map) {
        Integer id = (Integer) map.get("roleId");
        List<RelationCompDept> list = u.DepartmentNode(id);
        System.out.println("DB中的数据"+list);

        List<RelationCompDept> pList = new ArrayList<>();
        List<RelationCompDept> qList = new ArrayList<>();

        for(RelationCompDept r1:list){
            for(RelationCompDept r2:list){
                if(r2.getDepartmentPid()!=0){
                    qList.add(r2);
                }
            }
            if(r1.getDepartmentPid()==0){
                pList.add(r1);
                r1.setChildList(qList);
            }
        }
       System.out.println("pList数据："+pList);
        return pList;
    }



}
