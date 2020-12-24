package com.wulin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class MaterialEnter {
    private String materialId;
    private String materialName;
    private Integer enterNum;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date enterDate;
    private String supplier;

    public String getMaterialId() {
        return materialId;
    }

    public void setMaterialId(String materialId) {
        this.materialId = materialId;
    }

    public Integer getEnterNum() {
        return enterNum;
    }

    public void setEnterNum(Integer enterNum) {
        this.enterNum = enterNum;
    }

    public Date getEnterDate() {
        return enterDate;
    }

    public void setEnterDate(Date enterDate) {
        this.enterDate = enterDate;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    @Override
    public String toString() {
        return "MaterialEnter{" +
                "materialId=" + materialId +
                ", materialName='" + materialName + '\'' +
                ", enterNum=" + enterNum +
                ", enterDate=" + enterDate +
                ", supplier='" + supplier + '\'' +
                '}';
    }
}
