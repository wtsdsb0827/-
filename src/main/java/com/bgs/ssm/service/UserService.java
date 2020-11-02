package com.bgs.ssm.service;


import com.bgs.ssm.pojo.Department;
import com.bgs.ssm.pojo.Relation;
import com.bgs.ssm.pojo.RelationCompDept;
import com.bgs.ssm.pojo.User;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Repository
public interface UserService {

    User LoginPro(Map<String,Object> map, HttpSession session);

    List<Relation> LoginTree(Map<String,Object> map);


    String getCode(Map<String,Object> map)throws Exception;

    User PhoneLogin(Map<String,Object> map,HttpSession session);

    List<RelationCompDept> DepartmentNode(Map<String,Object> map);



}
