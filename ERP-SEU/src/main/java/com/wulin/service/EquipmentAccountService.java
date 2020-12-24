package com.wulin.service;

import com.wulin.bean.EquipmentAccount;

import java.util.List;

public interface EquipmentAccountService {
    List<EquipmentAccount> findAllEquipment();

    void addEqAccount(EquipmentAccount equipmentAccount);

    void updateEqAccount(EquipmentAccount equipmentAccount);

    void deleteEqAccount(Integer equipmentId);
}
