package com.bgs.ssm.mapper;

import com.bgs.ssm.pojo.*;
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


    Company selectCompany(@Param("departmentId") Integer departmentId);


    List<Brand> queryInfo(@Param("roleId") Integer roleId);


    List<Brand> queryLikeInfo(@Param("brandState") String brandState, @Param("brandName") String brandName);


    boolean PutBrand(@Param("brandMingCheng") String brandMingCheng,@Param("roleId") Integer roleId);

}
