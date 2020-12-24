package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.Client;
import com.wulin.bean.Material;
import com.wulin.bean.MaterialEnter;
import com.wulin.service.MaterialEnterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
public class MaterialEnterController {

    @Autowired
    private MaterialEnterService materialEnterService;

    @RequestMapping("/materialEnter")
    public String materialEnterManagement(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addMaterialEnter")
    public String addMaterialEnter(MaterialEnter materialEnter, Model model){
        materialEnterService.addMaterialEnter(materialEnter);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<MaterialEnter> materialEnters = materialEnterService.findAllMaterialEnter();
        PageInfo pageInfo = new PageInfo(materialEnters,5);
        model.addAttribute("pageInfo",pageInfo);
        return "material_enter";
    }
}
