<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <div class="container">
        <h2>添加学生信息</h2>
        <form action="${pageContext.request.contextPath}/admin/student/add" method="post">
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
                <label>学业状态：</label>
                <select name="academicStatus">
                    <option value="未毕业">未毕业</option>
                    <option value="已毕业">已毕业</option>
                </select>
            </div>
            <div class="form-group">
                <label>学绩点：</label>
                <input type="number" name="gpa" step="0.01" required>
            </div>
            <div class="form-group">
                <label>智育分数：</label>
                <input type="number" name="intellectualScore" required>
            </div>
            <div class="form-group">
                <label>已获学分：</label>
                <input type="number" name="earnedCredits" step="0.01" required>
            </div>
            <div class="form-group">
                <label>补考状态：</label>
                <select name="retakeStatus">
                    <option value="不存在补考">不存在补考</option>
                    <option value="存在补考">存在补考</option>
                </select>
            </div>
            <div class="form-group">
                <div class="button-container">
                    <button type="submit" class="btn">添加</button>
                    <a href="${pageContext.request.contextPath}/admin/students" class="btn">返回</a>
                </div>
            </div>
            <div class="error-msg ${not empty msg ? 'show' : ''}">${msg}</div>
        </form>
    </div>
    <script>
    document.querySelector('form').addEventListener('submit', function(e) {
        const stuId = document.querySelector('input[name="stuId"]').value;
        const stuName = document.querySelector('input[name="stuName"]').value;
        const password = document.querySelector('input[name="password"]').value;
        
        // 清除之前的错误提示
        document.querySelector('.error-msg').classList.remove('show');
        
        // 检查必填字段是否为空
        if (!stuId || !stuName || !password) {
            e.preventDefault();
            showError('请填写所有必填字段');
            return;
        }
    });

    // 实时检查学号是否存在
    document.querySelector('input[name="stuId"]').addEventListener('blur', function() {
        const stuId = this.value;
        if (!/^\d{8}$/.test(stuId)) return;
        
        fetch('${pageContext.request.contextPath}/student/checkStuId?stuId=' + stuId)
            .then(response => response.text())
            .then(exists => {
                if (exists === 'true') {
                    showError('该学号已存在');
                    this.value = '';  // 清空输入
                    this.focus();     // 重新获取焦点
                }
            });
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
    </script>
</body>
</html> 