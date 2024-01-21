package models;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Health {
    private int healthId;
    private String condition;
    private int studentId;

    public Health(String condition, int studentId) {
        this.studentId = studentId;
        this.condition = condition;
    }
}
