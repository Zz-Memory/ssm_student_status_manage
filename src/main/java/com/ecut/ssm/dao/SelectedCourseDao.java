package com.ecut.ssm.dao;

import com.ecut.ssm.entity.SelectedCourse;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface SelectedCourseDao {
    // 添加选课记录
    int insertSelectedCourse(SelectedCourse selectedCourse);
    
    // 删除选课记录
    int deleteSelectedCourse(@Param("courseId") String courseId, @Param("stuId") String stuId);
    
    // 更新选课信息
    int updateSelectedCourse(SelectedCourse selectedCourse);
    
    // 根据学生ID查询所有选课记录
    List<SelectedCourse> getSelectedCoursesByStuId(String stuId);
    
    // 根据课程号或课程名查询选课记录
    List<SelectedCourse> getSelectedCoursesByIdOrName(@Param("stuId") String stuId, 
                                                     @Param("keyword") String keyword);
    
    // 查询指定学生是否已选某课程
    SelectedCourse getSelectedCourse(@Param("courseId") String courseId, 
                                   @Param("stuId") String stuId);
    
    // 查询学生的所有选课记录数量（用于删除学生时的检查）
    int getSelectedCoursesCountByStuId(String stuId);
} 