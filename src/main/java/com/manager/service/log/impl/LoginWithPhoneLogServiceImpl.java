package com.manager.service.log.impl;

import com.manager.mapper.log.LoginWithPhoneLogMapper;
import com.manager.mapper.manager.PhoneManagerMapper;
import com.manager.pojo.LoginWithPhoneLog;
import com.manager.service.log.LoginWithPhoneLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("loginWithPhoneLogService")
public class LoginWithPhoneLogServiceImpl implements LoginWithPhoneLogService {

    @Autowired
    LoginWithPhoneLogMapper loginWithPhoneLogMapper;
    @Autowired
    PhoneManagerMapper phoneManagerMapper;

    public List<LoginWithPhoneLog> queryUserLoginLog(Integer userId) {
        return loginWithPhoneLogMapper.queryUserLoginLog(userId);
    }

    public void addLog(LoginWithPhoneLog loginWithPhoneLog, String userKey) {
        loginWithPhoneLog.setUserId(phoneManagerMapper.getIdByUserKey(userKey));
        loginWithPhoneLogMapper.addLog(loginWithPhoneLog);
    }


}
