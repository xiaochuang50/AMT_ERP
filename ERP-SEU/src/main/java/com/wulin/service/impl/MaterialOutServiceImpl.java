package com.wulin.service.impl;

import com.wulin.bean.Material;
import com.wulin.bean.MaterialOut;
import com.wulin.dao.MaterialMapper;
import com.wulin.dao.MaterialOutMapper;
import com.wulin.service.MaterialOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialOutServiceImpl implements MaterialOutService {

    @Autowired
    MaterialOutMapper materialOutMapper;
    @Autowired
    MaterialMapper materialMapper;

    @Override
    public List<MaterialOut> findAllMaterialOut() {
        return materialOutMapper.findAllMaterialOut();
    }

    @Override
    public void addMaterialOut(MaterialOut materialOut) {
        materialOutMapper.addMaterialOut(materialOut);
        Material material = materialMapper.findMaterialById(materialOut.getMaterialId());
        material.setMaterialNum(material.getMaterialNum() - materialOut.getOutNum());
        materialMapper.updateById(material);
    }
}
