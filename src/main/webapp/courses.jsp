<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses List</title>
</head>
<body>

    <h2>Courses List</h2>

    <%-- Отображение списка курсов --%>
    <ul>
        <c:forEach var="course" items="${courses}">
            <li>${course}</li>
        </c:forEach>
    </ul>

    <%-- Форма для добавления нового курса --%>
    <h3>Add New Course</h3>
    <form action="${pageContext.request.contextPath}/courses" method="post">
        <label for="courseName">Course Name:</label>
        <input type="text" id="courseName" name="courseName" required>
        <button type="submit">Add Course</button>
    </form>

</body>
</html>
