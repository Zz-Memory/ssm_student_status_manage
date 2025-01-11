package com.ecut.ssm.service;

import com.ecut.ssm.entity.SelectedCourse;
import java.util.List;

public interface SelectedCourseService {
    // 添加选课记录
    boolean addSelectedCourse(SelectedCourse selectedCourse);
    
    // 删除选课记录
    boolean deleteSelectedCourse(String courseId, String stuId);
    
    // 更新选课信息
    boolean updateSelectedCourse(SelectedCourse selectedCourse);
    
    // 获取学生的所有选课记录
    List<SelectedCourse> getStudentCourses(String stuId);
    
    // 根据课程号或课程名搜索选课记录
    List<SelectedCourse> searchStudentCourses(String stuId, String keyword);
    
    // 检查是否可以删除学生（是否还有选课记录）
    boolean canDeleteStudent(String stuId);
    
    // 获取指定学生的指定课程信息
    SelectedCourse getSelectedCourse(String courseId, String stuId);
} 