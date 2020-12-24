package com.wulin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Order {
    private Integer orderId;
    private String clientName;
    private String product;
    private String productId;
    private Integer orderNum;
    private double price;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date orderDate;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", clientName='" + clientName + '\'' +
                ", product='" + productId + '\'' +
                ", orderNum=" + orderNum +
                ", price=" + price +
                ", orderDate=" + orderDate +
                '}';
    }
}
