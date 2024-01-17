package services;

import models.Grades;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GradesDAO {
    private final Connection connection;

    public GradesDAO(Connection connection) {

        this.connection = connection;
    }

    public void addGrades(Grades grades) {
        try {
            String sql = "INSERT INTO Grades (student_id, course_id, grade) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, grades.getStudentId());
                statement.setInt(2, grades.getCourseId());
                statement.setInt(3, grades.getGrade());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Grades> getGradesById(int gradeId) {
        List<Grades> grades = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Grades WHERE grade_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, gradeId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        grades.add(new Grades(
                                resultSet.getInt("grade_id"),
                                resultSet.getInt("student_id"),
                                resultSet.getInt("course_id"),
                                resultSet.getInt("grade")
                        ));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return grades;
    }

    public void updateGrade(Grades grade) {
        try {
            String sql = "UPDATE Grades SET grade = ? WHERE grade_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, grade.getGrade());
                statement.setInt(2, grade.getGradeId());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteGrade(int gradeId) {
        try {
            String sql = "DELETE FROM Grades WHERE grade_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, gradeId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Grades> getAllGrades() {
        List<Grades> grades = new ArrayList<>();

        try {
            String query = "SELECT * FROM grades";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                 ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    int id = resultSet.getInt("grade_id");
                    int studentId = resultSet.getInt("student_id");
                    int courseId = resultSet.getInt("course_id");
                    int score = resultSet.getInt("grade");

                    Grades grade = new Grades(id, studentId, courseId, score);
                    grades.add(grade);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return grades;
    }
}
