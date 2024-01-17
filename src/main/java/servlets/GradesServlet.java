package servlets;

import models.Grades;
import services.DatabaseService;
import services.GradesDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/grades")
public class GradesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final GradesDAO gradeDAO = new GradesDAO(new DatabaseService().getConnect());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Grades> grades = gradeDAO.getAllGrades();
        request.setAttribute("grades", grades);
        request.getRequestDispatcher("/grades.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int grade = Integer.parseInt(request.getParameter("grade"));
        Grades newGrade = new Grades(studentId, courseId, grade);
        gradeDAO.addGrades(newGrade);

        response.sendRedirect(request.getContextPath() + "/grades");
    }
}
