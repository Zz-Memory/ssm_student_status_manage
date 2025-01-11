<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生选课信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>学生选课信息</h2>
        <div class="search-box">
            <form action="${pageContext.request.contextPath}/admin/student/courses/${stuId}" method="get">
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
                        <th>修改</th>
                        <th>删除</th>
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
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/course/edit?courseId=${course.courseId}&stuId=${stuId}" 
                                   class="btn-small">修改</a>
                            </td>
                            <td>
                                <button onclick="deleteCourse('${course.courseId}', '${stuId}')" 
                                        class="btn-small btn-danger">删除</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/admin/course/add?stuId=${stuId}" class="btn">添加选课信息</a>
            <a href="${pageContext.request.contextPath}/admin/students" class="btn">返回</a>
        </div>
    </div>

    <script>
        function deleteCourse(courseId, stuId) {
            if (confirm('确定要删除这条选课记录吗？')) {
                $.post('${pageContext.request.contextPath}/admin/course/delete', {
                    courseId: courseId,
                    stuId: stuId
                }, function(response) {
                    if (response === 'success') {
                        alert('删除成功');
                        location.reload();
                    } else {
                        alert('删除失败');
                    }
                });
            }
        }
    </script>
</body>
</html> 