package com.wulin.dao;

import com.wulin.bean.EquipmentInspect;

import java.util.List;

public interface EquipmentInspectMapper {
    List<EquipmentInspect> findAllEquipmentInspect();

    void addEqInspect(EquipmentInspect equipmentInspect);
}
