package servlets;

import services.DatabaseService;
import services.HealthDAO;
import models.Health;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/health-list")
public class HealthServlet extends HttpServlet {
    private HealthDAO healthDAO;

    @Override
    public void init() {
        healthDAO = new HealthDAO(new DatabaseService().getConnect());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Health> healthList = healthDAO.getAllHealthRecords();
        request.setAttribute("healthList", healthList);
        request.getRequestDispatcher("/health.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String condition = request.getParameter("condition");
        int studentId = Integer.parseInt(request.getParameter("studentId"));

        Health health = new Health(condition, studentId);
        healthDAO.addHealthRecord(health);

        response.sendRedirect(request.getContextPath() + "/health-list");
    }
}
