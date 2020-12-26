package com.bgs.ssm.pojo;

/*
    接口类
 */
public class Port {


    private Integer portId;
    private String portName;
    private String portState;
    private Integer brandId;

    @Override
    public String toString() {
        return "Port{" +
                "portId=" + portId +
                ", portName='" + portName + '\'' +
                ", portState='" + portState + '\'' +
                ", brandId=" + brandId +
                '}';
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

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }
}
