package servlets;

import java.io.IOException;
import java.util.List;

import models.Grades;
import services.DatabaseService;
import services.GradesDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/gradeDetails")
public class GradeDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final GradesDAO gradeDAO = new GradesDAO(new DatabaseService().getConnect());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int gradeId = Integer.parseInt(request.getParameter("gradeId"));
        Grades grade = gradeDAO.getGradesById(gradeId).get(0);

        if (grade != null) {
            request.setAttribute("grade", grade);
            request.getRequestDispatcher("/gradeDetails.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/grades");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int gradeId = Integer.parseInt(request.getParameter("gradeId"));
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            int newScore = Integer.parseInt(request.getParameter("newScore"));
            Grades updatedGrade = new Grades(gradeId, 0, 0, newScore);
            gradeDAO.updateGrade(updatedGrade);
        } else if ("delete".equals(action)) {
            gradeDAO.deleteGrade(gradeId);
        }

        response.sendRedirect(request.getContextPath() + "/grades");
    }
}
