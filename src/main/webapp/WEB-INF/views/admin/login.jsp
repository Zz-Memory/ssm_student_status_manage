<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>管理员登录</h2>
        <form action="${pageContext.request.contextPath}/admin/login" method="post">
            <div class="form-group">
                <label>账号：</label>
                <input type="text" name="adminId" required>
            </div>
            <div class="form-group">
                <label>密码：</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <div class="button-container">
                    <button type="submit" class="btn">登录</button>
                    <a href="${pageContext.request.contextPath}/" class="btn">返回</a>
                </div>
            </div>
            <div class="error-msg">${msg}</div>
        </form>
    </div>
</body>
</html> 