<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>管理员信息</h2>
        <div class="info-table">
            <table>
                <tr>
                    <th>管理员ID</th>
                    <td>${admin.adminId}</td>
                </tr>
                <tr>
                    <th>姓名</th>
                    <td>${admin.adminName}</td>
                </tr>
                <tr>
                    <th>电话</th>
                    <td>${admin.phoneNum}</td>
                </tr>
            </table>
        </div>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/admin/students" class="btn">学生管理</a>
            <a href="${pageContext.request.contextPath}/admin/logout" class="btn">退出登录</a>
        </div>
    </div>
</body>
</html> 