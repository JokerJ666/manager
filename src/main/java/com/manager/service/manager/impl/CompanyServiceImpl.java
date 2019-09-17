package com.manager.service.manager.impl;

import com.manager.mapper.manager.CompanyMapper;
import com.manager.mapper.manager.PhoneManagerMapper;
import com.manager.pojo.Company;
import com.manager.service.manager.CompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service(value = "companyService")
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyMapper companyMapper;
    @Autowired
    private PhoneManagerMapper phoneManagerMapper;


    public Company queryById(Integer id) {
        return companyMapper.queryById(id);
    }

    public List<Company> queryAll() {
        return companyMapper.queryAll();
    }

    public List<Company> queryLikeName(String name) {
        return companyMapper.queryLikeName(name);
    }

    public void save(Company company) throws Exception {
        companyMapper.save(company);
    }

    public boolean existCompany(String companyCreditCode) {
        return companyMapper.existCompany(companyCreditCode)>0;
    }

    public void deleteById(Integer id) {
        companyMapper.deleteById(id);
    }

    public boolean existUserInCompany(Integer id) {
        return phoneManagerMapper.CountUserByCompanyId(id)>0;
    }

    public List<Company> queryLikeCode(String searchContent) {
        return companyMapper.queryLikeCode(searchContent);
    }

    public Company queryByUserKey(String userKey) {
        Integer id = phoneManagerMapper.getCompanyIdByUserKey(userKey);
        Company company = companyMapper.queryById(id);
        company.setBeginTime(companyMapper.getBeginTimeById(id));
        company.setEndTime(companyMapper.getEndTimeById(id));
        return company;
    }

    public void updateUserSelective(Company company) {
        companyMapper.updateUserSelective(company);
    }
}
