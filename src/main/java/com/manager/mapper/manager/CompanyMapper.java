package com.manager.mapper.manager;

import com.manager.pojo.Company;
import org.apache.ibatis.annotations.Param;
import org.omg.PortableInterceptor.INACTIVE;

import java.util.List;

public interface CompanyMapper {

    Company queryById(@Param("id")Integer id);

    List<Company> queryAll();

    List<Company> queryLikeName(@Param("companyName") String name);

    void save(Company company)throws Exception ;

    Integer existCompany(@Param("companyCreditCode") String companyCreditCode);

    void deleteById(@Param("id") Integer id);

    List<Company> queryLikeCode(@Param("companyCreditCode") String companyCreditCode);

    String getBeginTimeById(@Param("id")Integer id);

    String getEndTimeById(@Param("id")Integer id);

    void updateUserSelective(Company company);
}
