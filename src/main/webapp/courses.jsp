<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses List</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
    <div class="container mt-4">
           <h2>Courses List</h2>

           <!-- Отображение списка курсов -->
           <ul class="list-group">
               <c:forEach var="course" items="${courses}">
                   <li class="list-group-item"><a href="${pageContext.request.contextPath}/courseDetails?courseId=${course.getCourseId()}">${course.getCourseId()} | ${course.getCourseName()}</a></li>
               </c:forEach>
           </ul>

           <!-- Форма для добавления нового курса -->
           <h3>Add New Course</h3>
           <form action="${pageContext.request.contextPath}/courses" method="post">

               <div class="form-group">
                   <label for="courseName">Course Name:</label>
                   <input type="text" class="form-control" id="courseName" name="courseName" required>
               </div>

               <button type="submit" class="btn btn-primary">Add Course</button>
           </form>
       </div>

</body>
</html>
