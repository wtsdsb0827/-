package com.bgs.ssm.pojo;

public class Company {


    private Integer  companyId;
    private String  companyName;
    private Integer  departId;


    @Override
    public String toString() {
        return "Company{" +
                "companyId=" + companyId +
                ", companyName='" + companyName + '\'' +
                ", departId=" + departId +
                '}';
    }
}
