package com.wulin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class EquipmentFault {
    private Integer equipmentId;
    private String equipmentName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date faultDate;
    private String faultReason;
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

    public Date getFaultDate() {
        return faultDate;
    }

    public void setFaultDate(Date faultDate) {
        this.faultDate = faultDate;
    }

    public String getFaultReason() {
        return faultReason;
    }

    public void setFaultReason(String faultReason) {
        this.faultReason = faultReason;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "EquipmentFault{" +
                "equipmentId=" + equipmentId +
                ", equipmentName='" + equipmentName + '\'' +
                ", faultDate=" + faultDate +
                ", faultReason='" + faultReason + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
