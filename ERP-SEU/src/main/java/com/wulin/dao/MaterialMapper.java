package com.wulin.dao;

import com.wulin.bean.Material;

import java.util.List;

public interface MaterialMapper {
    List<Material> findAllMaterial();

    Material findMaterialById(String materialId);

    void updateById(Material material);
}
