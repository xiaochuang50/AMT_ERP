package com.wulin.service;

import com.wulin.bean.EquipmentInspect;

import java.util.List;

public interface EquipmentInspectService {
    public List<EquipmentInspect> findAllequipmentInspect();

    void addEqInspect(EquipmentInspect equipmentInspect);
}
