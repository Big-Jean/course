<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
</head>
<body>
    <h2>Student Details</h2>

    <%-- Вывод информации о студенте --%>
    <c:if test="${not empty student}">
        <p>ID: ${student.getStudentId()}</p>
        <p>Name: ${student.getName()}</p>
        <p>Age: ${student.getAge()}</p>
        <p>Email: ${student.getEmail()}</p>
    </c:if>

    <h3>Edit Student</h3>
    <form action="${pageContext.request.contextPath}/studentDetails" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="studentId" value="${student.getStudentId()}">

        <label for="updatedStudentName">Name:</label>
        <input type="text" name="updatedStudentName" value="${student.name}" required>
        <br>

        <label for="updatedStudentAge">Age:</label>
        <input type="text" name="updatedStudentAge" value="${student.age}" required>
        <br>

        <label for="updatedStudentEmail">Email:</label>
        <input type="text" name="updatedStudentEmail" value="${student.email}" required>
        <br>

        <input type="submit" value="Update Student">
    </form>

    <h3>Delete Student</h3>
    <form action="${pageContext.request.contextPath}/studentDetails" method="post">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="studentId" value="${student.getStudentId()}">
        <input type="submit" value="Delete Student">
    </form>

    <a href="${pageContext.request.contextPath}/students">Back to Students List</a>
</body>
</html>
