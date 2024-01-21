<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Students List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
     <div class="container mt-4">
            <h2>Students List</h2>

            <!-- Вывод списка студентов -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td><a href="studentDetails?studentId=${student.getStudentId()}" class="btn btn-link">${student.getStudentId()}</a></td>
                            <td>${student.getName()}</td>
                            <td>${student.getAge()}</td>
                            <td>${student.getEmail()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h3 class="mt-3">Add New Student</h3>
            <!-- Форма для создания нового студента -->
            <form action="${pageContext.request.contextPath}/students" method="post">
                <input type="hidden" name="action" value="create">
                <div class="form-group">
                    <label for="studentName">Name:</label>
                    <input type="text" class="form-control" name="studentName" required>
                </div>
                <div class="form-group">
                    <label for="studentAge">Age:</label>
                    <input type="text" class="form-control" name="studentAge" required>
                </div>
                <div class="form-group">
                    <label for="studentEmail">Email:</label>
                    <input type="text" class="form-control" name="studentEmail" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Student</button>
            </form>
        </div>
</body>
</html>
