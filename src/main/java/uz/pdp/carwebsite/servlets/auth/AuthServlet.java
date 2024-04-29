package uz.pdp.carwebsite.servlets.auth;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.carwebsite.entity.User;
import uz.pdp.carwebsite.entity.enums.RoleName;
import uz.pdp.carwebsite.repo.UserRepo;

import java.io.IOException;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;


@WebServlet(name = "auth", value = "/auth/login")
public class AuthServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User user = UserRepo.findByEmailAndPassword(email, password);
        req.getSession().setAttribute("currentUser", user);
        Cookie cookie = new Cookie(
                "userId", user.getId().toString()
        );
        cookie.setSecure(false);
        cookie.setMaxAge(60 * 60 * 3);
        cookie.setPath("/");
        resp.addCookie(cookie);
        if (user.hasRole(RoleName.ROLE_SUPPER_ADMIN) || user.hasRole(RoleName.ROLE_ADMIN)) {
            resp.sendRedirect("/admin/admin.jsp");
        } else {
            resp.sendRedirect("/");
        }
        entityManager.getTransaction().commit();
    }
}
