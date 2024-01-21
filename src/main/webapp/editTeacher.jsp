<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактирование преподавателя</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
   <div class="container mt-4">
          <h2>Редактирование преподавателя</h2>

          <!-- Форма для редактирования преподавателя -->
          <form action="${pageContext.request.contextPath}/edit-teacher" method="post">

              <input type="hidden" name="teacherId" value="${teacher.teacherId}">

              <div class="form-group">
                  <label for="name">Имя:</label>
                  <input type="text" class="form-control" name="name" value="${teacher.name}" required>
              </div>

              <div class="form-group">
                  <label for="email">Email:</label>
                  <input type="email" class="form-control" name="email" value="${teacher.email}" required>
              </div>

              <button type="submit" class="btn btn-primary">Обновить</button>
          </form>

          <!-- Форма для удаления преподавателя -->
          <form action="${pageContext.request.contextPath}/edit-teacher" method="post" onsubmit="return confirm('Вы уверены, что хотите удалить преподавателя?')">

              <input type="hidden" name="_method" value="DELETE">
              <input type="hidden" name="teacherId" value="${teacher.teacherId}">

              <button type="submit" class="btn btn-danger">Удалить</button>
          </form>

          <a href="${pageContext.request.contextPath}/teachers-list" class="btn btn-secondary mt-2">Назад к списку преподавателей</a>
      </div>
</body>
</html>
