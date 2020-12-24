package com.wulin.service;

import com.wulin.bean.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> findAllEmployee();

    void addEmployee(Employee employee);

    void updateEmployee(Employee employee);

    void deleteEmployee(Integer employeeId);
}
