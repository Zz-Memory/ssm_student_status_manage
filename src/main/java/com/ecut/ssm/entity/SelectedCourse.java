package com.ecut.ssm.entity;

public class SelectedCourse {
    private String courseId;
    private String stuId;
    private String courseName;
    private String courseType;
    private String courseNature;
    private Double remainingCredits;

    // 无参构造
    public SelectedCourse() {}

    // 有参构造
    public SelectedCourse(String courseId, String stuId, String courseName, 
                         String courseType, String courseNature, Double remainingCredits) {
        this.courseId = courseId;
        this.stuId = stuId;
        this.courseName = courseName;
        this.courseType = courseType;
        this.courseNature = courseNature;
        this.remainingCredits = remainingCredits;
    }

    // Getter和Setter方法
    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public String getCourseNature() {
        return courseNature;
    }

    public void setCourseNature(String courseNature) {
        this.courseNature = courseNature;
    }

    public Double getRemainingCredits() {
        return remainingCredits;
    }

    public void setRemainingCredits(Double remainingCredits) {
        this.remainingCredits = remainingCredits;
    }
} 