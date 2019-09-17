package com.manager.service.manager;

import com.manager.pojo.Company;

import java.util.List;

public interface CompanyService {

    Company queryById(Integer id);

    List<Company> queryAll();

    List<Company> queryLikeName(String name);

    void save(Company company)throws Exception ;

    boolean existCompany(String companyCreditCode);

    void deleteById(Integer id);

    boolean existUserInCompany(Integer id);

    List<Company> queryLikeCode(String searchContent);

    Company queryByUserKey(String userKey);

    void updateUserSelective(Company company);
}
