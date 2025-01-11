package com.ecut.ssm.service.impl;

import com.ecut.ssm.dao.StudentDao;
import com.ecut.ssm.entity.Student;
import com.ecut.ssm.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    
    @Override
    public boolean isStuIdExists(String stuId) {
        return studentDao.checkStuIdExists(stuId) > 0;
    }
    
    @Override
    public boolean registerStudent(Student student) {
        if (isStuIdExists(student.getStuId())) {
            throw new RuntimeException("该学号已存在");
        }
        return studentDao.insertStudent(student) > 0;
    }
    
    @Override
    public Student login(String stuId, String password) {
        return studentDao.validateStudent(stuId, password);
    }
    
    @Override
    public boolean deleteStudent(String stuId) {
        return studentDao.deleteStudentById(stuId) > 0;
    }
    
    @Override
    public boolean updateStudent(Student student) {
        return studentDao.updateStudent(student) > 0;
    }
    
    @Override
    public Student getStudentById(String stuId) {
        return studentDao.getStudentById(stuId);
    }
    
    @Override
    public List<Student> searchStudents(String keyword) {
        return studentDao.getStudentByIdOrName(keyword);
    }
    
    @Override
    public List<Student> getAllStudents() {
        return studentDao.getAllStudents();
    }
} 