package com.manager.controller;


import com.manager.pojo.SystemUser;
import com.manager.service.system.SystemUserService;
import com.manager.util.Msg;
import com.manager.utils.StringUtils;
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
            return Msg.success().add("privilege",user.getPrivilege()).add("company",user.getCompany());
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
    public Msg SaveUser(SystemUser user, HttpServletRequest request){
        Msg msg = new Msg();
        if (StringUtils.isEmpty(user.getName())&&StringUtils.isEmpty(user.getPassword())){
            msg.setCode(4001);
            msg.setMsg("请输入需要修改的信息！");
            return msg;
        }
        if(systemUserService.existUserByUsername(user.getUsername()))
        {
            systemUserService.update(user);
            request.getSession().setAttribute("user",user);
            msg.setCode(200);
            msg.setMsg("更新用户成功");
            if (user.getPassword() != null &&user.getPassword() != ""){
                request.getSession().removeAttribute("user");
                msg.setMsg("密码修改成功，请重新登录！");
            }
            return msg;
        }
        systemUserService.save(user);
        msg.setCode(200);
        msg.setMsg("保存用户成功");
        return msg;
    }

    @ResponseBody
    @RequestMapping(value = "/add/newUser",method = RequestMethod.POST)
    public Msg addUser(SystemUser user){
        Msg msg = new Msg();
        if (user.getUsername() == null || user.getUsername() ==""){
            msg.setCode(4001);
            msg.setMsg("请输入账号！");
            return msg;
        }else if (user.getPassword() == null || user.getPassword() ==""){
            msg.setCode(4001);
            msg.setMsg("请输入密码！");
            return msg;
        }else if (user.getName() == null || user.getName() ==""){
            msg.setCode(4001);
            msg.setMsg("请输入姓名！");
            return msg;
        }else if (user.getCompany() == null || user.getCompany() == 0){
            msg.setCode(4001);
            msg.setMsg("请选择所属公司！");
            return msg;
        }
        if(systemUserService.existUserByUsername(user.getUsername()))
        {
            msg.setCode(4001);
            msg.setMsg("保存失败，当前用户已存在！");
            return msg;
        }
        systemUserService.save(user);
        msg.setCode(200);
        msg.setMsg("保存用户成功");
        return msg;
    }

    @ResponseBody
    @RequestMapping(value = "/logout")
    public Msg Logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return Msg.success();
    }

}
