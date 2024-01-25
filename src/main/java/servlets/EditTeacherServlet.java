package servlets;

import services.DatabaseService;
import services.TeachersDAO;
import models.Teachers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/edit-teacher")
public class EditTeacherServlet extends HttpServlet {
    private TeachersDAO teachersDAO;

    @Override
    public void init() {
        teachersDAO = new TeachersDAO(new DatabaseService().getConnect());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Логика отображения информации о конкретном преподавателе (по teacher_id)
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        Teachers teacher = teachersDAO.getTeacherById(teacherId);
        request.setAttribute("teacher", teacher);
        request.getRequestDispatcher("/editTeacher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String method = request.getParameter("_method");
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        if(method.equals("DELETE")){
            teachersDAO.deleteTeacher(teacherId);
        } else {

            String name = request.getParameter("name");
            String email = request.getParameter("email");

            Teachers teacher = new Teachers(teacherId, name, email);
            teachersDAO.updateTeacher(teacher);
        }
        response.sendRedirect(request.getContextPath() + "/teachers-list");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Логика удаления преподавателя
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        teachersDAO.deleteTeacher(teacherId);

        response.sendRedirect(request.getContextPath() + "/teachers-list");
    }
}
