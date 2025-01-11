<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学生信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>修改学生信息</h2>
        <form action="${pageContext.request.contextPath}/admin/student/update" method="post">
            <input type="hidden" name="stuId" value="${student.stuId}">
            <input type="hidden" name="password" value="${student.password}">
            <div class="form-group">
                <label>学号：</label>
                <input type="text" value="${student.stuId}" disabled>
            </div>
            <div class="form-group">
                <label>姓名：</label>
                <input type="text" name="stuName" value="${student.stuName}" required>
            </div>
            <div class="form-group">
                <label>性别：</label>
                <select name="gender">
                    <option value="男" ${student.gender == '男' ? 'selected' : ''}>男</option>
                    <option value="女" ${student.gender == '女' ? 'selected' : ''}>女</option>
                </select>
            </div>
            <div class="form-group">
                <label>年龄：</label>
                <input type="number" name="age" value="${student.age}" required>
            </div>
            <div class="form-group">
                <label>电话：</label>
                <input type="text" name="phoneNum" value="${student.phoneNum}">
            </div>
            <div class="form-group">
                <label>专业：</label>
                <select name="major">
                    <option value="计算机" ${student.major == '计算机' ? 'selected' : ''}>计算机</option>
                    <option value="外语" ${student.major == '外语' ? 'selected' : ''}>外语</option>
                </select>
            </div>
            <div class="form-group">
                <label>学业状态：</label>
                <select name="academicStatus">
                    <option value="已毕业" ${student.academicStatus == '已毕业' ? 'selected' : ''}>已毕业</option>
                    <option value="未毕业" ${student.academicStatus == '未毕业' ? 'selected' : ''}>未毕业</option>
                </select>
            </div>
            <div class="form-group">
                <label>学绩点：</label>
                <input type="number" name="gpa" value="${student.gpa}" step="0.01" required>
            </div>
            <div class="form-group">
                <label>智育分数：</label>
                <input type="number" name="intellectualScore" value="${student.intellectualScore}" required>
            </div>
            <div class="form-group">
                <label>已获学分：</label>
                <input type="number" name="earnedCredits" value="${student.earnedCredits}" step="0.01" required>
            </div>
            <div class="form-group">
                <label>补考状态：</label>
                <select name="retakeStatus">
                    <option value="存在补考" ${student.retakeStatus == '存在补考' ? 'selected' : ''}>存在补考</option>
                    <option value="不存在补考" ${student.retakeStatus == '不存在补考' ? 'selected' : ''}>不存在补考</option>
                </select>
            </div>
            <div class="form-group">
                <div class="button-container">
                    <button type="submit" class="btn">保存</button>
                    <a href="${pageContext.request.contextPath}/admin/students" class="btn">返回</a>
                </div>
            </div>
            <div class="error-msg">${msg}</div>
        </form>
    </div>
</body>
</html> 