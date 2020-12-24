package com.wulin.service.impl;

import com.wulin.bean.EquipmentFault;
import com.wulin.dao.EquipmentFaultMapper;
import com.wulin.service.EquipmentFaultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentFaultServiceImpl implements EquipmentFaultService {

    @Autowired
    private EquipmentFaultMapper equipmentFaultMapper;

    @Override
    public List<EquipmentFault> findAllEquipmentFault() {
        return equipmentFaultMapper.findAllEquipmentFault();
    }

    @Override
    public void addEqFault(EquipmentFault equipmentFault) {
        equipmentFaultMapper.addEqFault(equipmentFault);
    }
}
