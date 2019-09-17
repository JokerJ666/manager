package com.manager.service.system;

import com.manager.pojo.SystemUser;

public interface SystemUserService {
    boolean existUserByUsername(String username);

    void save(SystemUser user);

    boolean existByUser(SystemUser systemUser);
}
