package com.wulin.dao;

import com.wulin.bean.Employee;

import java.util.List;

public interface EmployeeMapper {

    List<Employee> findAllEmployee();

    void insertEmployee(Employee employee);

    void updateEmployee(Employee employee);

    void deleteEmployee(Integer employeeId);
}
