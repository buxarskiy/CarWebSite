package uz.pdp.carwebsite.servlets.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.carwebsite.repo.UserRepo;

import java.io.IOException;

@WebServlet(name = "deleteUser", value = "/delete/user")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userId"));
        UserRepo.removeById(userId);
        resp.sendRedirect("/supperadmin/user.jsp");
    }
}
