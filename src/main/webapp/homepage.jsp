<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dropdown меню</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
        </div>
    </nav>

    <div class="container">
        <div class="row mt-5">
            <h3>Welcome!</h3>
            <ul class="list-group">
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/courses">Courses</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/grades">Grades</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/students">Students</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/health-list">Health</a></li>
                <li class="list-group-item"><a href="${pageContext.request.contextPath}/teachers-list">Teachers</a></li>
            </ul>
        </div>
    </div>
</body>
</html>
