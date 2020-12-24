package com.wulin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class EquipmentAccount {
    private Integer equipmentId;
    private String equipmentName;
    private String equipmentState;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date purchaseDate;
    private String manufacturer;
    private String remark;


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

    public String getEquipmentState() {
        return equipmentState;
    }

    public void setEquipmentState(String equipmentState) {
        this.equipmentState = equipmentState;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark){
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "EquipmentAccount{" +
                "equipmentId=" + equipmentId +
                ", equipmentName='" + equipmentName + '\'' +
                ", equipmentState='" + equipmentState + '\'' +
                ", purchaseDate=" + purchaseDate +
                ", manufacturer='" + manufacturer + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
