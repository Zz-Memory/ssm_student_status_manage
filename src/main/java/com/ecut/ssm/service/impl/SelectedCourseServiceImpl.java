package com.ecut.ssm.service.impl;

import com.ecut.ssm.dao.SelectedCourseDao;
import com.ecut.ssm.entity.SelectedCourse;
import com.ecut.ssm.service.SelectedCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SelectedCourseServiceImpl implements SelectedCourseService {
    @Autowired
    private SelectedCourseDao selectedCourseDao;
    
    @Override
    public boolean addSelectedCourse(SelectedCourse selectedCourse) {
        return selectedCourseDao.insertSelectedCourse(selectedCourse) > 0;
    }
    
    @Override
    public boolean deleteSelectedCourse(String courseId, String stuId) {
        return selectedCourseDao.deleteSelectedCourse(courseId, stuId) > 0;
    }
    
    @Override
    public boolean updateSelectedCourse(SelectedCourse selectedCourse) {
        return selectedCourseDao.updateSelectedCourse(selectedCourse) > 0;
    }
    
    @Override
    public List<SelectedCourse> getStudentCourses(String stuId) {
        return selectedCourseDao.getSelectedCoursesByStuId(stuId);
    }
    
    @Override
    public List<SelectedCourse> searchStudentCourses(String stuId, String keyword) {
        return selectedCourseDao.getSelectedCoursesByIdOrName(stuId, keyword);
    }
    
    @Override
    public boolean canDeleteStudent(String stuId) {
        return selectedCourseDao.getSelectedCoursesCountByStuId(stuId) == 0;
    }
    
    @Override
    public SelectedCourse getSelectedCourse(String courseId, String stuId) {
        return selectedCourseDao.getSelectedCourse(courseId, stuId);
    }
} 