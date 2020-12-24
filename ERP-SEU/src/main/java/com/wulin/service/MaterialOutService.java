package com.wulin.service;

import com.wulin.bean.MaterialOut;

import java.util.List;

public interface MaterialOutService {
    List<MaterialOut> findAllMaterialOut();

    void addMaterialOut(MaterialOut materialOut);
}
