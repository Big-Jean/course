package services;

import models.Courses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CoursesDAO {
    private Connection connection;

    public CoursesDAO(Connection connection) {
        this.connection = connection;
    }

    public void addCourse(Courses course) {
        try {
            String sql = "INSERT INTO courses (course_name) VALUES (?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, course.getCourseName());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Courses getCourseById(int courseId) {
        try {
            String sql = "SELECT * FROM courses WHERE course_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, courseId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        return new Courses(
                                resultSet.getInt("course_id"),
                                resultSet.getString("course_name")
                        );
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Courses> getAllCourses() {
        List<Courses> coursesList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Courses";
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Courses course = new Courses(
                            resultSet.getInt("course_id"),
                            resultSet.getString("course_name")
                    );
                    coursesList.add(course);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coursesList;
    }

    public void updateCourse(Courses course) {
        try {
            String sql = "UPDATE courses SET course_name = ? WHERE course_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, course.getCourseName());
                statement.setInt(2, course.getCourseId());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCourse(int courseId) {
        try {
            String sql = "DELETE FROM courses WHERE course_id = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, courseId);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
