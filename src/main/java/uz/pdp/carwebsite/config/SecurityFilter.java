package uz.pdp.carwebsite.config;

import jakarta.persistence.EntityManager;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.carwebsite.entity.User;
import uz.pdp.carwebsite.entity.enums.RoleName;


import java.io.IOException;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;


@WebFilter(urlPatterns = "/admin/*")
public class SecurityFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) servletResponse;
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpSession session = req.getSession();
        Object currentUSerObj = session.getAttribute("currentUser");
        if (currentUSerObj != null) {
            User user = (User) currentUSerObj;
            if (user.hasRole(RoleName.ROLE_SUPPER_ADMIN) || user.hasRole(RoleName.ROLE_ADMIN)) {
                filterChain.doFilter(req, res);
                return;
            }
        }
        for (Cookie cookie : req.getCookies()) {
            if (cookie.getName().equals("userId")) {
                int userId = Integer.parseInt(cookie.getValue());
                EntityManager entityManager = entityManagerFactory.createEntityManager();
                User user = entityManager.find(User.class, userId);
                if (user != null) {
                    session.setAttribute("currentUser", user);
                    if (user.hasRole(RoleName.ROLE_SUPPER_ADMIN) || user.hasRole(RoleName.ROLE_ADMIN)) {
                        filterChain.doFilter(req, res);
                        return;
                    }
                    break;
                }

            }
        }
        res.sendRedirect("/404");
    }
}

