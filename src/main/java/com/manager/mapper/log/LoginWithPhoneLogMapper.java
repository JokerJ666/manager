package com.manager.mapper.log;

import com.manager.pojo.LoginWithPhoneLog;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface LoginWithPhoneLogMapper {

    List<LoginWithPhoneLog> queryUserLoginLog(@Param("userId") Integer userId);

    void addLog(LoginWithPhoneLog phoneLog);
}
