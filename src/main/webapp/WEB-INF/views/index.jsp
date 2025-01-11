<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生学籍管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>欢迎使用学生学籍管理系统</h1>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/student/loginPage" class="btn">学生登录</a>
            <a href="${pageContext.request.contextPath}/student/registerPage" class="btn">新生注册</a>
            <a href="${pageContext.request.contextPath}/admin/loginPage" class="btn">管理员登录</a>
        </div>
    </div>
</body>
</html> 