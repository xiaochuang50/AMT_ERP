package com.wulin.service.impl;

import com.wulin.bean.Department;
import com.wulin.dao.DepartmentMapper;
import com.wulin.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> findAllDepartment() {
        return departmentMapper.findAllDepartment();
    }

    @Override
    public void addDepartment(Department department) {
        departmentMapper.insertDepartment(department);
    }

    @Override
    public void deleteDepartment(Integer deptId) {
        departmentMapper.deleteDepartment(deptId);
    }

    @Override
    public void updateDepartment(Department department) {
        departmentMapper.updateDepartment(department);
    }
}
