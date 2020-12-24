package com.wulin.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wulin.bean.Client;
import com.wulin.bean.Department;
import com.wulin.bean.Employee;
import com.wulin.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/employee")
    public String employeeManagement(@RequestParam(value = "pn",defaultValue = "1") Integer pn, Model model){
        return showPages(pn,model);
    }

    @RequestMapping("/addEmployee")
    public String addDepartment(Employee employee, Model model){
        employeeService.addEmployee(employee);
        return showPages(1,model);
    }

    @RequestMapping("/updateEmployee")
    public String updateEmployee(Employee employee, Model model){
        employeeService.updateEmployee(employee);
        return showPages(1,model);
    }

    @RequestMapping("/deleteEmployee")
    public String updateEmployee(Integer employeeId,Model model){
        employeeService.deleteEmployee(employeeId);
        return showPages(1,model);
    }

    public String showPages(Integer pn,Model model){
        PageHelper.startPage(pn, 10);
        List<Employee> employees = employeeService.findAllEmployee();
        PageInfo pageInfo = new PageInfo(employees,5);
        model.addAttribute("pageInfo",pageInfo);
        return "employee_management";
    }
}
