package com.wulin.dao;

import com.wulin.bean.EquipmentFault;

import java.util.List;

public interface EquipmentFaultMapper {
    List<EquipmentFault> findAllEquipmentFault();

    void addEqFault(EquipmentFault equipmentFault);
}
