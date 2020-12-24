package com.wulin.dao;

import com.wulin.bean.Department;

import java.util.List;

public interface DepartmentMapper {
    List<Department> findAllDepartment();

    void insertDepartment(Department department);

    void deleteDepartment(Integer deptId);

    void updateDepartment(Department department);
}
