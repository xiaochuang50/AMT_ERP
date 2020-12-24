package com.wulin.service;

import com.wulin.bean.EquipmentFault;

import java.util.List;

public interface EquipmentFaultService {
    List<EquipmentFault> findAllEquipmentFault();

    void addEqFault(EquipmentFault equipmentFault);

}
