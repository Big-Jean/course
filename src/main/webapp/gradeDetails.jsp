<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grade Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
    <div class="container mt-4">
            <h2>Grade Details</h2>

            <!-- Вывод списка оценок -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Student ID</th>
                        <th>Course ID</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${grade.getGradeId()}</td>
                        <td>${grade.getStudentId()}</td>
                        <td>${grade.getCourseId()}</td>
                        <td>${grade.grade}</td>
                    </tr>
                </tbody>
            </table>

            <!-- Форма для обновления оценки -->
            <h3>Update Grade</h3>
            <form action="${pageContext.request.contextPath}/gradeDetails" method="post">
                <input type="hidden" name="gradeId" value="${grade.gradeId}">
                <input type="hidden" name="action" value="update">

                <div class="form-group">
                    <label for="newScore">New Score:</label>
                    <input type="text" class="form-control" name="newScore" required>
                </div>

                <button type="submit" class="btn btn-primary">Update Grade</button>
            </form>

            <!-- Форма для удаления оценки -->
            <h3>Delete Grade</h3>
            <form action="${pageContext.request.contextPath}/gradeDetails" method="post">
                <input type="hidden" name="gradeId" value="${grade.gradeId}">
                <input type="hidden" name="action" value="delete">

                <button type="submit" class="btn btn-danger">Delete Grade</button>
            </form>

            <a href="${pageContext.request.contextPath}/grades" class="btn btn-secondary mt-2">Back to Grades List</a>
        </div>
</body>
</html>
