package com.bgs.ssm.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;

@JsonIgnoreProperties(value = {"handler"})
public class Company implements Serializable {


    private Integer companyId;
    private String companyName;
    private Integer departId;


    @Override
    public String toString() {
        return "Company{" +
                "companyId=" + companyId +
                ", companyName='" + companyName + '\'' +
                ", departId=" + departId +
                '}';
    }
}
