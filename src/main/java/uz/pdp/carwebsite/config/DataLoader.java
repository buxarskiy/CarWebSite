package uz.pdp.carwebsite.config;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import uz.pdp.carwebsite.entity.Company;
import uz.pdp.carwebsite.entity.Role;
import uz.pdp.carwebsite.entity.User;
import uz.pdp.carwebsite.entity.enums.RoleName;


import java.util.ArrayList;
import java.util.List;

import static uz.pdp.carwebsite.config.DBConfig.entityManager;
import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;


@WebListener
public class DataLoader implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        entityManagerFactory = Persistence.createEntityManagerFactory("CarWebSite");
        entityManager = entityManagerFactory.createEntityManager();
//        initData();
        ServletContextListener.super.contextInitialized(sce);
    }

    private void initData() {
        List<Role> roles = new ArrayList<>();
        entityManager.getTransaction().begin();
        for (RoleName roleName : RoleName.values()) {
            Role role = Role.builder()
                    .name(roleName)
                    .build();
            entityManager.persist(role);
            roles.add(role);
        }
        Company company1 = Company.builder()
                .name("BMW")
                .build();
        Company company2 = Company.builder()
                .name("MERC")
                .build();
        Company company3 = Company.builder()
                .name("AUDI")
                .build();
        Company company4 = Company.builder()
                .name("LEXUS")
                .build();
        Company company5 = Company.builder()
                .name("CHEVROLET")
                .build();
        entityManager.persist(company1);
        entityManager.persist(company2);
        entityManager.persist(company3);
        entityManager.persist(company4);
        entityManager.persist(company5);

        User user = User.builder()
                .firstName("Jahongir")
                .lastName("Ibragimov")
                .age(18)
                .email("a@gmail.com")
                .password("1")
                .roles(roles)
                .build();
        entityManager.persist(user);
        entityManager.getTransaction().commit();

    }
}
