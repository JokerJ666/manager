package com.manager.service.manager.impl;

import com.manager.mapper.manager.PhoneAdminMapper;
import com.manager.pojo.PhoneAdmin;
import com.manager.service.manager.PhoneAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("phoneAdminService")
public class PhoneAdminServiceImpl implements PhoneAdminService {

    @Autowired
    private PhoneAdminMapper phoneAdminMapper;


    public boolean isAdminUser(String username) {
        return phoneAdminMapper.existByUsername(username)>0;
    }

    public void saveUser(PhoneAdmin phoneAdmin) throws Exception {
        phoneAdminMapper.saveUser(phoneAdmin);
    }

    public List<PhoneAdmin> listUserByCompanyId(Integer companyId) {
        return phoneAdminMapper.listUserByCompanyId(companyId);
    }
}
