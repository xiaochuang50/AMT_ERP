package com.wulin.service;

import com.wulin.bean.Order;

import java.util.List;

public interface OrderService {

    List<Order> findAllOrder();

    void addOrder(Order order);

    void deleteOrder(Integer orderId);

    void updateOrder(Order order);
}
