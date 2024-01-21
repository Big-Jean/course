<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grades List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
     <div class="container mt-4">
            <h2>Grades List</h2>

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
                    <c:forEach var="grade" items="${grades}">
                        <tr>
                            <td><a href="${pageContext.request.contextPath}/gradeDetails?gradeId=${grade.getGradeId()}">${grade.getGradeId()}</a></td>
                            <td>${grade.getStudentId()}</td>
                            <td>${grade.getCourseId()}</td>
                            <td>${grade.grade}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Форма для добавления новой оценки -->
            <h3>Add New Grade</h3>
            <form action="${pageContext.request.contextPath}/grades" method="post">
                <div class="form-group">
                    <label for="studentId">Student ID:</label>
                    <input type="text" class="form-control" name="studentId" required>
                </div>

                <div class="form-group">
                    <label for="courseId">Course ID:</label>
                    <input type="text" class="form-control" name="courseId" required>
                </div>

                <div class="form-group">
                    <label for="grade">Score:</label>
                    <input type="text" class="form-control" name="grade" required>
                </div>

                <button type="submit" class="btn btn-primary">Add Grade</button>
            </form>
        </div>
</body>
</html>
