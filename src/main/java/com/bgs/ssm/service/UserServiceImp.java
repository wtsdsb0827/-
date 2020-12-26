package com.bgs.ssm.service;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.GetObjectRequest;
import com.bgs.ssm.mapper.UserMapper;
import com.bgs.ssm.oss.PropertiesReader;
import com.bgs.ssm.pojo.*;
import com.bgs.ssm.util.AliYunMessageUtil;
import com.bgs.ssm.util.MD5Utils;
import com.bgs.ssm.util.TemplateExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Service
public class UserServiceImp implements UserService {


    @Autowired
    private UserMapper u;

    @Override
    public User LoginPro(Map<String, Object> map, HttpSession session) {
        String userPhone = (String) map.get("userPhone");
        String userPassword = (String) map.get("userPassword");
        User user = u.LoginPro(userPhone, MD5Utils.md5(userPassword));
        if (user != null) {
            session.setAttribute("user", user);
        }
        return user;
    }


    @Override
    public List<Relation> LoginTree(Map<String, Object> map) {
        Integer id = (Integer) map.get("id");
        List<Relation> list = u.LoginTree(id);      //从数据库中查出的所有菜单列表
        List<Relation> Plist = new ArrayList<>();   //存放子节点的集合
        for (Relation relation : list) {
            if (relation.getPermissionPid() == 0) {     //判断PID==0，遍历父节点放到子集合中
                Plist.add(relation);
            }
        }

        for (Relation relation : Plist) {      //遍历子节点集合
            List<Relation> childList = getChild(relation.getPermissionId(), list);   //把遍历出的子节点的ID和父集合调用递归方法
            relation.setChildList(childList);       //遍历出的数据就放到Plist集合中去
        }

        return Plist;
    }

    public List<Relation> getChild(Integer permissionId, List<Relation> list) {     //递归
        List<Relation> listChild = new ArrayList<>();
        for (Relation rr : list) {
            if (rr.getPermissionPid() == permissionId) {        //拿到子节点的ID与父节点的PID比较
                listChild.add(rr);
            }
        }
        for (Relation relation : listChild) {       //当还有下一级时再调用递归方法
            relation.setChildList(getChild(relation.getPermissionId(), list));
        }
        if (listChild.size() == 0) {    //当没有下一级时就赋值空
            return null;
        }

        return listChild;
    }



   /* @Override
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
        *//*System.out.println(Plist);*//*
        return Plist;
    }*/

    @Override
    public User getCoders(Map<String, Object> map) {
        String userPhone = (String) map.get("userPhone");
        User list = u.getCoders(userPhone);
        return list;
    }


    @Override
    public String getCode(Map<String, Object> map) throws Exception {    /*生成验证码*/
        String userPhone = (String) map.get("userPhone");
        String coder = "";
        coder = getCoder();
        AliYunMessageUtil.sendSms(userPhone, coder);
        return coder;       //返回coder
    }

    public String getCoder() {
        int newcode = (int) (Math.random() * 9999) + 100;
        String s = Integer.toString(newcode);
        System.out.println(s);
        return s;
    }


    @Override
    public User PhoneLogin(Map<String, Object> map, HttpSession session) {
        String userPhone = (String) map.get("userPhone");
        User user = u.PhoneLogin(userPhone);
        session.setAttribute("user", user);
        return user;
    }


    @Override
    public int SetPass(Map<String, Object> map) {
        int i = 0;
        String userPhone = (String) map.get("userPhone");
        String userPassword = (String) map.get("userPassword");
        i = u.SetPass(userPhone, MD5Utils.md5(userPassword));
        return i;
    }

    @Override
    public List<Brand> selectBrandName() {
        return u.selectBrandName();
    }


    @Override
    public List<Brand> queryInfo() {
        List<Brand> list = u.queryInfo();
        return list;
    }


