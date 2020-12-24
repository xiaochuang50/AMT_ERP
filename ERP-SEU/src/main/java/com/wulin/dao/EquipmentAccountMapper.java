package com.wulin.dao;

import com.wulin.bean.EquipmentAccount;

import java.util.List;

public interface EquipmentAccountMapper {
    List<EquipmentAccount> findAllEquipmentAccount();

    void addEqAccount(EquipmentAccount equipmentAccount);

    void updateEqAccount(EquipmentAccount equipmentAccount);

    void deleteEqAccountById(Integer equipmentId);
}
