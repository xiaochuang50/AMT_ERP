package com.wulin.service.impl;

import com.wulin.bean.Order;
import com.wulin.dao.OrderMapper;
import com.wulin.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> findAllOrder() {
        return orderMapper.findAllOrder();
    }

    @Override
    public void addOrder(Order order) {
        orderMapper.addOrder(order);
    }

    @Override
    public void deleteOrder(Integer orderId) {
        orderMapper.deleteOrderById(orderId);
    }

    @Override
    public void updateOrder(Order order) {
        orderMapper.updateOrder(order);
    }
}
