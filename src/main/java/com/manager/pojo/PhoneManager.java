package com.manager.pojo;

import java.util.Date;


public class PhoneManager {

    private Integer id;

    private String state;

    private String userKey;//串号

    private Date createDate;//创建时间

    private String permission;//状态

    private String note;//备注

    private String lastLoginTime;//上次登录时间

    private Integer companyId;//公司id

    private String usedName;//常用人姓名

    private Company company;


    public String getUsedName() {
        return usedName;
    }

    public void setUsedName(String usedName) {
        this.usedName = usedName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUserKey() {
        return userKey;
    }

    public void setUserKey(String userKey) {
        this.userKey = userKey;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "PhoneManager{" +
                "id=" + id +
                ", state='" + state + '\'' +
                ", userKey='" + userKey + '\'' +
                ", createDate=" + createDate +
                ", permission='" + permission + '\'' +
                ", note='" + note + '\'' +
                ", lastLoginTime='" + lastLoginTime + '\'' +
                ", companyId=" + companyId +
                ", usedName='" + usedName + '\'' +
                ", company=" + company +
                '}';
    }
}
