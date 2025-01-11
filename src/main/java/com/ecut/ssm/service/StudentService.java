package com.ecut.ssm.service;

import com.ecut.ssm.entity.Student;
import java.util.List;

public interface StudentService {
    // 学生注册
    boolean registerStudent(Student student);
    
    // 学生登录
    Student login(String stuId, String password);
    
    // 删除学生
    boolean deleteStudent(String stuId);
    
    // 更新学生信息
    boolean updateStudent(Student student);
    
    // 获取学生信息
    Student getStudentById(String stuId);
    
    // 根据学号或姓名查询学生
    List<Student> searchStudents(String keyword);
    
    // 获取所有学生
    List<Student> getAllStudents();
    
    // 添加检查学号是否存在的方法
    boolean isStuIdExists(String stuId);
} 