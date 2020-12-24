package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.EquipmentMt;
import com.wulin.service.EquipmentMtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EquipmentMtController {

    @Autowired
    private EquipmentMtService equipmentMtService;

    @RequestMapping("/equipmentMt")
    public String equipmentMt(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addEqMt")
    public String addEqMt(EquipmentMt equipmentMt, Model model){
        equipmentMtService.addEqMt(equipmentMt);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<EquipmentMt> equipmentMts = equipmentMtService.findAllEquipmentMt();
        PageInfo pageInfo = new PageInfo(equipmentMts,5);
        model.addAttribute("pageInfo",pageInfo);
        return "equipment_maintenance";
    }
}
