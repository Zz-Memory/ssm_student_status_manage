package com.ecut.ssm.service.impl;

import com.ecut.ssm.dao.AdminDao;
import com.ecut.ssm.entity.Admin;
import com.ecut.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    
    @Override
    public Admin login(String adminId, String password) {
        return adminDao.validateAdmin(adminId, password);
    }
    
    @Override
    public Admin getAdminInfo(String adminId) {
        return adminDao.getAdminById(adminId);
    }
    
    @Override
    public boolean updateAdminInfo(Admin admin) {
        return adminDao.updateAdmin(admin) > 0;
    }
} 