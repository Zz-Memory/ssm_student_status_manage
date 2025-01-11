package com.ecut.ssm.dao;

import com.ecut.ssm.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {
    // 管理员登录验证
    Admin validateAdmin(@Param("adminId") String adminId, @Param("password") String password);
    
    // 根据id查询管理员信息
    Admin getAdminById(String adminId);
    
    // 更新管理员信息
    int updateAdmin(Admin admin);
} 