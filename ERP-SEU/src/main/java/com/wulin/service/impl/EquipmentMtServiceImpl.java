package com.wulin.service.impl;

import com.wulin.bean.EquipmentMt;
import com.wulin.dao.EquipmentMtMapper;
import com.wulin.service.EquipmentMtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EquipmentMtServiceImpl implements EquipmentMtService {

    @Autowired
    private EquipmentMtMapper equipmentMtMapper;

    @Override
    public List<EquipmentMt> findAllEquipmentMt() {
        return equipmentMtMapper.findAllEquipmentMt();
    }

    @Override
    public void addEqMt(EquipmentMt equipmentMt) {
        equipmentMtMapper.addEqMt(equipmentMt);
    }
}
