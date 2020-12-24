package com.wulin.dao;

import com.wulin.bean.EquipmentMt;

import java.util.List;

public interface EquipmentMtMapper {

    List<EquipmentMt> findAllEquipmentMt();

    void addEqMt(EquipmentMt equipmentMt);
}
