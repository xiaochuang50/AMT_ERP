package com.wulin.dao;

import com.wulin.bean.SystemUser;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SystemUserMapper {
    SystemUser findSystemUserByName(String name);

    boolean findIsAdminByUserName(String username);
}
