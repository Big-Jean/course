package services;

import models.Teachers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeachersDAO {
    private final Connection connection;

    public TeachersDAO(Connection connection) {
        this.connection = connection;
    }

    public void addTeacher(Teachers teacher) {
        try {
            String sql = "INSERT INTO Teachers (name, email) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setString(1, teacher.getName());
                statement.setString(2, teacher.getEmail());
                statement.executeUpdate();

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int teacherId = generatedKeys.getInt(1);
                        System.out.println("Добавлен преподаватель с идентификатором: " + teacherId);
                    } else {
                        System.err.println("Не удалось получить идентификатор преподавателя");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Teachers getTeacherById(int teacherId) {
        Teachers teacher = null;
        try {
            String sql = "SELECT * FROM Teachers WHERE teacher_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, teacherId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        teacher = new Teachers(
                                resultSet.getInt("teacher_id"),
                                resultSet.getString("name"),
                                resultSet.getString("email")
                        );
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacher;
    }

    public void updateTeacher(Teachers teacher) {
        try {
            String sql = "UPDATE Teachers SET name = ?, email = ? WHERE teacher_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, teacher.getName());
                statement.setString(2, teacher.getEmail());
                statement.setInt(3, teacher.getTeacherId());
                int rowsUpdated = statement.executeUpdate();
                System.out.println("Rows updated: " + rowsUpdated);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteTeacher(int teacherId) {
        try {
            String sql = "DELETE FROM Teachers WHERE teacher_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, teacherId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Teachers> getAllTeachers() {
        List<Teachers> teachersList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Teachers";
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Teachers teacher = new Teachers(
                            resultSet.getInt("teacher_id"),
                            resultSet.getString("name"),
                            resultSet.getString("email")
                    );
                    teachersList.add(teacher);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachersList;
    }
}
