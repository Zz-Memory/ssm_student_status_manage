<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新生注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>新生注册</h2>
        <form action="${pageContext.request.contextPath}/student/register" method="post">
            <div class="form-group">
                <label>学号：</label>
                <input type="text" name="stuId" required>
            </div>
            <div class="form-group">
                <label>姓名：</label>
                <input type="text" name="stuName" required>
            </div>
            <div class="form-group">
                <label>密码：</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <label>性别：</label>
                <select name="gender">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <div class="form-group">
                <label>年龄：</label>
                <input type="number" name="age" required>
            </div>
            <div class="form-group">
                <label>电话：</label>
                <input type="text" name="phoneNum">
            </div>
            <div class="form-group">
                <label>专业：</label>
                <select name="major">
                    <option value="计算机">计算机</option>
                    <option value="外语">外语</option>
                </select>
            </div>
            <div class="form-group">
                <div class="button-container">
                    <button type="submit" class="btn">注册</button>
                    <a href="${pageContext.request.contextPath}/" class="btn">返回</a>
                </div>
            </div>
            <div class="error-msg ${not empty msg ? 'show' : ''}">${msg}</div>
        </form>
    </div>
    <script>
    document.querySelector('form').addEventListener('submit', function(e) {
        const stuId = document.querySelector('input[name="stuId"]').value;
        const password = document.querySelector('input[name="password"]').value;
        
        // 清除之前的错误提示
        document.querySelector('.error-msg').classList.remove('show');
        
        // 学号格式验证（假设学号为8位数字）
        if (!/^\d{8}$/.test(stuId)) {
            e.preventDefault();
            showError('学号必须是8位数字');
            return;
        }
        
        // 密码长度验证
        if (password.length < 6) {
            e.preventDefault();
            showError('密码长度不能少于6位');
            return;
        }
    });

    function showError(message) {
        const errorDiv = document.querySelector('.error-msg');
        errorDiv.textContent = message;
        errorDiv.classList.add('show');
        
        // 3秒后自动隐藏错误提示
        setTimeout(() => {
            errorDiv.classList.remove('show');
        }, 3000);
    }

    // 如果有成功消息，显示成功提示
    <c:if test="${not empty successMsg}">
        showSuccess('${successMsg}');
    </c:if>

    // 如果有错误消息，显示错误提示
    <c:if test="${not empty msg}">
        showError('${msg}');
    </c:if>
    </script>
</body>
</html> 