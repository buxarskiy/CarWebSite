package uz.pdp.carwebsite.servlets.car;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.carwebsite.entity.Car;
import uz.pdp.carwebsite.entity.CarDetail;

import java.io.IOException;
import java.util.List;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;


@WebServlet(name = "addetail", value = "/admin/detail")
public class AddDetail extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        int carId = Integer.parseInt(req.getParameter("carId"));
        HttpSession session = req.getSession();

        List<CarDetail> details = (List<CarDetail>) session.getAttribute("details");
        Car car = entityManager.find(Car.class, carId);
        car.setCarDetails(details);

        entityManager.getTransaction().commit();
        session.removeAttribute("details");
        resp.sendRedirect("/admin/car.jsp");
    }
}
