package models;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Grades {
    private int gradeId;
    private int studentId;
    private int courseId;
    private int grade;

    public Grades(int studentId, int courseId, int grade) {
        this.studentId = studentId;
        this.courseId = courseId;
        this.grade = grade;
    }
}
