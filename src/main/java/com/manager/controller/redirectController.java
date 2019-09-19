package com.manager.controller;

import com.manager.pojo.Company;
import com.manager.service.manager.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


@Controller
public class redirectController {

    @Autowired
    private CompanyService companyService;

    @RequestMapping(value = "/login")
    public String ToLogin(){
        return "/System/Main";
    }


    @RequestMapping(value = "/company")
    public String ToCompany(Model model){
        model.addAttribute("page","company");
        return "/Company/Main";
    }

    @RequestMapping(value = "/userForm/privilege={privilege}")
    public String ToUserForm(@PathVariable("privilege")Integer privilege, Model model){
        List<Company> companies = companyService.queryAll();
        model.addAttribute("companies",companies);
        model.addAttribute("page","userForm");
        model.addAttribute("privilege",privilege);
        return "/Company/Main";
    }

    @RequestMapping(value = "/userAdd")
    public String ToUserAdd(Model model){
        List<Company> companies = companyService.queryAll();
        model.addAttribute("companies",companies);
        model.addAttribute("page","userAdd");
        model.addAttribute("personal",2);
        return "/Company/Main";
    }


    @RequestMapping(value = "/company/handel/id={id}",method = RequestMethod.GET)
    public String ToHandleCompany(@PathVariable("id")Integer id,Model model){
        model.addAttribute("companyId",id);
        model.addAttribute("page","handel");
        return "/Company/Main";
    }



}
