package servlets;

import models.Teachers;
import services.DatabaseService;
import services.TeachersDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/teachers-list")
public class TeacherServlet extends HttpServlet {
    private TeachersDAO teachersDAO;

    @Override
    public void init() {
        teachersDAO =  new TeachersDAO(new DatabaseService().getConnect());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teachers> teachersList = teachersDAO.getAllTeachers();
        request.setAttribute("teachersList", teachersList);
        request.getRequestDispatcher("/teachers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        Teachers teacher = new Teachers(name, email);
        teachersDAO.addTeacher(teacher);

        response.sendRedirect(request.getContextPath() + "/teachers-list");
    }
}
