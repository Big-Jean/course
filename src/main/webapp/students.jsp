<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Students List</title>
</head>
<body>
    <h2>Students List</h2>

    <%-- Вывод списка студентов --%>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
            <th>Email</th>
        </tr>
        <c:forEach var="student" items="${students}">
            <tr>
                <td><a href="studentDetails?studentId=${student.getStudentId()}">${student.getStudentId()}</a></td>
                <td>${student.getName()}</td>
                <td>${student.getAge()}</td>
                <td>${student.getEmail()}</td>

            </tr>
        </c:forEach>
    </table>

    <%-- Форма для создания нового студента --%>
    <h3>Add New Student</h3>
    <form action="${pageContext.request.contextPath}/students" method="post">
        <input type="hidden" name="action" value="create">

        <label for="studentName">Name:</label>
        <input type="text" name="studentName" required>
        <br>

        <label for="studentAge">Age:</label>
        <input type="text" name="studentAge" required>
        <br>

        <label for="studentEmail">Email:</label>
        <input type="text" name="studentEmail" required>
        <br>

        <input type="submit" value="Add Student">
    </form>
</body>
</html>
