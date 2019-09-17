package com.manager.mapper.manager;

import com.manager.pojo.PhoneAdmin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PhoneAdminMapper {

    void saveUser(PhoneAdmin phoneAdmin) throws Exception;

    Integer existByUsername(@Param("username") String username);

    PhoneAdmin queryByUsername(@Param("username") String username);

    List<PhoneAdmin> listUserByCompanyId(@Param("companyId")Integer companyId);
}
