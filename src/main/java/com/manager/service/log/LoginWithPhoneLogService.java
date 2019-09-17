package com.manager.service.log;

import com.manager.pojo.LoginWithPhoneLog;

import java.util.Date;
import java.util.List;

public interface LoginWithPhoneLogService {

    List<LoginWithPhoneLog> queryUserLoginLog(Integer userId);

    void addLog(LoginWithPhoneLog loginWithPhoneLog,String userKey);
}
