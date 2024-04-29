package uz.pdp.carwebsite.servlets.car;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.carwebsite.entity.CarDetail;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "generateDetail", value = "/admin/add/detail")
public class GenerateDetailsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("key");
        String value = req.getParameter("value");
        int carId = Integer.parseInt(req.getParameter("carId"));
        CarDetail carDetail = CarDetail.builder()
                .key(key)
                .value(value)
                .build();
        List<CarDetail> carDetails = new ArrayList<>();
        HttpSession session = req.getSession();
        Object object = session.getAttribute("details");
        if (object != null) {
            carDetails = (List<CarDetail>) object;
        }
        carDetails.add(carDetail);
        session.setAttribute("details", carDetails);
        resp.sendRedirect("/admin/addDetail.jsp?carId=" + carId);
    }
}
