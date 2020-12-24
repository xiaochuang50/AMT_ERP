package com.wulin.service;

import com.wulin.bean.Client;
import com.wulin.bean.Department;

import java.util.List;

public interface DepartmentService {
    List<Department> findAllDepartment();

    void addDepartment(Department department);

    void deleteDepartment(Integer deptId);

    void updateDepartment(Department department);
}
