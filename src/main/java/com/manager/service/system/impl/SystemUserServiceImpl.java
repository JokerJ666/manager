package com.manager.service.system.impl;

import com.manager.mapper.system.SystemUserMapper;
import com.manager.pojo.SystemUser;
import com.manager.service.system.SystemUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service(value = "systemUserService")
public class SystemUserServiceImpl implements SystemUserService {

    @Autowired
    private SystemUserMapper systemUserMapper;

    public boolean existUserByUsername(String username) {
        return systemUserMapper.existUserByUsername(username)==1;
    }

    public void save(SystemUser user) {
        systemUserMapper.save(user);
    }

    public boolean existByUser(SystemUser systemUser) {
        return systemUserMapper.existByUser(systemUser)==1;
    }


    public SystemUser findSystemUser(SystemUser systemUser) {
        return systemUserMapper.findSystemUser(systemUser);
    }
}
