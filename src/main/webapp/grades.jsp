<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grades List</title>
</head>
<body>
    <h2>Grades List</h2>

    <%-- Вывод списка оценок --%>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Student ID</th>
            <th>Course ID</th>
            <th>Score</th>
        </tr>
        <c:forEach var="grade" items="${grades}">
            <tr>
                <td>${grade.getGradeId()}</td>
                <td>${grade.getStudentId()}</td>
                <td>${grade.getCourseId()}</td>
                <td>${grade.grade}</td>
            </tr>
        </c:forEach>
    </table>

    <%-- Форма для добавления новой оценки --%>
    <h3>Add New Grade</h3>
    <form action="${pageContext.request.contextPath}/grades" method="post">
        <label for="studentId">Student ID:</label>
        <input type="text" name="studentId" required>
        <br>

        <label for="courseId">Course ID:</label>
        <input type="text" name="courseId" required>
        <br>

        <label for="grade">Score:</label>
        <input type="text" name="grade" required>
        <br>

        <input type="submit" value="Add Grade">
    </form>
</body>
</html>
