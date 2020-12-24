package com.wulin.service.impl;

import com.wulin.bean.Material;
import com.wulin.bean.MaterialEnter;
import com.wulin.dao.MaterialEnterMapper;
import com.wulin.dao.MaterialMapper;
import com.wulin.service.MaterialEnterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialEnterServiceImpl implements MaterialEnterService {

    @Autowired
    private MaterialEnterMapper materialEnterMapper;

    @Autowired
    private MaterialMapper materialMapper;

    @Override
    public List<MaterialEnter> findAllMaterialEnter() {
        return materialEnterMapper.findAllMaterialEnter();
    }

    @Override
    public void addMaterialEnter(MaterialEnter materialEnter) {
        materialEnterMapper.addMaterialEnter(materialEnter);
        Material material = materialMapper.findMaterialById(materialEnter.getMaterialId());
        material.setMaterialNum(material.getMaterialNum() + materialEnter.getEnterNum());
        materialMapper.updateById(material);
    }
}
