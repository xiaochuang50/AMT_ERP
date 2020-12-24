package com.wulin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class MaterialOut {
    private String materialId;
    private String materialName;
    private Integer outNum;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date outDate;
    private String remark;

    public String getMaterialId() {
        return materialId;
    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId;
    }

    public Integer getOutNum() {
        return outNum;
    }

    public void setOutNum(Integer outNum) {
        this.outNum = outNum;
    }

    public Date getOutDate() {
        return outDate;
    }

    public void setOutDate(Date outDate) {
        this.outDate = outDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    @Override
    public String toString() {
        return "MaterialOut{" +
                "materialId=" + materialId +
                ", materialName='" + materialName + '\'' +
                ", outNum=" + outNum +
                ", outDate=" + outDate +
                ", remark='" + remark + '\'' +
                '}';
    }
}
