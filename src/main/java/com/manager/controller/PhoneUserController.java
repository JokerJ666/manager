package com.manager.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manager.pojo.LoginWithPhoneLog;
import com.manager.pojo.PhoneManager;
import com.manager.service.log.LoginWithPhoneLogService;
import com.manager.service.manager.PhoneManagerService;
import com.manager.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;


@Controller
@RequestMapping(value = "/phoneUser")
public class PhoneUserController{

    @Autowired
    private PhoneManagerService phoneManagerService;
    @Autowired
    private LoginWithPhoneLogService loginWithPhoneLogService;

    @ResponseBody
    @RequestMapping(value = "/listAll")
    public Msg ListAll(@RequestParam(value = "page",defaultValue = "1") Integer page){
        PageHelper.startPage(page,5);
        List<PhoneManager> phoneManagers = phoneManagerService.queryAll();
        PageInfo<PhoneManager> pageInfo = new PageInfo<PhoneManager>(phoneManagers,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/forCompany",method = RequestMethod.GET)
    public Msg ListPhoneUserForCompany(@RequestParam(value = "page",defaultValue = "1") Integer page,
                                       @RequestParam("id")Integer id){
        PageHelper.startPage(page,5);
        List<PhoneManager> phoneManagers = phoneManagerService.queryAllByCompanyId(id);
        PageInfo<PhoneManager> pageInfo = new PageInfo<PhoneManager>(phoneManagers,5);
        return Msg.success().add("pageInfo",pageInfo);
    }


    @ResponseBody
    @RequestMapping(value = "/getData/id={id}",method = RequestMethod.GET)
    public Msg GetUserById(@PathVariable("id") Integer id){
        PhoneManager user = phoneManagerService.queryById(id);
        return Msg.success().add("user",user);
    }


    @ResponseBody
    @RequestMapping(value = "/permissionChance")
    public Msg ChancePermission(@RequestParam(value = "id") Integer id,
                                @RequestParam(value = "userPermission") String userPermission) {

        phoneManagerService.updateUserPermission(id,userPermission);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/stateChance")
    public Msg ChanceState(@RequestParam(value = "id") Integer id,
                                @RequestParam(value = "state") String state) {

        phoneManagerService.updateUserState(id,state);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/userChance")
    public Msg ChanceUser(PhoneManager user) {
        System.out.println(user);
        try {
            phoneManagerService.updateUser(user);
            return Msg.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Msg.error();
    }


    @ResponseBody
    @RequestMapping(value = "/delete/id={id}",method = RequestMethod.GET)
    public Msg DeleteUserById(@PathVariable("id") Integer id){
        phoneManagerService.deleteById(id);
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value = "/loginLog/id={userId}",method = RequestMethod.GET)
    public Msg GetUserLoginLog(@PathVariable("userId") Integer userId){
        List<LoginWithPhoneLog> logs= loginWithPhoneLogService.queryUserLoginLog(userId);
        return Msg.success().add("logs",logs);
    }

    @ResponseBody
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public Msg SavePhoneUser(PhoneManager phoneManager){
        phoneManager.setCreateDate(new Date());
        try {
            phoneManagerService.saveUser(phoneManager);
            return Msg.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Msg.error();
    }

}
