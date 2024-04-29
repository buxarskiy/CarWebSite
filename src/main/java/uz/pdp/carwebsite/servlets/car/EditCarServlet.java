package uz.pdp.carwebsite.servlets.car;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.carwebsite.entity.Attachment;
import uz.pdp.carwebsite.entity.Car;
import uz.pdp.carwebsite.entity.Company;


import java.io.IOException;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;


@WebServlet(name = "editCar", value = "/admin/edit/car")
public class EditCarServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();

        int carId = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        Integer companyId = Integer.parseInt(req.getParameter("companyId"));
        Company company = entityManager.find(Company.class, companyId);
        HttpSession session = req.getSession();
        Integer attachmentId = (Integer) session.getAttribute("attachmentId");
        Attachment attachment = entityManager.find(Attachment.class, attachmentId);

        Car car = Car.builder()
                .name(name)
                .company(company)
                .photo(attachment)
                .build();
        edit(car, carId);
        entityManager.getTransaction().commit();
        session.removeAttribute("attachmentId");
        resp.sendRedirect("/admin/car.jsp");
    }

    private void edit(Car car, int carId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Car newCar = entityManager.createQuery("select t from Car t where t.id =:id", Car.class)
                .setParameter("id", carId).getSingleResult();
        newCar.setName(car.getName());
        newCar.setCompany(car.getCompany());
        newCar.setPhoto(car.getPhoto());
        entityManager.getTransaction().commit();
    }
}
