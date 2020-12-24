package com.wulin.dao;

import com.wulin.bean.Order;

import java.util.List;

public interface OrderMapper {
    List<Order> findAllOrder();

    void addOrder(Order order);

    void deleteOrderById(Integer orderId);

    void updateOrder(Order order);
}
