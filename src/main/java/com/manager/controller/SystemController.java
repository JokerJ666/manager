package com.manager.controller;


import com.manager.pojo.SystemUser;
import com.manager.service.system.SystemUserService;
import com.manager.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping
public class SystemController {

    @Autowired
    private SystemUserService systemUserService;

    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Msg Login(SystemUser systemUser, HttpServletRequest request){
        SystemUser user = systemUserService.findSystemUser(systemUser);
        if(user != null){
            request.getSession().setAttribute("user",user);
            return Msg.success();
        }
        return Msg.error();
    }

    @ResponseBody
    @RequestMapping(value = "/login/register/username={username}",method = RequestMethod.GET)
    public Msg ExistUser(@PathVariable("username")String username){
        if(systemUserService.existUserByUsername(username))
            return Msg.error();
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/login/register/key",method = RequestMethod.POST)
    public Msg RegisterKey(@RequestParam(value = "key")String key){
        if("123".equals(key))
            return Msg.success();
        return Msg.error();
    }

    @ResponseBody
    @RequestMapping(value = "/register/save",method = RequestMethod.POST)
    public Msg SaveUser(SystemUser user){
        if(systemUserService.existUserByUsername(user.getUsername()))
            return Msg.error();
        systemUserService.save(user);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/logout")
    public Msg Logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return Msg.success();
    }

}
