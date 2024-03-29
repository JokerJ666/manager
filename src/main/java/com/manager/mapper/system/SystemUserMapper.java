package com.manager.mapper.system;

import com.manager.pojo.SystemUser;
import org.apache.ibatis.annotations.Param;

public interface SystemUserMapper {
    Integer existUserByUsername(@Param("username") String username);

    void save(@Param("user")SystemUser user);

    Integer existByUser(SystemUser systemUser);
}
