package com.ecut.ssm.dao;

import com.ecut.ssm.entity.Student;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface StudentDao {
    // 添加学生
    int insertStudent(Student student);
    
    // 根据id删除学生
    int deleteStudentById(String stuId);
    
    // 更新学生信息
    int updateStudent(Student student);
    
    // 根据id查询学生
    Student getStudentById(String stuId);
    
    // 根据学号或姓名查询学生
    List<Student> getStudentByIdOrName(@Param("keyword") String keyword);
    
    // 查询所有学生
    List<Student> getAllStudents();
    
    // 学生登录验证
    Student validateStudent(@Param("stuId") String stuId, @Param("password") String password);
    
    // 添加检查学号是否存在的方法
    int checkStuIdExists(String stuId);
} 