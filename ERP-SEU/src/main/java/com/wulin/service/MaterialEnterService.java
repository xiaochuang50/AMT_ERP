package com.wulin.service;


import com.wulin.bean.MaterialEnter;

import java.util.List;

public interface MaterialEnterService {

    List<MaterialEnter> findAllMaterialEnter();

    void addMaterialEnter(MaterialEnter materialEnter);
}
