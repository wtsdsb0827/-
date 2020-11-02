package com.bgs.ssm.mapper;

import com.bgs.ssm.pojo.Department;
import com.bgs.ssm.pojo.Relation;
import com.bgs.ssm.pojo.RelationCompDept;
import com.bgs.ssm.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface UserMapper {

    User LoginPro(@Param("userPhone") String userPhone, @Param("userPassword") String userPassword);


    List<Relation> LoginTree(@Param("id") Integer id);


    User getCode(@Param("userPhone") String userPhone);


    User PhoneLogin(@Param("userPhone") String userPhone);


    List<RelationCompDept> DepartmentNode(@Param("id") Integer id);


}
