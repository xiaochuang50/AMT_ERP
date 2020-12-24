package com.wulin.service;

import com.wulin.bean.SystemUser;

public interface SystemUserService {
    boolean isSystemUser(SystemUser systemUser);

    boolean isAdminUser(SystemUser systemUser);

}
