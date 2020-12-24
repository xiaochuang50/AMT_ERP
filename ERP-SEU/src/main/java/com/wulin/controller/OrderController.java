package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.Order;
import com.wulin.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/order")
    public String orderManagement(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addOrder")
    public String addOrder(Order order, Model model){
        orderService.addOrder(order);
        return showPages(9,model);
    }

    @RequestMapping("/deleteOrder")
    public String addOrder(Integer orderId, Model model){
        orderService.deleteOrder(orderId);
        return showPages(1,model);
    }

    @RequestMapping("/updateOrder")
    public String updateOrder(Order order, Model model){
        orderService.updateOrder(order);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<Order> orders = orderService.findAllOrder();
        PageInfo pageInfo = new PageInfo(orders,5);
        model.addAttribute("pageInfo",pageInfo);
        return "order_management";
    }
}
