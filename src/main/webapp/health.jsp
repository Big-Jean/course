<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Список записей о состоянии здоровья</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
    <div class="container mt-4">
           <h2>Список записей о состоянии здоровья</h2>

           <!-- Вывод списка записей о состоянии здоровья -->
           <table class="table table-bordered">
               <thead>
                   <tr>
                       <th>ID</th>
                       <th>Состояние</th>
                       <th>ID студента</th>
                   </tr>
               </thead>
               <tbody>
                   <c:forEach var="health" items="${healthList}">
                       <tr>
                           <td><a href="${pageContext.request.contextPath}/edit-health?healthId=${health.healthId}">${health.healthId}</a></td>
                           <td>${health.condition}</td>
                           <td>${health.studentId}</td>
                       </tr>
                   </c:forEach>
               </tbody>
           </table>

           <!-- Форма для добавления новой записи о состоянии здоровья -->
           <h3>Добавить новую запись о состоянии здоровья</h3>
           <form action="${pageContext.request.contextPath}/health-list" method="post">
               <div class="form-group">
                   <label for="condition">Состояние:</label>
                   <input type="text" class="form-control" name="condition" required>
               </div>
               <div class="form-group">
                   <label for="studentId">ID студента:</label>
                   <input type="number" class="form-control" name="studentId" required>
               </div>
               <button type="submit" class="btn btn-primary">Добавить</button>
           </form>
       </div>
</body>
</html>
