package com.manager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.manager.pojo.Company;
import com.manager.pojo.PhoneAdmin;
import com.manager.service.manager.CompanyService;
import com.manager.service.manager.PhoneAdminService;
import com.manager.sign.CommonSign;
import com.manager.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping(value = "/company")
public class CompanyController {

    @Autowired
    private CompanyService companyService;
    @Autowired
    private PhoneAdminService phoneAdminService;


    @ResponseBody
    @RequestMapping(value = "/listAll",method = RequestMethod.GET)
    public Msg ListAll(@RequestParam(value = "page",defaultValue = "1") Integer page){
        PageHelper.startPage(page,10);
        List<Company> companies = companyService.queryAll();
        PageInfo<Company> pageInfo = new PageInfo<Company>(companies,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @ResponseBody
    @RequestMapping(value = "/name={name}",method = RequestMethod.GET)
    public Msg queryByName(@PathVariable("name") String name){
        List<Company> companies = companyService.queryLikeName(name);
        return Msg.success().add("companies",companies);
    }

    @ResponseBody
    @RequestMapping(value = "/getData/id={id}",method = RequestMethod.GET)
    public Msg queryById(@PathVariable("id")Integer id){
        Company company = companyService.queryById(id);
        return Msg.success().add("company",company);
    }

    @ResponseBody
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public Msg SaveCompany(Company company){
        company.setCreateDate(new Date());
        try {
            companyService.save(company);
            return Msg.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Msg.error();
    }

    @ResponseBody
    @RequestMapping(value = "/saveAdminUser",method = RequestMethod.POST)
    public Msg SaveAdminUser(PhoneAdmin phoneAdmin){
        try {
            phoneAdminService.saveUser(phoneAdmin);
            return Msg.success();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Msg.error();
    }

    @ResponseBody
    @RequestMapping(value = "/phoneAdminList",method = RequestMethod.GET)
    public Msg GetPhoneAdminList(@RequestParam("companyId")Integer companyId){
        List<PhoneAdmin> phoneAdmins = phoneAdminService.listUserByCompanyId(companyId);
        return Msg.success().add("AdminUserList",phoneAdmins);
    }


    @ResponseBody
    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    public Msg editCompany(Company company){
        System.out.println(company);
        companyService.updateUserSelective(company);
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value = "/saveWorkTime",method = RequestMethod.POST)
    public Msg SaveWorkTime(HttpServletRequest request){
        String begin[] = new String[3];
        String end[] = new String[3];
        StringBuffer beginTime = new StringBuffer();
        StringBuffer endTime = new StringBuffer();
        String workday = request.getParameter("workday");
        begin[0] = request.getParameter("begin1");
        begin[1] = request.getParameter("begin2");
        begin[2] = request.getParameter("begin3");
        end[0] = request.getParameter("end1");
        end[1] = request.getParameter("end2");
        end[2] = request.getParameter("end3");

        for(int i=0;i<3;i++){
            if(begin[i]==null || "".equals(begin[i]))
                begin[i]="00:00";
            if(end[i]==null || "".equals(end[i]))
                end[i]="00:00";
            beginTime.append(begin[i]);
            endTime.append(end[i]);
            if(i!=2){
                beginTime.append(",");
                endTime.append(",");
            }
        }
        if(workday==null)
            workday="";
        Company company = new Company();
        company.setId(Integer.parseInt(request.getParameter("id")));
        company.setWorkday(workday);
        company.setBeginTime(beginTime.toString());
        company.setEndTime(endTime.toString());
        companyService.updateUserSelective(company);
        return Msg.success();
    }


    @ResponseBody
    @RequestMapping(value = "/exist/companyCreditCode={companyCreditCode}",method = RequestMethod.GET)
    public Msg ExistCompany(@PathVariable("companyCreditCode") String companyCreditCode){
        if(companyService.existCompany(companyCreditCode)){
            //该公司已经存在
            return Msg.error();
        }
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.DELETE)
    public Msg DeleteCompany(@PathVariable("id")Integer id){
        if(companyService.existUserInCompany(id)){
            return Msg.error();
        }
        companyService.deleteById(id);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public Msg SearchCompany(@RequestParam(value = "page",defaultValue = "1") Integer page,
                             @RequestParam(value = "searchType") String searchType,
                             @RequestParam(value = "searchContent") String searchContent){
        try {
            searchContent = new String(searchContent.getBytes("iso-8859-1"),"utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        PageHelper.startPage(page,10);
        List<Company> companies;
        if(CommonSign.SearchType.NAME.index.equals(searchType)){
            //通过公司名称查询
            companies =  companyService.queryLikeName(searchContent);
        }else{
            //通过统一社会信用代码搜索
            companies =  companyService.queryLikeCode(searchContent);
        }
        PageInfo<Company> pageInfo = new PageInfo<Company>(companies,5);
        if(companies.size()>0)
            return Msg.success().add("pageInfo",pageInfo);
        return Msg.error();
    }
}
