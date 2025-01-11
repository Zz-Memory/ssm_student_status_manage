package com.ecut.ssm.service;

import com.ecut.ssm.entity.Admin;

public interface AdminService {
    // 管理员登录
    Admin login(String adminId, String password);
    
    // 获取管理员信息
    Admin getAdminInfo(String adminId);
    
    // 更新管理员信息
    boolean updateAdminInfo(Admin admin);
} 