package com.wulin.bean;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Employee {
    private Integer employeeId;
    private String empName;
    private String gender;
    private Integer deptId;
    private String deptName;
    private String phone;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date empDate;
    private String state;

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getEmpDate() {
        return empDate;
    }

    public void setEmpDate(Date empDate) {
        this.empDate = empDate;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "employeeId=" + employeeId +
                ", empName='" + empName + '\'' +
                ", gender='" + gender + '\'' +
                ", deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                ", phone='" + phone + '\'' +
                ", empDate=" + empDate +
                ", state='" + state + '\'' +
                '}';
    }
}
