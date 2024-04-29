package uz.pdp.carwebsite.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import uz.pdp.carwebsite.entity.enums.RoleName;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;
    @Positive
    @Max(70)
    private Integer age;
    @Email
    @NotBlank
    private String email;
    @NotBlank
    private String password;
    @ManyToMany
    private List<Role> roles;
    @OneToOne
    private Attachment profilePhoto;

    public boolean hasRole(RoleName roleName) {
        return roles.stream().anyMatch(item -> item.getName().equals(roleName));
    }
}
