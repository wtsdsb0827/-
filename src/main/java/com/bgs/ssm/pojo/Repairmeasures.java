package com.bgs.ssm.pojo;

/*
    维修措施表
 */
public class Repairmeasures {
    private Integer repairId;
    private String repairDoing;
    private String repairKind;
    private String repairClass;
    private Integer prodtypeId;
    private String repairState;


    public Integer getRepairId() {
        return repairId;
    }

    public void setRepairId(Integer repairId) {
        this.repairId = repairId;
    }

    public String getRepairDoing() {
        return repairDoing;
    }

    public void setRepairDoing(String repairDoing) {
        this.repairDoing = repairDoing;
    }

    public String getRepairKind() {
        return repairKind;
    }

    public void setRepairKind(String repairKind) {
        this.repairKind = repairKind;
    }

    public String getRepairClass() {
        return repairClass;
    }

    public void setRepairClass(String repairClass) {
        this.repairClass = repairClass;
    }

    public Integer getProdtypeId() {
        return prodtypeId;
    }

    public void setProdtypeId(Integer prodtypeId) {
        this.prodtypeId = prodtypeId;
    }

    public String getRepairState() {
        return repairState;
    }

    public void setRepairState(String repairState) {
        this.repairState = repairState;
    }


    @Override
    public String toString() {
        return "Repairmeasures{" +
                "repairId=" + repairId +
                ", repairDoing='" + repairDoing + '\'' +
                ", repairKind='" + repairKind + '\'' +
                ", repairClass='" + repairClass + '\'' +
                ", prodtypeId=" + prodtypeId +
                ", repairState='" + repairState + '\'' +
                '}';
    }
}
