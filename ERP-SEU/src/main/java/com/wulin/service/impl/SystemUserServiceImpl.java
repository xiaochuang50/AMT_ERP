package com.wulin.service.impl;

import com.wulin.bean.SystemUser;
import com.wulin.dao.SystemUserMapper;
import com.wulin.service.SystemUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("systemUserService")
public class SystemUserServiceImpl implements SystemUserService {

    @Autowired
    SystemUserMapper systemUserMapper;

    @Override
    public boolean isSystemUser(SystemUser systemUser) {
        SystemUser systemUserByName = systemUserMapper.findSystemUserByName(systemUser.getUsername());
        if (systemUserByName == null){
            return false;
        }
        if (systemUser.getPassword().equals(systemUserByName.getPassword())){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean isAdminUser(SystemUser systemUser) {
        return systemUserMapper.findIsAdminByUserName(systemUser.getUsername());
    }
}
