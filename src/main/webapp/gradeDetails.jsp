<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grade Details</title>
</head>
<body>
    <h2>Grade Details</h2>
<%-- Вывод списка оценок --%>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Student ID</th>
            <th>Course ID</th>
            <th>Score</th>
        </tr>
            <tr>
                <td>${grade.getGradeId()}</td>
                <td>${grade.getStudentId()}</td>
                <td>${grade.getCourseId()}</td>
                <td>${grade.grade}</td>
            </tr>
    </table>

    <%-- Форма для обновления оценки --%>
    <h3>Update Grade</h3>
    <form action="${pageContext.request.contextPath}/gradeDetails" method="post">
        <input type="hidden" name="gradeId" value="${grade.gradeId}">
        <input type="hidden" name="action" value="update">

        <label for="newScore">New Score:</label>
        <input type="text" name="newScore" required>
        <br>

        <input type="submit" value="Update Grade">
    </form>

    <%-- Форма для удаления оценки --%>
    <h3>Delete Grade</h3>
    <form action="${pageContext.request.contextPath}/gradeDetails" method="post">
        <input type="hidden" name="gradeId" value="${grade.gradeId}">
        <input type="hidden" name="action" value="delete">

        <input type="submit" value="Delete Grade">
    </form>

    <a href="${pageContext.request.contextPath}/grades">Back to Grades List</a>
</body>
</html>
