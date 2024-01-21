<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">Main</a>
    </div>
</nav>
<div class="container">
        <%-- Форма для редактирования курса --%>
        <div class="container mt-4">
        <h2>Course Details</h2>
    <c:if test="${not empty course}">
         <p>Course ID: ${course.courseId}</p>
         <p>Course Name: ${course.courseName}</p>
                <h3>Edit Course</h3>
                <form action="${pageContext.request.contextPath}/courseDetails" method="post">
                    <input type="hidden" name="courseId" value="${course.courseId}">
                    <input type="hidden" name="action" value="update">

                    <div class="form-group">
                        <label for="updatedCourseName">Updated Course Name:</label>
                        <input type="text" class="form-control" id="updatedCourseName" name="courseName" value="${course.courseName}" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Update Course</button>
                </form>
            </div>

      <div class="container mt-4">
              <h3>Delete Course</h3>
              <form action="${pageContext.request.contextPath}/courseDetails" method="post">

                  <input type="hidden" name="courseId" value="${course.courseId}">
                  <input type="hidden" name="action" value="delete">

                  <div class="form-group">
                      <p>Are you sure you want to delete the course "${course.courseName}"?</p>
                  </div>

                  <button type="submit" class="btn btn-danger">Delete Course</button>
              </form>
              <a href="${pageContext.request.contextPath}/courses">Back to Courses List</a>
          </div>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
