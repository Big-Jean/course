<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Details</title>
</head>
<body>

    <h2>Course Details</h2>

    <c:if test="${not empty course}">
        <p>Course ID: ${course.courseId}</p>
        <p>Course Name: ${course.courseName}</p>

        <%-- Форма для редактирования курса --%>
        <h3>Edit Course</h3>
        <form action="${pageContext.request.contextPath}/courseDetails" method="post">
            <input type="hidden" name="courseId" value="${course.courseId}">
            <input type="hidden" name="action" value="update">
            <label for="updatedCourseName">Updated Course Name:</label>
            <input type="text" id="updatedCourseName" name="courseName" value="${course.courseName}" required>
            <button type="submit">Update Course</button>
        </form>

        <%-- Форма для удаления курса --%>
        <h3>Delete Course</h3>
        <form action="${pageContext.request.contextPath}/courseDetails" method="post">
            <input type="hidden" name="courseId" value="${course.courseId}">
            <input type="hidden" name="action" value="delete">
            <button type="submit">Delete Course</button>
        </form>
    </c:if>

    <a href="${pageContext.request.contextPath}/courses">Back to Courses List</a>

</body>
</html>
