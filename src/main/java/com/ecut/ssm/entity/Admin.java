package com.ecut.ssm.entity;

public class Admin {
    private String adminId;
    private String password;
    private String adminName;
    private String phoneNum;

    // 无参构造
    public Admin() {}

    // 有参构造
    public Admin(String adminId, String password, String adminName, String phoneNum) {
        this.adminId = adminId;
        this.password = password;
        this.adminName = adminName;
        this.phoneNum = phoneNum;
    }

    // Getter和Setter方法
    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }
} 