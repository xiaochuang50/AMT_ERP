package com.wulin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class EquipmentInspect {
    private Integer equipmentId;
    private String equipmentName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inspectDate;
    private String result;
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

    public Date getInspectDate() {
        return inspectDate;
    }

    public void setInspectDate(Date inspectDate) {
        this.inspectDate = inspectDate;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "EquipmentInspect{" +
                "equipmentId=" + equipmentId +
                ", equipmentName='" + equipmentName + '\'' +
                ", inspectDate=" + inspectDate +
                ", result='" + result + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
