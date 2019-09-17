package com.manager.controller;


import com.manager.pojo.Company;
import com.manager.pojo.LoginWithPhoneLog;
import com.manager.service.log.LoginWithPhoneLogService;
import com.manager.service.manager.CompanyService;
import com.manager.service.manager.PhoneAdminService;
import com.manager.service.manager.PhoneManagerService;
import com.manager.sign.CommonSign;
import com.manager.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


@Controller
@RequestMapping(value = "/auth")
public class AuthController {

    @Autowired
    private PhoneManagerService phoneManagerService;
    @Autowired
    private LoginWithPhoneLogService loginWithPhoneLogService;
    @Autowired
    private PhoneAdminService phoneAdminService;
    @Autowired
    private CompanyService companyService;


    @ResponseBody
    @RequestMapping(value = "/IMEI",method = RequestMethod.POST)
    public Msg AuthIMEI(HttpServletRequest request){
        String userKey = request.getParameter("IMEI");
        if(phoneManagerService.existUserByUserKey(userKey)){
            return Msg.success();
        }
        return Msg.error();
    }

    private Boolean JudgePhoneUserToLogin(String userKey){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
        String nowHourAndM = simpleDateFormat.format(new Date());
        Company company = companyService.queryByUserKey(userKey);

        //判断是否在工作日
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        Integer day = calendar.get(Calendar.DAY_OF_WEEK)-1;
        if(company.getWorkday().indexOf(day.toString()) == -1)
            return false;

        //判断是否在工作时间
        try {
            long nowTime = simpleDateFormat.parse(nowHourAndM).getTime();
            String[] beginTimeList = company.getBeginTime().split(",");
            String[] endTimeList = company.getEndTime().split(",");
            for(int i=0;i<beginTimeList.length;i++){
                long beginTime = simpleDateFormat.parse(beginTimeList[i]).getTime();
                long endTime = simpleDateFormat.parse(endTimeList[i]).getTime();
                if( beginTime<nowTime && nowTime<endTime) {
                    return true;
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return false;
    }


    @ResponseBody
    @RequestMapping(value = "/user",method = RequestMethod.POST)
    public Msg AuthUser(HttpServletRequest request){
        String userKey = request.getParameter("IMEI");
        if(!phoneManagerService.existUserByUserKey(userKey))
            return Msg.error();

        String username = request.getParameter("USERNAME");
        String phone = request.getParameter("PHONE");
        String uName = request.getParameter("USERID");
        String belong = request.getParameter("COMPANY");
        String right = request.getParameter("RIGHT");


        if(CommonSign.UserCharacter.ADMIN.code.equals(right) || phoneAdminService.isAdminUser(username)){
            //管理员用户
            LoginWithPhoneLog phoneLog = new LoginWithPhoneLog(new Date(),CommonSign.LoginType.LOGIN.index,username,uName,phone,belong);
            loginWithPhoneLogService.addLog(phoneLog,userKey);
            return Msg.success();
        }

        if(phoneManagerService.isFreeze(userKey)){
            return Msg.error();
        }

        //员工用户
        if(JudgePhoneUserToLogin(userKey)){
            LoginWithPhoneLog phoneLog = new LoginWithPhoneLog(new Date(), CommonSign.LoginType.LOGIN.index, username,uName, phone, belong);
            loginWithPhoneLogService.addLog(phoneLog, userKey);
            return Msg.success();
        }
        return Msg.error();
    }

    @ResponseBody
    @RequestMapping(value = "/logining",method = RequestMethod.POST)
    public Msg AuthLogining(HttpServletRequest request){
        String userKey = request.getParameter("IMEI");
        String username = request.getParameter("USERNAME");
        String phone = request.getParameter("PHONE");
        String uName = request.getParameter("USERID");
        String belong = request.getParameter("COMPANY");
        String right = request.getParameter("RIGHT");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
        String nowHourAndM = simpleDateFormat.format(new Date());


        phoneManagerService.updateUserLastLoginTime(userKey, nowHourAndM,CommonSign.UserState.LOGOUT.index);
        LoginWithPhoneLog phoneLog = new LoginWithPhoneLog(new Date(),CommonSign.LoginType.LOGOUT.index,username,uName,phone,belong);

        if(CommonSign.UserCharacter.ADMIN.code.equals(right) || phoneAdminService.isAdminUser(username)){
            //管理员用户
            phoneManagerService.updateUserLastLoginTime(userKey, nowHourAndM,CommonSign.UserState.LOGIN.index);
            return Msg.success();
        }
        if(phoneManagerService.isFreeze(userKey)){
            loginWithPhoneLogService.addLog(phoneLog,userKey);
            phoneManagerService.updateUserLastLoginTime(userKey, nowHourAndM,CommonSign.UserState.LOGOUT.index);
            return Msg.error();
        }

        if(JudgePhoneUserToLogin(userKey)){
            phoneManagerService.updateUserLastLoginTime(userKey, nowHourAndM,CommonSign.UserState.LOGIN.index);
            return Msg.success();
        }
        loginWithPhoneLogService.addLog(phoneLog,userKey);
        return Msg.error();
    }

    @ResponseBody
    @RequestMapping(value = "/logout",method = RequestMethod.POST)
    public Msg AuthLogout(HttpServletRequest request){
        String userKey = request.getParameter("IMEI");

        String username = request.getParameter("USERNAME");
        String phone = request.getParameter("PHONE");
        String uName = request.getParameter("USERID");
        String belong = request.getParameter("COMPANY");

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
        String nowHourAndM = simpleDateFormat.format(new Date());

        LoginWithPhoneLog phoneLog = new LoginWithPhoneLog(new Date(),CommonSign.LoginType.LOGOUT.index,username,uName,phone,belong);
        loginWithPhoneLogService.addLog(phoneLog,userKey);
        phoneManagerService.updateUserLastLoginTime(request.getParameter("IMEI"), nowHourAndM,CommonSign.UserState.LOGOUT.index);
        return Msg.success();
    }


}
