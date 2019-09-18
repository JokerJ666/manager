package com.manager.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Company {
    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", companyCreditCode='" + companyCreditCode + '\'' +
                ", createDate=" + createDate +
                ", address='" + address + '\'' +
                ", managerPhone='" + managerPhone + '\'' +
                ", managerName='" + managerName + '\'' +
                ", workday='" + workday + '\'' +
                ", beginTime='" + beginTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", remainingTime=" + remainingTime +
                ", maintainNum=" + maintainNum +
                '}';
    }

    private Integer id;

    private String companyName;

    private String companyCreditCode;

    private Date createDate;

    private String address;

    private String managerPhone;

    private String managerName;

    private String workday;

    private String beginTime;

    private String endTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date remainingTime;

    private Integer maintainNum;

    private String cloudServerInformation;  //商业云信息
    private String amountPackage;           //套餐信息

    public String getCloudServerInformation() {
        return cloudServerInformation;
    }

    public void setCloudServerInformation(String cloudServerInformation) {
        this.cloudServerInformation = cloudServerInformation;
    }

    public String getAmountPackage() {
        return amountPackage;
    }

    public void setAmountPackage(String amountPackage) {
        this.amountPackage = amountPackage;
    }

    public Date getRemainingTime() {
        return remainingTime;
    }

    public void setRemainingTime(Date remainingTime) {
        this.remainingTime = remainingTime;
    }

    public Integer getMaintainNum() {
        return maintainNum;
    }

    public void setMaintainNum(Integer maintainNum) {
        this.maintainNum = maintainNum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyCreditCode() {
        return companyCreditCode;
    }

    public void setCompanyCreditCode(String companyCreditCode) {
        this.companyCreditCode = companyCreditCode;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getManagerPhone() {
        return managerPhone;
    }

    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getWorkday() {
        return workday;
    }

    public void setWorkday(String workday) {
        this.workday = workday;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
}
