package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class DatabaseService {
    public Connection getConnect() {
        try {
            Class.forName("org.postgresql.Driver");
            final String url = "jdbc:postgresql://217.107.219.154:49307/bonch_2105549";
            final String user = "bonch_2105549";
            final String password = "zsDJK5EShOo=";
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Failed to connect to the database", e);
        }
    }


    public boolean update(String sql) {
        boolean isSuccessful = false;
        try (Connection connection = getConnect();
             Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
            isSuccessful = true;
        } catch (SQLException e) {
            System.out.println("Error executing SQL: " + sql);
            e.printStackTrace();

        }
        return isSuccessful;
    }
}
