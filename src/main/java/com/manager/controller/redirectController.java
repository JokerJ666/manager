package com.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class redirectController {


    @RequestMapping(value = "/login")
    public String ToLogin(){
        return "/System/Main";
    }


    @RequestMapping(value = "/company")
    public String ToCompany(Model model){
        model.addAttribute("page","company");
        return "/Company/Main";
    }


    @RequestMapping(value = "/company/handel/id={id}",method = RequestMethod.GET)
    public String ToHandleCompany(@PathVariable("id")Integer id,Model model){
        model.addAttribute("companyId",id);
        model.addAttribute("page","handel");
        return "/Company/Main";
    }



}
