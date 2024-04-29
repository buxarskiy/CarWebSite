package uz.pdp.carwebsite.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.carwebsite.entity.Role;
import uz.pdp.carwebsite.entity.enums.RoleName;

import java.util.List;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;

public class RoleRepo {
    public static List<Role> getSimpleUser() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        return entityManager.createQuery("select t from Role t where t.name = :roleName", Role.class)
                .setParameter("roleName", RoleName.ROLE_USER).getResultList();
    }

    public static List<Role> findAll() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        return entityManager.createQuery("select t from Role t", Role.class).getResultList();
    }
}
