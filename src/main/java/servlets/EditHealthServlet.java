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

@WebServlet("/edit-health")
public class EditHealthServlet extends HttpServlet {
    private HealthDAO healthDAO;

    @Override
    public void init() {
        healthDAO = new HealthDAO(new DatabaseService().getConnect());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Логика отображения информации о конкретной записи о состоянии здоровья (по health_id)
        int healthId = Integer.parseInt(request.getParameter("healthId"));
        Health health = healthDAO.getHealthRecordById(healthId);
        request.setAttribute("health", health);
        request.getRequestDispatcher("/healthEdit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int healthId = Integer.parseInt(request.getParameter("healthId"));
            String condition = request.getParameter("condition");

            // Проверка на null или пустую строку перед преобразованием в число
            String studentIdParameter = request.getParameter("studentId");
            int studentId = (studentIdParameter != null && !studentIdParameter.isEmpty()) ? Integer.parseInt(studentIdParameter) : 0;

            Health health = new Health(healthId, condition, studentId);
            healthDAO.updateHealthRecord(health);

            response.sendRedirect(request.getContextPath() + "/health-list");
        } catch (NumberFormatException e) {
            // Обработка исключения, например, отправка сообщения об ошибке
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid studentId format");
        }
    }


    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Логика удаления записи о состоянии здоровья
        int healthId = Integer.parseInt(request.getParameter("healthId"));
        healthDAO.deleteHealthRecord(healthId);

        response.sendRedirect(request.getContextPath() + "/health-list");
    }
}
