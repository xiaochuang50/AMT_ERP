package com.wulin.service.impl;

import com.wulin.bean.Employee;
import com.wulin.dao.EmployeeMapper;
import com.wulin.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    @Override
    public List<Employee> findAllEmployee() {
        return employeeMapper.findAllEmployee();
    }

    @Override
    public void addEmployee(Employee employee) {
        employeeMapper.insertEmployee(employee);
    }

    @Override
    public void updateEmployee(Employee employee) {
        employeeMapper.updateEmployee(employee);
    }

    @Override
    public void deleteEmployee(Integer employeeId) {
        employeeMapper.deleteEmployee(employeeId);
    }
}
