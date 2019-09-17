package com.manager.pojo;

import java.util.Date;


public class PhoneManager {
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
                ", company=" + company +
                '}';
    }

    private Integer id;

    private String state;

    private String userKey;

    private Date createDate;

    private String permission;

    private String note;

    private String lastLoginTime;

    private Integer companyId;

    private Company company;

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
}
