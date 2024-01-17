package models;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Students {
    private int studentId;
    private String name;
    private int age;
    private String email;

    public Students(String name, int age, String email) {
        this.name = name;
        this.age = age;
        this.email = email;
    }
}
