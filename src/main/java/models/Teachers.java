package models;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Teachers {
    private int teacherId;
    private String name;
    private String email;

    public Teachers(String name, String email) {
        this.name = name;
        this.email = email;
    }
}
