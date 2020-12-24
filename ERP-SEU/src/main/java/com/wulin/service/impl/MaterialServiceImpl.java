package com.wulin.service.impl;

import com.wulin.bean.Material;
import com.wulin.dao.MaterialMapper;
import com.wulin.service.MaterialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialServiceImpl implements MaterialService {

    @Autowired
    private MaterialMapper materialMapper;

    @Override
    public List<Material> findAllMaterial() {
        return materialMapper.findAllMaterial();
    }
}
