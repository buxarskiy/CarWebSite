package uz.pdp.carwebsite.servlets.auth;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.car_aplication.entity.User;
import uz.pdp.car_aplication.repo.RoleRepo;

import java.io.IOException;

import static uz.pdp.car_aplication.config.DBConfig.entityManagerFactory;

@WebServlet(name = "register", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        Integer age = Integer.parseInt(req.getParameter("age"));
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String passwordRepeat = req.getParameter("passwordRepeat");

        if (password == null && !password.equals(passwordRepeat)) {
            resp.sendRedirect("/register");
            return;
        }
        User user = User.builder()
                .firstName(firstName)
                .lastName(lastName)
                .age(age)
                .email(email)
                .password(password)
                .roles(RoleRepo.getSimpleUser())
                .build();

        entityManager.persist(user);
        entityManager.getTransaction().commit();
        resp.sendRedirect("/");
    }
}
