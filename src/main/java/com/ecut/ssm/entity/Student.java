package com.ecut.ssm.entity;

public class Student {
    private String stuId;
    private String stuName;
    private String password;
    private String gender;
    private Integer age;
    private String phoneNum;
    private String major;
    private String academicStatus;
    private Double gpa;
    private Integer intellectualScore;
    private Double earnedCredits;
    private String retakeStatus;

    // 无参构造
    public Student() {}

    // 有参构造
    public Student(String stuId, String stuName, String password, String gender, 
                  Integer age, String phoneNum, String major, String academicStatus, 
                  Double gpa, Integer intellectualScore, Double earnedCredits, 
                  String retakeStatus) {
        this.stuId = stuId;
        this.stuName = stuName;
        this.password = password;
        this.gender = gender;
        this.age = age;
        this.phoneNum = phoneNum;
        this.major = major;
        this.academicStatus = academicStatus;
        this.gpa = gpa;
        this.intellectualScore = intellectualScore;
        this.earnedCredits = earnedCredits;
        this.retakeStatus = retakeStatus;
    }

    // Getter和Setter方法
    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getAcademicStatus() {
        return academicStatus;
    }

    public void setAcademicStatus(String academicStatus) {
        this.academicStatus = academicStatus;
    }

    public Double getGpa() {
        return gpa;
    }

    public void setGpa(Double gpa) {
        this.gpa = gpa;
    }

    public Integer getIntellectualScore() {
        return intellectualScore;
    }

    public void setIntellectualScore(Integer intellectualScore) {
        this.intellectualScore = intellectualScore;
    }

    public Double getEarnedCredits() {
        return earnedCredits;
    }

    public void setEarnedCredits(Double earnedCredits) {
        this.earnedCredits = earnedCredits;
    }

    public String getRetakeStatus() {
        return retakeStatus;
    }

    public void setRetakeStatus(String retakeStatus) {
        this.retakeStatus = retakeStatus;
    }
} 