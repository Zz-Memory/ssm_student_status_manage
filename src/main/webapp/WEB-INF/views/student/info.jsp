<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>学生个人信息</h2>
        <div class="info-table">
            <table>
                <tr>
                    <th>学号</th>
                    <td>${student.stuId}</td>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td>${student.stuName}</td>
                </tr>
                <tr>
                    <th>性别</th>
                    <td>${student.gender}</td>
                </tr>
                <tr>
                    <th>年龄</th>
                    <td>${student.age}</td>
                </tr>
                <tr>
                    <th>电话</th>
                    <td>${student.phoneNum}</td>
                </tr>
                <tr>
                    <th>专业</th>
                    <td>${student.major}</td>
                </tr>
                <tr>
                    <th>学业状态</th>
                    <td>${student.academicStatus}</td>
                </tr>
                <tr>
                    <th>学绩点</th>
                    <td>${student.gpa}</td>
                </tr>
                <tr>
                    <th>智育分数</th>
                    <td>${student.intellectualScore}</td>
                </tr>
                <tr>
                    <th>已获学分</th>
                    <td>${student.earnedCredits}</td>
                </tr>
                <tr>
                    <th>补考状态</th>
                    <td>${student.retakeStatus}</td>
                </tr>
            </table>
        </div>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/student/courses" class="btn">查看选课信息</a>
            <a href="${pageContext.request.contextPath}/student/logout" class="btn">退出登录</a>
        </div>
    </div>
</body>
</html> 