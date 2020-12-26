package com.bgs.ssm.pojo;

/*
    产品型号表
 */
public class Protypesize {


    private Integer protypesizeId;
    private String protypesizeName;
    private Integer brandId;
    private Integer prodinfoId;


    public Integer getProtypesizeId() {
        return protypesizeId;
    }

    public void setProtypesizeId(Integer protypesizeId) {
        this.protypesizeId = protypesizeId;
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

    public Integer getProdinfoId() {
        return prodinfoId;
    }

    public void setProdinfoId(Integer prodinfoId) {
        this.prodinfoId = prodinfoId;
    }
}
