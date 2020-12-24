package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.Client;
import com.wulin.bean.EquipmentAccount;
import com.wulin.bean.Order;
import com.wulin.service.EquipmentAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.WebParam;
import java.util.List;

@Controller
public class EquipmentAccountController {

    @Autowired
    private EquipmentAccountService equipmentAccountService;

    @RequestMapping("equipmentAccount")
    public String equipmentAccount(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addEqAccount")
    public String addEqAccount(EquipmentAccount equipmentAccount, Model model){
        equipmentAccountService.addEqAccount(equipmentAccount);
        return showPages(1,model);
    }

    @RequestMapping("/updateEqAccount")
    public String updateEqAccount(EquipmentAccount equipmentAccount, Model model){
        equipmentAccountService.updateEqAccount(equipmentAccount);
        return showPages(1,model);
    }

    @RequestMapping("/deleteEqAccount")
    public String deleteEqAccount(Integer equipmentId, Model model){
        equipmentAccountService.deleteEqAccount(equipmentId);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<EquipmentAccount> equipmentAccounts = equipmentAccountService.findAllEquipment();
        PageInfo pageInfo = new PageInfo(equipmentAccounts,5);
        model.addAttribute("pageInfo",pageInfo);
        return "equipment_account";
    }

}
