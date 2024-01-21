package services;

import models.Health;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HealthDAO {
    private final Connection connection;

    public HealthDAO(Connection connection) {
        this.connection = connection;
    }

    public void addHealthRecord(Health health) {
        try {
            String sql = "INSERT INTO Health (condition, student_id) VALUES (?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                statement.setString(1, health.getCondition());
                statement.setInt(2, health.getStudentId());
                statement.executeUpdate();

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int healthId = generatedKeys.getInt(1);
                        System.out.println("Добавлено запись о состоянии здоровья с идентификатором: " + healthId);
                    } else {
                        System.err.println("Не удалось получить идентификатор записи о состоянии здоровья");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Health getHealthRecordById(int healthId) {
        Health health = null;
        try {
            String sql = "SELECT * FROM Health WHERE health_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, healthId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        health = new Health(
                                resultSet.getInt("health_id"),
                                resultSet.getString("condition"),
                                resultSet.getInt("student_id")
                        );
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return health;
    }

    public void updateHealthRecord(Health health) {
        try {
            String sql = "UPDATE Health SET condition = ? WHERE health_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, health.getCondition());
                statement.setInt(2, health.getHealthId());
                int rowsUpdated = statement.executeUpdate();

                // Добавим логирование
                System.out.println("Rows updated: " + rowsUpdated);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteHealthRecord(int healthId) {
        try {
            String sql = "DELETE FROM Health WHERE health_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, healthId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Health> getAllHealthRecords() {
        List<Health> healthList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Health";
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Health health = new Health(
                            resultSet.getInt("health_id"),
                            resultSet.getString("condition"),
                            resultSet.getInt("student_id")
                    );
                    healthList.add(health);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return healthList;
    }
}
