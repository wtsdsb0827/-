package com.bgs.ssm.service;


import com.bgs.ssm.pojo.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Repository
public interface UserService {

    User LoginPro(Map<String, Object> map, HttpSession session);

    List<Relation> LoginTree(Map<String, Object> map);

    String getCode(Map<String, Object> map) throws Exception;

    User getCoders(Map<String, Object> map);

    User PhoneLogin(Map<String, Object> map, HttpSession session);

    List<Brand> queryInfo();

    List<Brand> queryLikeInfo(Map<String, Object> map);

    boolean PutBrand(Map<String, Object> map);

    boolean setState(Map<String, Object> map);

    List<RelationCompDept> DepartmentNode(Map<String, Object> map);


    boolean ImportBrand(MultipartFile files);

/*
    boolean exportBrand(MultipartFile file,HttpServletRequest request);
*/

    List<ProdType> prodLike();

    List<ProdType> prodAll();

    List<ProdType> SelectLike(Map<String, Object> map);

    int prodtypeAdd(Map<String, Object> map);

    int prodtypeUpdate(Map<String, Object> map);

    List<ProdType> SelectLikeVisit(Map<String, Object> map);

    int ConcontAdd(Map<String, Object> map);

    int ConcontentUpdate(Map<String, Object> map);

    List<ProdType> prodAllVis();

    List<ProdType> selectRepair();

    List<ProdType> selectRepairClass();

    List<ProdType> SelectLikeRepair(Map<String, Object> map);

    List<ProdType> SelectrepairPro(Map<String, Object> map);


    int repairAdd(Map<String, Object> map);

    List<ProdType> prodAllRepair();

    List<ProdType> selectSecondrepair(Map<String, Object> map);

    int UpdateRepairSet(Map<String, Object> map);


    List<Brand> queryPort();

    List<Brand> selectLike(Map<String, Object> map);

    int SetPass(Map<String, Object> map);


    List<Brand> selectBrandName();

    int portAdd(Map<String, Object> map);

    boolean queryBrandAll(Map<String, Object> map);


    int portSet(Map<String, Object> map);

    List<ProdType> selectGuiZe();


    List<Notice> selectNotice();


    List<Department> selectDepartment();


    List<User> selectNoticeUser(Map<String, Object> map);


    List<Notice> selectNoticeLike(Map<String, Object> map);

    boolean setProductinfoState(Map<String, Object> map);


    List<ProdType> selectProtype();


    List<Productinfo> ProtypeLike(Map<String, Object> map);


    List<ProdType> selectFirstPro();

    int AddProSub(Map<String, Object> map);


    ProdType selectProFirstId(Map<String, Object> map);

    ProdType selectProSecondId(Map<String, Object> map);

    boolean SetProSub(Map<String, Object> map);

    int AddProFatherNode(Map<String, Object> map);

    List<Brand> selectProSize();


    List<Brand> selectProBrand();

    List<Brand> selectSizeLike(Map<String, Object> map);


    int AddSizeInfo(Map<String, Object> map);

    Productinfo selectThirdId(Map<String, Object> map);

    boolean UpdateSizeInfo(Map<String, Object> map);


    List<Role> selectRoleKind();


    List<Role> selectAllRole();


    List<Role> selectRoleLike(@RequestBody Map<String, Object> map);


    boolean selectRoleAdd(@RequestBody Map<String, Object> map);


    boolean AddRole(Map<String, Object> map);


    String DownloadTemp();

    List<Manufacture> selectManAll();


    List<Province> selectProvince();

    List<Province> selectCity(Map<String, Object> map);


    List<Province> selectArea(Map<String, Object> map);


}
