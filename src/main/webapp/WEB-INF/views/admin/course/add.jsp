<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加选课信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>添加选课信息</h2>
        <form action="${pageContext.request.contextPath}/admin/course/add" method="post">
            <input type="hidden" name="stuId" value="${param.stuId}">
            <div class="form-group">
                <label>课程号：</label>
                <input type="text" name="courseId" required>
            </div>
            <div class="form-group">
                <label>学号：</label>
                <input type="text" value="${param.stuId}" disabled>
            </div>
            <div class="form-group">
                <label>课程名：</label>
                <input type="text" name="courseName" required>
            </div>
            <div class="form-group">
                <label>课程类型：</label>
                <select name="courseType">
                    <option value="选修">选修</option>
                    <option value="辅修">辅修</option>
                    <option value="二专">二专</option>
                </select>
            </div>
            <div class="form-group">
                <label>课程性质：</label>
                <select name="courseNature">
                    <option value="人文类">人文类</option>
                    <option value="科技类">科技类</option>
                </select>
            </div>
            <div class="form-group">
                <label>还需学分：</label>
                <input type="number" name="remainingCredits" step="0.01" required>
            </div>
            <div class="form-group">
                <div class="button-container">
                    <button type="submit" class="btn">添加</button>
                    <a href="${pageContext.request.contextPath}/admin/student/courses/${param.stuId}" class="btn">返回</a>
                </div>
            </div>
            <div class="error-msg">${msg}</div>
        </form>
    </div>
</body>
</html> 