package uz.pdp.carwebsite.servlets.car;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.carwebsite.repo.CarRepo;

import java.io.IOException;

@WebServlet(name = "deleteCar", value = "/delete/car")
public class DeleteCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int carId = Integer.parseInt(req.getParameter("carId"));
        CarRepo.deleteById(carId);
        resp.sendRedirect("/admin/car.jsp");
    }
}
