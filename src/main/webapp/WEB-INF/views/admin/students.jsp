<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>学生信息管理</h2>
        <div class="search-box">
            <form action="${pageContext.request.contextPath}/admin/students" method="get">
                <input type="text" name="keyword" placeholder="输入学号或姓名搜索" value="${param.keyword}">
                <button type="submit" class="btn">搜索</button>
            </form>
        </div>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>电话</th>
                        <th>专业</th>
                        <th>学业状态</th>
                        <th>学绩点</th>
                        <th>智育分数</th>
                        <th>已获学分</th>
                        <th>补考状态</th>
                        <th>选课情况</th>
                        <th>修改</th>
                        <th>删除</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${students}" var="student">
                        <tr>
                            <td>${student.stuId}</td>
                            <td>${student.stuName}</td>
                            <td>${student.gender}</td>
                            <td>${student.age}</td>
                            <td>${student.phoneNum}</td>
                            <td>${student.major}</td>
                            <td>${student.academicStatus}</td>
                            <td>${student.gpa}</td>
                            <td>${student.intellectualScore}</td>
                            <td>${student.earnedCredits}</td>
                            <td>${student.retakeStatus}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/student/courses/${student.stuId}" class="btn-small">查看</a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/student/edit/${student.stuId}" class="btn-small">修改</a>
                            </td>
                            <td>
                                <button onclick="deleteStudent('${student.stuId}')" class="btn-small btn-danger">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/admin/student/add" class="btn">添加学籍信息</a>
            <a href="${pageContext.request.contextPath}/admin/info" class="btn">返回</a>
        </div>
    </div>
    
    <script>
        function deleteStudent(stuId) {
            if (confirm('确定要删除该学生吗？')) {
                $.post('${pageContext.request.contextPath}/admin/student/delete/' + stuId, function(response) {
                    if (response === 'success') {
                        alert('删除成功');
                        location.reload();
                    } else {
                        alert(response);
                    }
                });
            }
        }
    </script>
</body>
</html> 