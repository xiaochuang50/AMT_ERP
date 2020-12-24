package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.Client;
import com.wulin.bean.Department;
import com.wulin.bean.Employee;
import com.wulin.bean.Msg;
import com.wulin.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/department")
    public String departmentManagement(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addDepartment")
    public String addDepartment(Department department, Model model){
        departmentService.addDepartment(department);
        return showPages(1,model);

    }

    @RequestMapping("/updateDepartment")
    public String updateClient(Department department,Model model){
        departmentService.updateDepartment(department);
        return showPages(1,model);
    }

    @RequestMapping("/deleteDepartment")
    public String deleteDepartment(Integer deptId,Model model){
        departmentService.deleteDepartment(deptId);
        return showPages(1,model);
    }

    @RequestMapping("/deptsFormEcho")
    @ResponseBody
    public Msg departmentFormEcho(){
        List<Department> departments = departmentService.findAllDepartment();
        return Msg.success().add("depts",departments);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<Department> departments = departmentService.findAllDepartment();
        PageInfo pageInfo = new PageInfo(departments,5);
        model.addAttribute("pageInfo",pageInfo);
        return "department_management";
    }
}
