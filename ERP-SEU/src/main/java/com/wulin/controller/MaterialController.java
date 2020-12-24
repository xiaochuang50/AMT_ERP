package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.Client;
import com.wulin.bean.Material;
import com.wulin.service.ClientService;
import com.wulin.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MaterialController {

    @Autowired
    private MaterialService materialService;

    @RequestMapping("/material")
    public String materialManagement(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        PageHelper.startPage(pn, 10);
        List<Material> materials = materialService.findAllMaterial();
        PageInfo pageInfo = new PageInfo(materials,5);
        model.addAttribute("pageInfo",pageInfo);
        return "material_inventory";
    }
}
