package servlets;

import models.Courses;
import services.CoursesDAO;
import services.DatabaseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/courseDetails")
public class CourseDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CoursesDAO coursesDAO = new CoursesDAO(new DatabaseService().getConnect());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        Courses course = coursesDAO.getCourseById(courseId);

        if (course != null) {
            request.setAttribute("course", course);
            request.getRequestDispatcher("/courseDetails.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/courses");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        String action = request.getParameter("action");


        if ("update".equals(action)) {
            String updatedCourseName = request.getParameter("courseName");
            Courses updatedCourse = new Courses(courseId, updatedCourseName);
            coursesDAO.updateCourse(updatedCourse);
        } else if ("delete".equals(action)) {
            coursesDAO.deleteCourse(courseId);
        }

        response.sendRedirect(request.getContextPath() + "/courses");
    }
}

