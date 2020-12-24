package com.wulin.bean;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Schedule {

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date productDate;
    private String product;
    private String productId;
    private Integer productNum;
    private String remark;

    public Date getProductDate() {
        return productDate;
    }

    public void setProductDate(Date productDate) {
        this.productDate = productDate;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "productDate=" + productDate +
                ", product='" + product + '\'' +
                ", productId='" + productId + '\'' +
                ", productNum=" + productNum +
                ", remark='" + remark + '\'' +
                '}';
    }
}