    @Override
    public List<Brand> queryLikeInfo(Map<String, Object> map) {
        String brandName = (String) map.get("brandName");
        String brandState = (String) map.get("brandState");

        List<Brand> list = u.queryLikeInfo(brandState, brandName);
        return list;
    }

    @Override
    public boolean PutBrand(Map<String, Object> map) {
        String brandMingCheng = (String) map.get("brandMingCheng");
        String brandState = (String) map.get("brandState");
        boolean b = u.PutBrand(brandMingCheng, brandState);
        return b;
    }


    @Override
    public boolean setState(Map<String, Object> map) {
        String brandState = (String) map.get("brandState");
        Integer brandId = (Integer) map.get("brandId");
        boolean b = false;
        if (brandState != null & brandState.equals("使用中")) {
            brandState = "停用中";
            b = u.useState(brandState, brandId);
            return b;
        }
        if (brandState != null & brandState.equals("停用中")) {
            brandState = "使用中";
            b = u.stopState(brandState, brandId);
            return b;
        }
        return b;
    }


    @Override
    public List<RelationCompDept> DepartmentNode(Map<String, Object> map) {
        Integer id = (Integer) map.get("roleId");
        List<RelationCompDept> list = u.DepartmentNode(id);
        /*System.out.println("DB中的数据"+list);*/

        List<RelationCompDept> pList = new ArrayList<>();
        List<RelationCompDept> qList = new ArrayList<>();

        for (RelationCompDept r2 : list) {
            if (r2.getDepartmentPid() != 0) {
                qList.add(r2);
            }
        }
        for (RelationCompDept r1 : list) {
            if (r1.getDepartmentPid() == 0) {
                pList.add(r1);
                r1.setChildList(qList);
            }
        }
        /* System.out.println("pList数据："+pList);*/
        return pList;
    }


