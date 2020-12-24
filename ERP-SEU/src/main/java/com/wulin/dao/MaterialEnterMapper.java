package com.wulin.dao;

import com.wulin.bean.MaterialEnter;

import java.util.List;

public interface MaterialEnterMapper {
    List<MaterialEnter> findAllMaterialEnter();

    void addMaterialEnter(MaterialEnter materialEnter);
}
