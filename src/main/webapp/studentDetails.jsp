<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
    <div class="container mt-4">
            <h2>Student Details</h2>

            <!-- Вывод информации о студенте -->
            <c:if test="${not empty student}">
                <div class="card">
                    <div class="card-body">
                        <p class="card-text">ID: ${student.getStudentId()}</p>
                        <p class="card-text">Name: ${student.getName()}</p>
                        <p class="card-text">Age: ${student.getAge()}</p>
                        <p class="card-text">Email: ${student.getEmail()}</p>
                    </div>
                </div>
            </c:if>

            <h3 class="mt-3">Edit Student</h3>
            <!-- Форма для обновления информации о студенте -->
            <form action="${pageContext.request.contextPath}/studentDetails" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="studentId" value="${student.getStudentId()}">
                <div class="form-group">
                    <label for="updatedStudentName">Name:</label>
                    <input type="text" class="form-control" name="updatedStudentName" value="${student.name}" required>
                </div>
                <div class="form-group">
                    <label for="updatedStudentAge">Age:</label>
                    <input type="text" class="form-control" name="updatedStudentAge" value="${student.age}" required>
                </div>
                <div class="form-group">
                    <label for="updatedStudentEmail">Email:</label>
                    <input type="text" class="form-control" name="updatedStudentEmail" value="${student.email}" required>
                </div>
                <button type="submit" class="btn btn-primary">Update Student</button>
            </form>

            <h3 class="mt-3">Delete Student</h3>
            <!-- Форма для удаления студента -->
            <form action="${pageContext.request.contextPath}/studentDetails" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="studentId" value="${student.getStudentId()}">
                <button type="submit" class="btn btn-danger">Delete Student</button>
            </form>

            <a href="${pageContext.request.contextPath}/students" class="btn btn-secondary mt-3">Back to Students List</a>
        </div>
</body>
</html>
