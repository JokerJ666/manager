package com.manager.service.timer.Impl;

import com.manager.mapper.log.LoginWithPhoneLogMapper;
import com.manager.mapper.manager.PhoneManagerMapper;
import com.manager.pojo.LoginWithPhoneLog;
import com.manager.service.timer.PhoneManagerTimerService;
import com.manager.sign.CommonSign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
@EnableScheduling
public class PhoneManagerTimerServiceImpl implements PhoneManagerTimerService {

    @Autowired
    private PhoneManagerMapper phoneManagerMapper;
    @Autowired
    private LoginWithPhoneLogMapper LoginWithPhoneLogMapper;

    @Scheduled(cron =  "0 0/10 * * * ?")
    public void chanceAllUserStateTimer() {
        //每十分钟检查一次
        List<Map<String,Object>> users = phoneManagerMapper.queryAllLoginUsers();
        for(Map<String,Object> entry:users){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("hh:mm");
            try {
                long nowTime =  simpleDateFormat.parse(simpleDateFormat.format(new Date())).getTime();
                long lastLoginTime = simpleDateFormat.parse(entry.get("lastLoginTime").toString()).getTime();
                if((nowTime-lastLoginTime)/(1000*60)>20){
                    phoneManagerMapper.updateUserState((Integer) entry.get("id"), CommonSign.UserState.LOGOUT.index);
                    LoginWithPhoneLog phoneLog = new LoginWithPhoneLog(new Date(),CommonSign.LoginType.LOGOUT.index,"","","","");
                    phoneLog.setUserId((Integer) entry.get("id"));
                    LoginWithPhoneLogMapper.addLog(phoneLog);
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
    }
}
