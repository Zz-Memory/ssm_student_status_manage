<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>选课信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>我的选课信息</h2>
        <div class="search-box">
            <form action="${pageContext.request.contextPath}/student/courses" method="get">
                <input type="text" name="keyword" placeholder="输入课程号或课程名搜索" value="${param.keyword}">
                <button type="submit" class="btn">搜索</button>
            </form>
        </div>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>课程号</th>
                        <th>课程名</th>
                        <th>课程类型</th>
                        <th>课程性质</th>
                        <th>还需学分</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courses}" var="course">
                        <tr>
                            <td>${course.courseId}</td>
                            <td>${course.courseName}</td>
                            <td>${course.courseType}</td>
                            <td>${course.courseNature}</td>
                            <td>${course.remainingCredits}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/student/info" class="btn">返回</a>
        </div>
    </div>
</body>
</html> 