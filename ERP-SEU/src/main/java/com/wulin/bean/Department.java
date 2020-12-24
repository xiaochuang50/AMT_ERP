package com.wulin.bean;

public class Department {
    private int deptId;
    private String deptName;
    private String deptDuty;

    public int getDeptId() {
        return deptId;
    }

    public void setDeptId(int deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptDuty() {
        return deptDuty;
    }

    public void setDeptDuty(String deptDuty) {
        this.deptDuty = deptDuty;
    }

    @Override
    public String toString() {
        return "Department{" +
                "deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                ", deptDuty='" + deptDuty + '\'' +
                '}';
    }
}
