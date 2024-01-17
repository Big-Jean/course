package services;

import models.Students;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentsDAO {
    private Connection connection;

    public StudentsDAO(Connection connection) {
        this.connection = connection;
    }

    public void addStudent(Students student) {
        try {
            String sql = "INSERT INTO Students (name, age, email) VALUES (?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setString(1, student.getName());
                statement.setInt(2, student.getAge());
                statement.setString(3, student.getEmail());
                statement.executeUpdate();

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int studentId = generatedKeys.getInt(1);
                        System.out.println("Добавлен студент с идентификатором: " + studentId);
                    } else {
                        System.err.println("Не удалось получить идентификатор студента");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Students getStudentById(int studentId) {
        Students student = null;
        try {
            String sql = "SELECT * FROM Students WHERE student_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, studentId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        student = new Students(
                                resultSet.getInt("student_id"),
                                resultSet.getString("name"),
                                resultSet.getInt("age"),
                                resultSet.getString("email")
                        );
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }
    public void updateStudent(Students student) {
        try {
            String sql = "UPDATE Students SET name = ?, age = ?, email = ? WHERE student_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, student.getName());
                statement.setInt(2, student.getAge());
                statement.setString(3, student.getEmail());
                statement.setInt(4, student.getStudentId());
                int rowsUpdated = statement.executeUpdate();

                // Добавим логирование
                System.out.println("Rows updated: " + rowsUpdated);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public void deleteStudent(int studentId) {
        try {
            String sql = "DELETE FROM Students WHERE student_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, studentId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Students> getAllStudents() {
        List<Students> studentsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Students";
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Students student = new Students(
                            resultSet.getInt("student_id"),
                            resultSet.getString("name"),
                            resultSet.getInt("age"),
                            resultSet.getString("email")
                    );
                    studentsList.add(student);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentsList;
    }
}