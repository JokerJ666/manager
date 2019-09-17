package com.manager.pojo;

import java.util.Date;

public class LoginWithPhoneLog {
    @Override
    public String toString() {
        return "LoginWithPhoneLog{" +
                "userId=" + userId +
                ", loginDate=" + loginDate +
                ", loginType='" + loginType + '\'' +
                ", username='" + username + '\'' +
                ", uName='" + uName + '\'' +
                ", phone='" + phone + '\'' +
                ", belong='" + belong + '\'' +
                '}';
    }

    private Integer userId;

    private Date loginDate;

    private String loginType;

    private String username;

    private String uName;

    private String phone;

    private String belong;

    public LoginWithPhoneLog( Date loginDate, String loginType, String username,String uName, String phone, String belong) {
        this.loginDate = loginDate;
        this.loginType = loginType;
        this.username = username;
        this.uName = uName;
        this.phone = phone;
        this.belong = belong;
    }

    public LoginWithPhoneLog(){}

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getLoginType() {
        return loginType;
    }

    public void setLoginType(String loginType) {
        this.loginType = loginType;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBelong() {
        return belong;
    }

    public void setBelong(String belong) {
        this.belong = belong;
    }
}
