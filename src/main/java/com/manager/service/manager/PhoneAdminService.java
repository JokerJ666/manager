package com.manager.service.manager;

import com.manager.pojo.PhoneAdmin;

import java.util.List;

public interface PhoneAdminService {
    boolean isAdminUser(String username);

    boolean ifExist(String username, Integer companyId);

    void saveUser(PhoneAdmin phoneAdmin) throws Exception;

    List<PhoneAdmin> listUserByCompanyId(Integer companyId);


    void deleteById(Integer id);
}
