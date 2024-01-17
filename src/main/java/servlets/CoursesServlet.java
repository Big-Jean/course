package servlets;
import models.Courses;

import java.io.IOException;
import java.util.List;
import services.CoursesDAO;
import services.DatabaseService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/courses")
public class CoursesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CoursesDAO coursesDAO = new CoursesDAO(new DatabaseService().getConnect());


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Courses> courses = coursesDAO.getAllCourses();
                request.setAttribute("courses", courses);
        request.getRequestDispatcher("/courses.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String courseName = request.getParameter("courseName");
        Courses newCourse = new Courses(0, courseName);
        coursesDAO.addCourse(newCourse);
        response.sendRedirect(request.getContextPath() + "/courses");
        }
}
