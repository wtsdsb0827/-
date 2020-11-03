package com.bgs.ssm.service;


import com.bgs.ssm.pojo.*;
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

    List<Brand> queryInfo(Map<String,Object> map);

    List<Brand> queryLikeInfo(Map<String,Object> map);

    boolean PutBrand(Map<String,Object> map);



    List<RelationCompDept> DepartmentNode(Map<String,Object> map);


}
