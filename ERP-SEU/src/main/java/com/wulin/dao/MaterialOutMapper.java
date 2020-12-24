package com.wulin.dao;

import com.wulin.bean.MaterialOut;

import java.util.List;

public interface MaterialOutMapper {

    List<MaterialOut> findAllMaterialOut();

    void addMaterialOut(MaterialOut materialOut);
}
