package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.MaterialOut;
import com.wulin.service.MaterialOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MaterialOutController {

    @Autowired
    MaterialOutService materialOutService;


    @RequestMapping("/materialOut")
    public String materialOutManagement(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn, 10);
        return showPages(pn,model);
    }

    @RequestMapping("/addMaterialOut")
    public String addMaterialOut(MaterialOut materialOut, Model model){
        materialOutService.addMaterialOut(materialOut);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<MaterialOut> materialOuts = materialOutService.findAllMaterialOut();
        PageInfo pageInfo = new PageInfo(materialOuts,5);
        model.addAttribute("pageInfo",pageInfo);
        return "material_out";
    }
}
