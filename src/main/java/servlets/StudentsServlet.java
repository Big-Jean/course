package servlets;

import models.Students;
import services.DatabaseService;
import services.StudentsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/students")
public class StudentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final StudentsDAO studentsDAO = new StudentsDAO(new DatabaseService().getConnect());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Students> students = studentsDAO.getAllStudents();
        request.setAttribute("students", students);
        request.getRequestDispatcher("/students.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            String studentName = request.getParameter("studentName");
            String studentEmail = request.getParameter("studentEmail");

            int studentAge;
            try {
                studentAge = Integer.parseInt(request.getParameter("studentAge"));
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
            Students newStudent = new Students(studentName, studentAge, studentEmail);
            studentsDAO.addStudent(newStudent);


            response.sendRedirect(request.getContextPath() + "/students");
        }
    }
}