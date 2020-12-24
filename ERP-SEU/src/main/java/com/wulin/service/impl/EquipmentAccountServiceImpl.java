package com.wulin.service.impl;

import com.wulin.bean.EquipmentAccount;
import com.wulin.dao.EquipmentAccountMapper;
import com.wulin.service.EquipmentAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class EquipmentAccountServiceImpl implements EquipmentAccountService {

    @Autowired
    private EquipmentAccountMapper equipmentAccountMapper;
    @Override
    public List<EquipmentAccount> findAllEquipment() {
        return equipmentAccountMapper.findAllEquipmentAccount();
    }

    @Override
    public void addEqAccount(EquipmentAccount equipmentAccount) {
        equipmentAccountMapper.addEqAccount(equipmentAccount);
    }

    @Override
    public void updateEqAccount(EquipmentAccount equipmentAccount) {
        equipmentAccountMapper.updateEqAccount(equipmentAccount);
    }

    @Override
    public void deleteEqAccount(Integer equipmentId) {
        equipmentAccountMapper.deleteEqAccountById(equipmentId);
    }
}
