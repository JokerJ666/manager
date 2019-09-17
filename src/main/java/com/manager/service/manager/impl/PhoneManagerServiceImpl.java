package com.manager.service.manager.impl;

import com.manager.mapper.manager.CompanyMapper;
import com.manager.mapper.manager.PhoneManagerMapper;
import com.manager.pojo.PhoneManager;
import com.manager.service.manager.PhoneManagerService;
import com.manager.sign.CommonSign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;



@Service(value = "phoneManagerService")
public class PhoneManagerServiceImpl implements PhoneManagerService {

    @Autowired
    private PhoneManagerMapper phoneManagerMapper;

    @Autowired
    private CompanyMapper companyMapper;

    public List<PhoneManager> queryAll() {
        //强行搜索
        List<PhoneManager> phoneManagers = phoneManagerMapper.queryAll();
        for(int i = 0;i<phoneManagers.size();i++){
            PhoneManager phoneManager = phoneManagers.get(i);
            phoneManager.setCompany(companyMapper.queryById(phoneManager.getCompanyId()));
            phoneManagers.set(i,phoneManager);
        }
        return phoneManagers;
    }

    public List<PhoneManager> queryAllResultMap(){
        //惰性查询
        return phoneManagerMapper.queryAllResultMap();
    }

    public List<PhoneManager> queryAllByCompanyId(Integer companyId) {
        return phoneManagerMapper.queryAllByCompanyId(companyId);
    }

    public void deleteById(Integer id) {
        phoneManagerMapper.deleteById(id);
    }

    public void updateUserSelective(PhoneManager phoneManager) {
        try {
            phoneManagerMapper.updateUserSelective(phoneManager);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateUserPermission(Integer id, String userPermission) {
        if(userPermission.equals(CommonSign.UserPermission.FREEZE.text))
            phoneManagerMapper.updateUserPermission(id, CommonSign.UserPermission.NORMAL.text);
        else
            phoneManagerMapper.updateUserPermission(id, CommonSign.UserPermission.FREEZE.text);
    }

    public void saveUser(PhoneManager phoneManager) throws Exception {
        phoneManagerMapper.saveUser(phoneManager);
    }

    public void updateUserState(Integer id, String state) {
        phoneManagerMapper.updateUserState(id,state);
    }

    public void updateUser(PhoneManager user) throws Exception {
        phoneManagerMapper.updateUserSelective(user);
    }

    public boolean existUserByUserKey(String userKey) {
        return phoneManagerMapper.countUserByUserKey(userKey)>0;
    }


    public PhoneManager queryByUserKey(String userKey) {
        return phoneManagerMapper.queryByUserKey(userKey);
    }




    public void updateUserLastLoginTime(String userKey, String lastLoginTime,String state) {
        phoneManagerMapper.updateUserLastLoginTime(userKey,lastLoginTime,state);
    }

    public boolean isFreeze(String userKey) {
        return "冻结".equals(phoneManagerMapper.getPermissionByUserKey(userKey));
    }


    public PhoneManager queryById(Integer id) {
        return phoneManagerMapper.queryById(id);
    }
}