    /*  导入  */
    @Override
    public boolean ImportBrand(MultipartFile files) {
        boolean b = false;
        try {
            System.out.println(files);
            List<List<String>> list = new TemplateExcelUtil<>().readExcel(files.getInputStream());
            System.out.println("list:" + list);

            List<Brand> list1 = new ArrayList<>();

            Brand brand = null;
            for (int i = 0; i < list.size(); i++) {
                brand = new Brand();
                String s1 = list.get(i).get(0);
                String s2 = list.get(i).get(1);
                brand.setBrandName(s1); //list:[[ViVo, 使用中], [小米, 停用中]]    list.get(i)获取的是List中的两个元素，get(0)是具体某一个
                brand.setBrandState(s2);
                list1.add(brand);
                /*System.out.println("list1："+list1);*/
            }
            b = u.ImportBrand(list1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }


    /*模板下载*/
    @Override
    public String DownloadTemp() {

        String objectName = "TemplateExcel.xlsx";
        String pathName = "D:/TemplateExcel.xlsx";

        // 创建OSSClient实例。
        OSS ossClient = new OSSClientBuilder().build(PropertiesReader.get("endpoint"), PropertiesReader.get("accessKeyId"), PropertiesReader.get("accessKeySecret"));

        // 下载OSS文件到本地文件。如果指定的本地文件存在会覆盖，不存在则新建。
        ossClient.getObject(new GetObjectRequest(PropertiesReader.get("bucket"), objectName), new File(pathName));

        // 关闭OSSClient。
        ossClient.shutdown();
        return pathName;
    }



    /*导出*/
   /* @Override
    public boolean exportBrand(MultipartFile file,HttpServletRequest request) {
        boolean b = false;
        try {
            String temp =  request.getServletContext().getRealPath("static")+"/doc"+"/exportBrand.xlsx";    //模板路径是固定的
            String target = "C:/Users/dell/Desktop/"+file.getOriginalFilename();        *//*目标存储路径*//*
            List<String> list2 = BeanBrand();
            List<Brand> list = u.queryInfo();
            new TemplateExcelUtil<>().exportExcel(temp,target,list2,list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    private List<String> BeanBrand() {
        List<String> list = new ArrayList<>();
        list.add("brandId");
        list.add("brandName");
        list.add("brandState");
        list.add("roleId");
        return list;
    }
*/

    @Override
    public List<ProdType> prodLike() {
        List<ProdType> list = u.prodLike();
        List<ProdType> list1 = new ArrayList<>();
        for (ProdType pro : list) {
            if (pro.getProdtypePid() == 0) {
                list1.add(pro);
            }
        }
        return list1;
    }


    @Override
    public List<ProdType> prodAll() {
        List<ProdType> list = u.prodAll();
        return list;
    }


    @Override
    public List<ProdType> SelectLike(Map<String, Object> map) {
        String conReason = (String) map.get("conReason");
        String prodtypeName = (String) map.get("prodtypeName");
        String conState = (String) map.get("conState");
        List<ProdType> list = u.SelectLike(conReason, prodtypeName, conState);
        return list;
    }


    @Override
    public int prodtypeAdd(Map<String, Object> map) {
        int i = 0;
        Integer prodtypeName = (Integer) map.get("prodtypeName");
        String conReason = (String) map.get("conReason");
        String conState = (String) map.get("conState");
        if (i == 0) {
            i = u.prodtypeAdd(prodtypeName, conReason, conState);
        }
        return i;
    }


    @Override
    public int prodtypeUpdate(Map<String, Object> map) {
        int i = 0;
        Integer prodtypeName = (Integer) map.get("prodtypeName");
        String conReason = (String) map.get("conReason");
        String conState = (String) map.get("conState");
        Integer conId = (Integer) map.get("conId");
        if (i == 0) {
            i = u.prodtypeUpdate(conId, prodtypeName, conReason, conState);
        }
        return i;
    }

    @Override
    public List<ProdType> SelectLikeVisit(Map<String, Object> map) {
        String visitName = (String) map.get("visitName");
        String prodtypeName = (String) map.get("prodtypeName");
        String visitState = (String) map.get("visitState");
        List<ProdType> list = u.SelectLikeVisit(visitName, prodtypeName, visitState);
        return list;
    }

    @Override
    public int ConcontAdd(Map<String, Object> map) {
        int i = 0;
        Integer prodtypeName = (Integer) map.get("prodtypeName");
        String visitName = (String) map.get("visitName");
        String visitState = (String) map.get("visitState");
        if (i == 0) {
            i = u.ConcontAdd(prodtypeName, visitName, visitState);
        }
        return i;
    }

    @Override
    public int ConcontentUpdate(Map<String, Object> map) {
        int i = 0;
        Integer prodtypeName = (Integer) map.get("prodtypeName");
        String visitName = (String) map.get("visitName");
        String visitState = (String) map.get("visitState");
        Integer visitId = (Integer) map.get("visitId");
        if (i == 0) {
            i = u.ConcontentUpdate(visitId, prodtypeName, visitName, visitState);
        }
        return i;
    }

    @Override
    public List<ProdType> prodAllVis() {
        List<ProdType> list = u.prodAllVis();
        return list;
    }

    @Override
    public List<ProdType> selectRepair() {
        List<ProdType> list = u.selectRepair();
        return list;
    }

    @Override
    public List<ProdType> selectRepairClass() {
        List<ProdType> list = u.selectRepairClass();
        return list;
    }

    @Override
    public List<ProdType> SelectLikeRepair(Map<String, Object> map) {
        String repairDoing = (String) map.get("repairDoing");
        String repairClass = (String) map.get("repairClass");
        String prodtypeName = (String) map.get("prodtypeName");
        String repairState = (String) map.get("repairState");
        List<ProdType> list = u.SelectLikeRepair(repairDoing, repairClass, prodtypeName, repairState);
        return list;

    }

    @Override
    public List<ProdType> SelectrepairPro(Map<String, Object> map) {
        Integer prodtypeId = (Integer) map.get("proId");
        List<ProdType> list = u.SelectrepairPro(prodtypeId);
        List<ProdType> list1 = new ArrayList<>();
        for (ProdType pp : list) {
            if (pp.getProdtypePid() == prodtypeId) {
                list1.add(pp);
            }
        }
        return list1;
    }

    @Override
    public int repairAdd(Map<String, Object> map) {
        int i = 0;
        Integer prodtypeName = (Integer) map.get("prodtypeName");
        String repairKind = (String) map.get("repairKind");
        String repairDoing = (String) map.get("repairDoing");
        String repairState = (String) map.get("repairState");
        if (i == 0) {
            i = u.repairAdd(prodtypeName, repairKind, repairDoing, repairState);
        }
        return i;
    }

    @Override
    public List<ProdType> prodAllRepair() {
        List<ProdType> list = u.prodAllRepair();
        return list;
    }

    @Override
    public List<ProdType> selectSecondrepair(Map<String, Object> map) {
        Integer prodtypeId = (Integer) map.get("prodtypeId");
        List<ProdType> list = u.selectSecondrepair(prodtypeId);
        List<ProdType> list1 = new ArrayList<>();
        for (ProdType pp : list) {
            if (pp.getProdtypePid() == prodtypeId) {
                list1.add(pp);
            }
        }
        return list1;
    }

    @Override
    public int UpdateRepairSet(Map<String, Object> map) {
        int i = 0;
        Integer repairId = (Integer) map.get("repairId");
        Integer prodtypeId = (Integer) map.get("prodtypeId");
        String repairKind = (String) map.get("repairKind");
        String repairDoing = (String) map.get("repairDoing");
        String repairState = (String) map.get("repairState");
        if (i == 0) {
            i = u.UpdateRepairSet(repairId, prodtypeId, repairKind, repairDoing, repairState);
        }
        return i;
    }

    @Override
    public List<Brand> queryPort() {
        List<Brand> list = u.queryPort();
        return list;
    }

    @Override
    public List<Brand> selectLike(Map<String, Object> map) {
        String portName = (String) map.get("portName");
        String portState = (String) map.get("portState");
        List<Brand> list = u.selectLike(portName, portState);
        return list;
    }


    @Override
    public int portAdd(Map<String, Object> map) {
        int i = 0;
        String portName = (String) map.get("portName");
        String portState = (String) map.get("portState");
        Integer brandId = (Integer) map.get("brandId");
        i = u.portAdd(portName, portState, brandId);
        return i;
    }

    @Override
    public boolean queryBrandAll(Map<String, Object> map) {
        boolean b = false;
        String brandName = (String) map.get("brandName");
        List<Brand> list = u.queryInfo();
        for (Brand bb : list) {
            if (brandName.equals(bb.getBrandName())) {
                b = true;
            }
        }
        return b;
    }

    @Override
    public int portSet(Map<String, Object> map) {
        int i = 0;
        String portState = (String) map.get("portState");
        Integer portId = (Integer) map.get("portId");
        i = u.portSet(portState, portId);
        return i;
    }

    @Override
    public List<ProdType> selectGuiZe() {
        List<ProdType> list = u.selectGuiZe();
        return list;
    }

    @Override
    public List<Notice> selectNotice() {
        return u.selectNotice();
    }


    @Override
    public List<Department> selectDepartment() {
        return u.selectDepartment();
    }

    @Override
    public List<User> selectNoticeUser(Map<String, Object> map) {
        Integer departmentId = (Integer) map.get("departmentId");
        List<User> list = u.selectNoticeUser(departmentId);
        return list;
    }

    @Override
    public List<Notice> selectNoticeLike(Map<String, Object> map) {
        List<Notice> list = null;
        String noticeKeyword = (String) map.get("noticeKeyword");
        String noticeReleasetime = (String) map.get("noticeReleasetime");
        String noticeEndTime = (String) map.get("noticeEndTime");
      /*  System.out.println(stime);
        System.out.println(etime);

            String noticeReleasetime = stime.substring(0, 10)+"\t"+stime.substring(12, 23);
            String noticeEndTime = etime.substring(0, 10)+"\t"+etime.substring(12, 23);*/
        String departmentName = (String) map.get("departmentName");
        String userName = (String) map.get("userName");
        list = u.selectNoticeLike(noticeKeyword, noticeReleasetime, noticeEndTime, departmentName, userName);
        return list;
    }

    @Override
    public boolean setProductinfoState(Map<String, Object> map) {
        boolean b = false;
        Integer productinfoId = (Integer) map.get("productinfoId");
        String productinfoState = (String) map.get("productinfoState");
        if (productinfoState != null && productinfoState.equals("使用中")) {
            productinfoState = "停用中";
            b = u.setProductinfoState(productinfoId, productinfoState);
            return b;
        }
        if (productinfoState != null && productinfoState.equals("停用中")) {
            productinfoState = "使用中";
            b = u.setProductinfoState(productinfoId, productinfoState);
            return b;
        }
        return b;
    }


    @Override
    public List<ProdType> selectProtype() {
        List<ProdType> list = u.selectProtype();
        return list;
    }


    @Override
    public List<Productinfo> ProtypeLike(Map<String, Object> map) {
        System.out.println(map);
        List<Map<Productinfo, Object>> proCengCi = (List<Map<Productinfo, Object>>) map.get("proCengCi");
        String productinfoState = (String) map.get("productinfoState");
        Object[] object1 = proCengCi.toArray();    //将Map<Productinfo,Object>转成数组
        String string1 = Arrays.toString(object1);
        /*System.out.println(string1); */       //[2, 5, 11]
        String s = "";
        String replace = string1.replace("]", "");  //将符号 ‘ ]’替换成空
        String[] split = replace.split(",");    //按照逗号切割
        for (int i = 0; i < split.length; i++) {
            s = split[i];
        }
        String trim = s.trim();     //去除首位空格
        Integer productinfoGroup = Integer.parseInt(trim);      //将String转成Int
        List<Productinfo> list = u.ProtypeLike(productinfoGroup, productinfoState);
        return list;
    }


    @Override
    public List<ProdType> selectFirstPro() {
        return u.selectFirstPro();
    }


    /*添加产品层次*/
    @Override
    @Transactional
    public int AddProSub(Map<String, Object> map) {
        System.out.println(map);
        int i = 0;
        Integer prodtypePid = (Integer) map.get("prodtypePid");        //pid == productinfo_type       一
        String thirdName = (String) map.get("thirdName");
        i = u.AddSecondPro(map);       //第一次把map传过去
        Integer prodtypeId = (Integer) map.get("prodtypeId");       //主键自增返回得到的ID  // prodtypeId == productinfo_second     二

        Map<String, Object> map1 = new HashMap<>();
        map1.put("prodtypeId", prodtypeId);
        map1.put("prodtypePid", prodtypeId);
        map1.put("thirdName", thirdName);

        i = AddSecondThird(map1);

        Integer prodtypeIdThird = (Integer) map1.get("prodtypeIdTwo");     //prodtypeIdThird ==productinfo_group       三        获取的是第二级自增的ID
        String productinfoState = (String) map.get("productinfoState");
        i = AddProInfo(prodtypePid, prodtypeId, prodtypeIdThird, productinfoState);       //添加信息表数据
        return i;
    }

    @Transactional
    public int AddSecondThird(Map<String, Object> map) {
        int i = 0;
        i = u.AddSecondThird(map);
        return i;
    }

    @Transactional
    public int AddProInfo(Integer prodtypePid, Integer prodtypeId, Integer prodtypeIdThird, String productinfoState) {
        int i = 0;
        i = u.AddProInfo(prodtypePid, prodtypeId, prodtypeIdThird, productinfoState);
        return i;
    }

    /*添加父节点*/
    @Override
    public int AddProFatherNode(Map<String, Object> map) {
        int i = 0;
        String FatherProName = (String) map.get("FatherProName");
        i = u.AddProFatherNode(FatherProName);
        return i;
    }


    /*根据品类名查询对应的ID，用于修改操作*/
    @Override
    public ProdType selectProFirstId(Map<String, Object> map) {
        String productinfoSecond = (String) map.get("productinfoSecond");
        ProdType prodType;
        prodType = u.selectProFirstId(productinfoSecond);
        return prodType;
    }

    @Override
    public ProdType selectProSecondId(Map<String, Object> map) {
        String productinfoGroup = (String) map.get("productinfoGroup");
        ProdType prodType;
        prodType = u.selectProSecondId(productinfoGroup);
        return prodType;
    }


    /*修改产品层次*/
    @Override
    public boolean SetProSub(Map<String, Object> map) {
        boolean b = false;
        Integer prodFirstId = (Integer) map.get("prodFirstId");
        Integer SecondId = (Integer) map.get("SecondId");
        String SetSecondPro = (String) map.get("SetSecondPro");
        String SetThirdPro = (String) map.get("SetThirdPro");
        String productinfoState = (String) map.get("productinfoState");     //状态
        Integer productinfoId = (Integer) map.get("productinfoId");     //品类信息表主键
        b = SetFirstPro(prodFirstId, SetSecondPro);
        b = SetSecondPro(SecondId, SetThirdPro);
        b = SetProInfo(productinfoId, productinfoState);
        return b;
    }


    @Transactional
    public boolean SetFirstPro(Integer prodFirstId, String setSecondPro) {
        boolean b = false;
        b = u.SetFirstPro(prodFirstId, setSecondPro);
        return b;
    }

    @Transactional
    public boolean SetSecondPro(Integer secondId, String setThirdPro) {
        boolean b = false;
        b = u.SetSecondPro(secondId, setThirdPro);
        return b;
    }

    /*修改品类信息表的状态*/
    @Transactional
    public boolean SetProInfo(Integer productinfoId, String productinfoState) {
        boolean b = false;
        b = u.SetProInfo(productinfoId, productinfoState);
        return b;
    }


    /****************************************************型号归类************************************************************/
    /*全查*/
    @Override
    public List<Brand> selectProSize() {
        return u.selectProSize();
    }

    @Override
    public List<Brand> selectProBrand() {
        return u.selectProBrand();
    }

    @Override
    public List<Brand> selectSizeLike(Map<String, Object> map) {
        System.out.println(map.get("proSizeCengCi"));
        List<Map<Brand, Object>> proSizeCengCi = (List<Map<Brand, Object>>) map.get("proSizeCengCi");
        String productinfoState = (String) map.get("productinfoState");
        Object[] object1 = proSizeCengCi.toArray();    //将Map<Productinfo,Object>转成数组
        String string1 = Arrays.toString(object1);
        System.out.println(string1);        //[2, 5, 11]
        String s = "";
        String replace = string1.replace("]", "");  //将符号 ‘ ]’替换成空
        String[] split = replace.split(",");    //按照逗号切割
        for (int i = 0; i < split.length; i++) {
            s = split[i];
        }
        String trim = s.trim();     //去除首位空格
        Integer productinfoGroup = Integer.parseInt(trim);      //将String转成Int

        Integer brandName = (Integer) map.get("brandName");
        String protypesizeName = (String) map.get("protypesizeName");
        List<Brand> list = u.selectSizeLike(brandName, productinfoGroup, protypesizeName, productinfoState);
        return list;
    }

    @Override
    public int AddSizeInfo(Map<String, Object> map) {
        int h = 0;
        Integer brandId = (Integer) map.get("brandId");
        String protypesizeName = (String) map.get("protypesizeName");
        List<Map<Brand, Object>> ProCengciAdd = (List<Map<Brand, Object>>) map.get("ProCengciAdd");
        Object[] object1 = ProCengciAdd.toArray();    //将Map<Productinfo,Object>转成数组
        String string1 = Arrays.toString(object1);
        System.out.println(string1);        //[2, 5, 11]
        String s = "";
        String replace = string1.replace("]", "");  //将符号 ‘ ]’替换成空
        String[] split = replace.split(",");    //按照逗号切割
        for (int i = 0; i < split.length; i++) {
            s = split[i];
        }
        String trim = s.trim();     //去除首位空格
        Integer prodinfoId = Integer.parseInt(trim);      //将String转成Int
        System.out.println(prodinfoId);
        Productinfo productinfo;
        productinfo = u.selectSizeId(prodinfoId);       //添加之前先根据第三级的值去查询到id
        int productinfoId = productinfo.getProductinfoId();
        h = u.AddSizeInfo(brandId, productinfoId, protypesizeName);        //执行添加方法

        return h;
    }

    @Override
    public Productinfo selectThirdId(Map<String, Object> map) {
        Integer prodinfoId = (Integer) map.get("prodinfoId");
        return u.selectThirdId(prodinfoId);
    }

    @Override
    public boolean UpdateSizeInfo(Map<String, Object> map) {
        boolean b = false;
        Integer productinfoId = (Integer) map.get("productinfoId");
        Integer protypesizeId = (Integer) map.get("protypesizeId");
        String protypesizeName = (String) map.get("protypesizeName");
        String productinfoState = (String) map.get("productinfoState");

        b = updateproSizeTab(protypesizeId, protypesizeName, productinfoId);     //修改型号表
        b = updateproInfoState(productinfoId, productinfoState);     //修改信息表状态
        return b;
    }


    @Transactional
    public boolean updateproSizeTab(Integer protypesizeId, String protypesizeName, Integer productinfoId) {
        boolean b = false;
        b = u.updateproSizeTab(protypesizeId, protypesizeName, productinfoId);
        return b;
    }

    @Transactional
    public boolean updateproInfoState(Integer productinfoId, String productinfoState) {
        boolean b = false;
        b = u.updateproInfoState(productinfoId, productinfoState);
        return b;
    }


    @Override
    public List<Role> selectRoleKind() {
        return u.selectRoleKind();
    }


    @Override
    public List<Role> selectAllRole() {
        return u.selectAllRole();
    }


    @Override
    public List<Role> selectRoleLike(@RequestBody Map<String, Object> map) {
        String roleName = (String) map.get("roleName");
        String roleKind = (String) map.get("roleKind");
        List<Role> list = u.selectRoleLike(roleName, roleKind);
        return list;
    }

    @Override
    public boolean selectRoleAdd(@RequestBody Map<String, Object> map) {
        boolean b = false;
        String roleName = (String) map.get("roleName");
        List<Role> role = u.selectAllRole();
        for (Role rr : role) {
            if (roleName.equals(rr.getRoleName())) {
                b = true;
            }
        }

        return b;
    }

    @Override
    public boolean AddRole(Map<String, Object> map) {
        boolean b = false;
        String roleName = (String) map.get("roleName");
        String roleKind = (String) map.get("roleKind");
        b = u.AddRole(roleName, roleKind);
        return b;
    }



    @Override
    public List<Manufacture> selectManAll() {
        return u.selectManAll();
    }



    @Override
    public List<Province> selectProvince() {
        return u.selectProvince();
    }

    @Override
    public List<Province> selectCity( Map<String, Object> map) {
        String provincePro = (String) map.get("provincePro");
        return u.selectCity(provincePro);
    }

    @Override
    public List<Province> selectArea(Map<String, Object> map) {
        String provinceCity = (String) map.get("provinceCity");
        return u.selectArea(provinceCity);
    }


}
