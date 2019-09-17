package com.manager.mapper.manager;

import com.manager.pojo.PhoneManager;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface PhoneManagerMapper {
    List<PhoneManager> queryAll();

    List<PhoneManager> queryAllResultMap();

    List<PhoneManager> queryAllByCompanyId(@Param("companyId") Integer companyId);

    PhoneManager queryById(@Param("id") Integer id);

    void deleteById(@Param("id")Integer id);

    void updateUserSelective(PhoneManager phoneManager) throws Exception;

    void updateUserPermission(@Param("id") Integer id,@Param("userPermission")String userPermission);

    void saveUser(PhoneManager phoneManager) throws Exception;

    void updateUserState(@Param("id") Integer id, @Param("state")String state);

    Integer CountUserByCompanyId(@Param("companyId") Integer companyId);

    Integer countUserByUserKey(@Param("userKey")String userKey);

    PhoneManager queryByUserKey(@Param("userKey")String userKey);

    void updateUserLastLoginTime(@Param("userKey")String userKey,@Param("lastLoginTime") String lastLoginTime,@Param("state") String state);

    Integer getIdByUserKey(@Param("userKey")String userKey);

    Integer getCompanyIdByUserKey(@Param("userKey")String userKey);

    List<Map<String, Object>> queryAllLoginUsers();

    String getPermissionByUserKey(String userKey);
}
