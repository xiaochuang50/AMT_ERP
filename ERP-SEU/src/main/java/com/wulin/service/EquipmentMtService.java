package com.wulin.service;

import com.wulin.bean.EquipmentMt;

import java.util.List;

public interface EquipmentMtService {
    List<EquipmentMt> findAllEquipmentMt();

    void addEqMt(EquipmentMt equipmentMt);
}
