<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Список преподавателей</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
    <div class="container mt-4">
            <h2>Teachers List</h2>

            <!-- Вывод списка преподавателей -->
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="teacher" items="${teachersList}">
                        <tr>
                            <td><a href="${pageContext.request.contextPath}/edit-teacher?teacherId=${teacher.teacherId}">${teacher.teacherId}</a></td>
                            <td>${teacher.name}</td>
                            <td>${teacher.email}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <h3 class="mt-3">Add New Teacher</h3>
            <!-- Форма для добавления нового преподавателя -->
            <form action="${pageContext.request.contextPath}/teachers-list" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" name="email" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Teacher</button>
            </form>
        </div>
    </form>
</body>
</html>
