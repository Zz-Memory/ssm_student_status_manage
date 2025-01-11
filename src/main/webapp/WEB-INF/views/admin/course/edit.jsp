<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改选课信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>修改选课信息</h2>
        <form action="${pageContext.request.contextPath}/admin/course/update" method="post">
            <input type="hidden" name="stuId" value="${course.stuId}">
            <div class="form-group">
                <label>课程号：</label>
                <input type="text" name="courseId" value="${course.courseId}" readonly>
            </div>
            <div class="form-group">
                <label>学号：</label>
                <input type="text" value="${course.stuId}" disabled>
            </div>
            <div class="form-group">
                <label>课程名：</label>
                <input type="text" name="courseName" value="${course.courseName}" required>
            </div>
            <div class="form-group">
                <label>课程类型：</label>
                <select name="courseType">
                    <option value="选修" ${course.courseType == '选修' ? 'selected' : ''}>选修</option>
                    <option value="辅修" ${course.courseType == '辅修' ? 'selected' : ''}>辅修</option>
                    <option value="二专" ${course.courseType == '二专' ? 'selected' : ''}>二专</option>
                </select>
            </div>
            <div class="form-group">
                <label>课程性质：</label>
                <select name="courseNature">
                    <option value="人文类" ${course.courseNature == '人文类' ? 'selected' : ''}>人文类</option>
                    <option value="科技类" ${course.courseNature == '科技类' ? 'selected' : ''}>科技类</option>
                </select>
            </div>
            <div class="form-group">
                <label>还需学分：</label>
                <input type="number" name="remainingCredits" value="${course.remainingCredits}" step="0.01" required>
            </div>
            <div class="form-group">
                <div class="button-container">
                    <button type="submit" class="btn">保存</button>
                    <a href="${pageContext.request.contextPath}/admin/student/courses/${course.stuId}" class="btn">返回</a>
                </div>
            </div>
            <div class="error-msg">${msg}</div>
        </form>
    </div>
</body>
</html> 