package com.manager.service.manager;

import com.manager.pojo.PhoneAdmin;

import java.util.List;

public interface PhoneAdminService {
    boolean isAdminUser(String username);

    void saveUser(PhoneAdmin phoneAdmin) throws Exception;

    List<PhoneAdmin> listUserByCompanyId(Integer companyId);
}
