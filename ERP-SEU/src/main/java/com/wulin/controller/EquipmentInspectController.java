package com.wulin.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.jmx.snmp.SnmpUnknownModelLcdException;
import com.wulin.bean.EquipmentInspect;
import com.wulin.service.EquipmentInspectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EquipmentInspectController {

    @Autowired
    private EquipmentInspectService equipmentInspectService;

    @RequestMapping("/equipmentInspect")
    public String equipmentInspect(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addEqInspect")
    public String addEqInspect(EquipmentInspect equipmentInspect, Model model){
        equipmentInspectService.addEqInspect(equipmentInspect);
        return showPages(1, model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<EquipmentInspect> equipmentInspects = equipmentInspectService.findAllequipmentInspect();
        PageInfo pageInfo = new PageInfo(equipmentInspects,5);
        model.addAttribute("pageInfo",pageInfo);
        return "equipment_inspect";
    }

}
