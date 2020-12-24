package com.wulin.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.EquipmentFault;
import com.wulin.service.EquipmentFaultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EquipmentFaultController {

    @Autowired
    private EquipmentFaultService equipmentFaultService;

    @RequestMapping("/equipmentFault")
    public String equipmentFault(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addEqFault")
    public String addEqFault(EquipmentFault equipmentFault, Model model){
        equipmentFaultService.addEqFault(equipmentFault);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<EquipmentFault> equipmentFaults = equipmentFaultService.findAllEquipmentFault();
        PageInfo pageInfo = new PageInfo(equipmentFaults,5);
        model.addAttribute("pageInfo",pageInfo);
        return "equipment_fault";
    }
}
