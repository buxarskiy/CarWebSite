package uz.pdp.carwebsite.servlets.user;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.carwebsite.entity.Role;
import uz.pdp.carwebsite.entity.User;
import uz.pdp.carwebsite.repo.UserRepo;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;


@WebServlet(name = "editUser", value = "/edit/user")
public class EditUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        int id = Integer.parseInt(req.getParameter("id"));
        int age = Integer.parseInt(req.getParameter("age"));
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String[] roleIds = req.getParameterValues("roleId");
        User user1 = UserRepo.findById(id);

        List<Role> roles = new ArrayList<>();

        for (String roleId : roleIds) {
            Role role = entityManager.find(Role.class, roleId);
            System.out.println(role);
            roles.add(role);
        }
        User user = User.builder()
                .id(user1.getId())
                .firstName(firstName)
                .lastName(lastName)
                .age(age)
                .email(user1.getEmail())
                .password(user1.getPassword())
                .roles(roles)
                .build();

        UserRepo.edit(user);
        resp.sendRedirect("/supperadmin/user.jsp");

    }
}
