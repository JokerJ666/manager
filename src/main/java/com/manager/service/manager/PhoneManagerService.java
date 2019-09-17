package com.manager.service.manager;

import com.manager.pojo.PhoneManager;


import java.util.Date;
import java.util.List;

public interface PhoneManagerService {
    List<PhoneManager> queryAll();

    List<PhoneManager> queryAllResultMap();

    List<PhoneManager> queryAllByCompanyId(Integer companyId);

    PhoneManager queryById(Integer id);

    void deleteById(Integer id);

    void updateUserSelective(PhoneManager phoneManager);

    void updateUserPermission(Integer id, String userPermission);

    void saveUser(PhoneManager phoneManager) throws Exception;

    void updateUserState(Integer id, String state);

    void updateUser(PhoneManager user) throws Exception;

    boolean existUserByUserKey(String userKey);

    PhoneManager queryByUserKey(String userKey);

    void updateUserLastLoginTime(String userKey, String lastLoginTime, String state);

    boolean isFreeze(String userKey);
}
