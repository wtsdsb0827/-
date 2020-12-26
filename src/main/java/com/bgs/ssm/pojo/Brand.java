package com.bgs.ssm.pojo;

public class Brand {

    private Integer brandId;
    private String brandName;
    private String brandState;


    /*接口类*/
    private Integer portId;
    private String portName;
    private String portState;


    /*产品类*/
    private int productinfoId;
    private String productinfoType;        //产品类型（品类）
    private String productinfoSecond;      //二级产品品类
    private String productinfoGroup;      //商品组
    private String productinfoState;      //产品状态
    private String protypesizeName;      //产品型号


    private int protypesizeId;


    private int prodinfoId;     //产品型号外键


    public int getProtypesizeId() {
        return protypesizeId;
    }

    public void setProtypesizeId(int protypesizeId) {
        this.protypesizeId = protypesizeId;
    }

    public int getProdinfoId() {
        return prodinfoId;
    }

    public void setProdinfoId(int prodinfoId) {
        this.prodinfoId = prodinfoId;
    }

    public int getProductinfoId() {
        return productinfoId;
    }

    public void setProductinfoId(int productinfoId) {
        this.productinfoId = productinfoId;
    }

    public String getProductinfoType() {
        return productinfoType;
    }

    public void setProductinfoType(String productinfoType) {
        this.productinfoType = productinfoType;
    }

    public String getProductinfoSecond() {
        return productinfoSecond;
    }

    public void setProductinfoSecond(String productinfoSecond) {
        this.productinfoSecond = productinfoSecond;
    }

    public String getProductinfoGroup() {
        return productinfoGroup;
    }

    public void setProductinfoGroup(String productinfoGroup) {
        this.productinfoGroup = productinfoGroup;
    }

    public String getProductinfoState() {
        return productinfoState;
    }

    public void setProductinfoState(String productinfoState) {
        this.productinfoState = productinfoState;
    }

    public String getProtypesizeName() {
        return protypesizeName;
    }

    public void setProtypesizeName(String protypesizeName) {
        this.protypesizeName = protypesizeName;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandState() {
        return brandState;
    }

    public void setBrandState(String brandState) {
        this.brandState = brandState;
    }


    public Integer getPortId() {
        return portId;
    }

    public void setPortId(Integer portId) {
        this.portId = portId;
    }

    public String getPortName() {
        return portName;
    }

    public void setPortName(String portName) {
        this.portName = portName;
    }

    public String getPortState() {
        return portState;
    }

    public void setPortState(String portState) {
        this.portState = portState;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "brandId=" + brandId +
                ", brandName='" + brandName + '\'' +
                ", brandState='" + brandState + '\'' +
                ", portId=" + portId +
                ", portName='" + portName + '\'' +
                ", portState='" + portState + '\'' +
                ", productinfoId=" + productinfoId +
                ", productinfoType='" + productinfoType + '\'' +
                ", productinfoSecond='" + productinfoSecond + '\'' +
                ", productinfoGroup='" + productinfoGroup + '\'' +
                ", productinfoState='" + productinfoState + '\'' +
                ", protypesizeName='" + protypesizeName + '\'' +
                '}';
    }
}
