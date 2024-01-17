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

@WebServlet("/studentDetails")
public class StudentDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final StudentsDAO studentsDAO = new StudentsDAO(new DatabaseService().getConnect());

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        Students student = studentsDAO.getStudentById(studentId);

        if (student != null) {
            request.setAttribute("student", student);
            request.getRequestDispatcher("/studentDetails.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/students");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            String studentName = request.getParameter("updatedStudentName");
            String studentEmail = request.getParameter("updatedStudentEmail");
            int studentAge;
            System.out.println(studentName);
            try {
                studentAge = Integer.parseInt(request.getParameter("updatedStudentAge"));
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
            int id = Integer.parseInt(request.getParameter("studentId"));
            Students newStudent = new Students(studentName, studentAge, studentEmail);
            newStudent.setStudentId(id);
            studentsDAO.updateStudent(newStudent);
            System.out.println(newStudent.getName());
            response.sendRedirect(request.getContextPath() + "/students");
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("studentId"));
            studentsDAO.deleteStudent(id);
            response.sendRedirect(request.getContextPath() + "/students");
        }
    }
}
