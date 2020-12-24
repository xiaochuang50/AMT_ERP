package com.wulin.bean;

public class EquipmentMt {
    private Integer equipmentId;
    private String equipmentName;
    private String mtWay;
    private String mtResult;
    private double cost;

    public Integer getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Integer equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getEquipmentName() {
        return equipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        this.equipmentName = equipmentName;
    }

    public String getMtWay() {
        return mtWay;
    }

    public void setMtWay(String mtWay) {
        this.mtWay = mtWay;
    }

    public String getMtResult() {
        return mtResult;
    }

    public void setMtResult(String mtResult) {
        this.mtResult = mtResult;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "EquipmentMt{" +
                "equipmentId=" + equipmentId +
                ", equipmentName='" + equipmentName + '\'' +
                ", mtWay='" + mtWay + '\'' +
                ", mtResult='" + mtResult + '\'' +
                ", cost=" + cost +
                '}';
    }
}
