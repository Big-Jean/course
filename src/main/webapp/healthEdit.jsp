<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование записи о состоянии здоровья</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
     <div class="container mt-4">
            <h2>Редактирование записи о состоянии здоровья</h2>

            <!-- Форма для обновления записи о состоянии здоровья -->
            <form action="${pageContext.request.contextPath}/edit-health" method="post">
                <input type="hidden" name="healthId" value="${health.healthId}">
                <div class="form-group">
                    <label for="condition">Состояние:</label>
                    <input type="text" class="form-control" name="condition" value="${health.condition}" required>
                </div>
                <div class="form-group">
                    <label for="studentId">ID студента:</label>
                    <input type="number" class="form-control" name="studentId" value="${health.studentId}" required>
                </div>
                <button type="submit" class="btn btn-primary">Обновить</button>
            </form>

            <!-- Форма для удаления записи о состоянии здоровья -->
            <form action="${pageContext.request.contextPath}/edit-health" method="post"
                  onsubmit="return confirm('Вы уверены, что хотите удалить запись о состоянии здоровья?')">
                <input type="hidden" name="_method" value="DELETE">
                <input type="hidden" name="healthId" value="${health.healthId}">
                <button type="submit" class="btn btn-danger">Удалить</button>
            </form>

            <a href="${pageContext.request.contextPath}/health-list" class="btn btn-secondary mt-2">Назад к списку записей о состоянии здоровья</a>
        </div>

        <!-- Подключение Bootstrap JS и Popper.js (необходимо для некоторых компонентов Bootstrap) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-XfrwIE8YsQoy5jH8rRB64pLb6l2B/tv5D0v4QdQrGTETaH9sYik8q4ETyJYLlwnr"
                crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyC8i98eZjJ5st6U/mkkcHQ2h8FOM90L"
                crossorigin="anonymous"></script>
</body>
</html>
