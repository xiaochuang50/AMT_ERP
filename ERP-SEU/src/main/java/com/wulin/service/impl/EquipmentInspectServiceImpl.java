package com.wulin.service.impl;

import com.wulin.bean.EquipmentInspect;
import com.wulin.dao.EquipmentInspectMapper;
import com.wulin.service.EquipmentInspectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentInspectServiceImpl implements EquipmentInspectService {

    @Autowired
    private EquipmentInspectMapper equipmentInspectMapper;

    @Override
    public List<EquipmentInspect> findAllequipmentInspect() {
        return equipmentInspectMapper.findAllEquipmentInspect();
    }

    @Override
    public void addEqInspect(EquipmentInspect equipmentInspect) {
        equipmentInspectMapper.addEqInspect(equipmentInspect);
    }
}
