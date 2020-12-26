package com.bgs.ssm.mapper;

import com.bgs.ssm.pojo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {

    User LoginPro(@Param("userPhone") String userPhone, @Param("userPassword") String userPassword);

    List<Relation> LoginTree(@Param("id") Integer id);

    User getCode(@Param("userPhone") String userPhone);


    User getCoders(@Param("userPhone") String userPhone);

    int SetPass(@Param("userPhone") String userPhone, @Param("userPassword") String userPassword);

    List<RelationCompDept> DepartmentNode(@Param("id") Integer id);


    Company selectCompany(@Param("departmentId") Integer departmentId);


    List<Brand> queryInfo();


    List<Brand> queryLikeInfo(@Param("brandState") String brandState, @Param("brandName") String brandName);


    boolean PutBrand(@Param("brandMingCheng") String brandMingCheng, @Param("brandState") String brandState);


    boolean useState(@Param("brandState") String brandState, @Param("brandId") Integer brandId);


    boolean stopState(@Param("brandState") String brandState, @Param("brandId") Integer brandId);


    boolean ImportBrand(@Param("list1") List<Brand> list1);


    /*                   品类             */
    List<ProdType> prodLike();

    List<ProdType> prodAll();

    List<ProdType> SelectLike(@Param("conReason") String conReason, @Param("prodtypeName") String prodtypeName, @Param("conState") String conState);

    int prodtypeAdd(@Param("prodtypeName") Integer prodtypeName, @Param("conReason") String conReason, @Param("conState") String conState);

    int prodtypeUpdate(@Param("conId") Integer conId, @Param("prodtypeName") Integer prodtypeName, @Param("conReason") String conReason, @Param("conState") String conState);


    List<ProdType> SelectLikeVisit(@Param("visitName") String visitName, @Param("prodtypeName") String prodtypeName, @Param("visitState") String visitState);

    int ConcontAdd(@Param("prodtypeName") Integer prodtypeName, @Param("visitName") String visitName, @Param("visitState") String visitState);

    int ConcontentUpdate(@Param("visitId") Integer visitId, @Param("prodtypeName") Integer prodtypeName, @Param("visitName") String visitName, @Param("visitState") String visitState);

    List<ProdType> prodAllVis();

    List<ProdType> selectRepair();

    List<ProdType> selectRepairClass();

    List<ProdType> SelectLikeRepair(@Param("repairDoing") String conRepair, @Param("repairClass") String repairClass, @Param("prodtypeName") String prodtypeName, @Param("repairState") String repairState);

    List<ProdType> SelectrepairPro(@Param("prodtypeId") Integer prodtypeId);

    int repairAdd(@Param("prodtypeName") Integer prodtypeName, @Param("repairKind") String repairKind, @Param("repairDoing") String repairDoing, @Param("repairState") String repairState);

    List<ProdType> prodAllRepair();

    List<ProdType> selectSecondrepair(@Param("prodtypeId") Integer prodtypeId);

    int UpdateRepairSet(@Param("repairId") Integer repairId, @Param("prodtypeId") Integer prodtypeId, @Param("repairKind") String repairKind, @Param("repairDoing") String repairDoing, @Param("repairState") String repairState);


    List<Brand> queryPort();


    List<Brand> selectLike(@Param("portName") String portName, @Param("portState") String portState);


    User PhoneLogin(@Param("userPhone") String userPhone);


    List<Brand> selectBrandName();

    int portAdd(@Param("portName") String portName, @Param("portState") String portState, @Param("brandId") Integer brandId);


    int portSet(@Param("portState") String portState, @Param("portId") Integer portId);


    List<ProdType> selectGuiZe();


    List<Notice> selectNotice();


    List<Department> selectDepartment();


    List<User> selectNoticeUser(@Param("departmentId") Integer departmentId);


    List<Notice> selectNoticeLike(@Param("noticeKeyword") String noticeKeyword, @Param("noticeReleasetime") String noticeReleasetime, @Param("noticeEndTime") String noticeEndTime, @Param("departmentName") String departmentName, @Param("userName") String userName);


    boolean setProductinfoState(@Param("productinfoId") Integer productinfoId, @Param("productinfoState") String productinfoState);


    List<ProdType> selectProtype();


    List<Productinfo> ProtypeLike(@Param("productinfoGroup") Integer productinfoGroup, @Param("productinfoState") String productinfoState);


    List<ProdType> selectFirstPro();


    int AddSecondPro(Map<String, Object> map);


    int AddProInfo(@Param("prodtypePid") Integer prodtypePid, @Param("prodtypeId") Integer prodtypeId, @Param("prodtypeIdThird") Integer prodtypeIdThird, @Param("productinfoState") String productinfoState);


    int AddSecondThird(Map<String, Object> map);


    ProdType selectProFirstId(@Param("productinfoSecond") String productinfoSecond);


    ProdType selectProSecondId(@Param("productinfoGroup") String productinfoGroup);


    boolean SetFirstPro(@Param("prodFirstId") Integer prodFirstId, @Param("setSecondPro") String setSecondPro);


    boolean SetSecondPro(@Param("secondId") Integer secondId, @Param("setThirdPro") String setThirdPro);


    boolean SetProInfo(@Param("productinfoId") Integer productinfoId, @Param("productinfoState") String productinfoState);


    int AddProFatherNode(@Param("FatherProName") String FatherProName);

    List<Brand> selectProSize();

    List<Brand> selectProBrand();

    List<Brand> selectSizeLike(@Param("brandName") Integer brandName, @Param("productinfoGroup") Integer productinfoGroup, @Param("protypesizeName") String protypesizeName, @Param("productinfoState") String productinfoState);

    Productinfo selectSizeId(@Param("prodinfoId") Integer prodinfoId);

    int AddSizeInfo(@Param("brandId") Integer brandId, @Param("productinfoId") int productinfoId, @Param("protypesizeName") String protypesizeName);

    Productinfo selectThirdId(@Param("prodinfoId") Integer prodinfoId);

    boolean updateproInfoState(@Param("productinfoId") Integer productinfoId, @Param("productinfoState") String productinfoState);

    boolean updateproSizeTab(@Param("protypesizeId") Integer protypesizeId, @Param("protypesizeName") String protypesizeName, @Param("productinfoId") Integer productinfoId);


    List<Role> selectRoleKind();


    List<Role> selectAllRole();


    List<Role> selectRoleLike(@Param("roleName") String roleName, @Param("roleKind") String roleKind);


    boolean AddRole(@Param("roleName") String roleName, @Param("roleKind") String roleKind);




    List<Manufacture> selectManAll();


    List<Province> selectProvince();


    List<Province> selectCity(@Param("provincePro")String provincePro);


    List<Province> selectArea(@Param("provinceCity")String provinceCity);


}
