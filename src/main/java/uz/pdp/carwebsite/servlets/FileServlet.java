package uz.pdp.carwebsite.servlets;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import uz.pdp.carwebsite.entity.Attachment;
import uz.pdp.carwebsite.entity.AttachmentContent;


import java.io.IOException;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;


@MultipartConfig
@WebServlet(name = "file", value = "/file")
public class FileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int attachmentId = Integer.parseInt(req.getParameter("id"));
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        AttachmentContent attachmentContent = entityManager.createQuery("select t from AttachmentContent t where t.attachment.id = :id", AttachmentContent.class).setParameter("id", attachmentId).getSingleResult();
        resp.getOutputStream().write(attachmentContent.getContent());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Part part = req.getPart("file");
        String submittedFileName = part.getSubmittedFileName();
        String contentType = submittedFileName.substring(submittedFileName.indexOf("."));
        Attachment attachment = Attachment.builder().contentType(contentType).build();
        AttachmentContent attachmentContent = AttachmentContent.builder()
                .attachment(attachment)
                .content(part.getInputStream().readAllBytes())
                .build();
        entityManager.persist(attachmentContent);
        req.getSession().setAttribute("attachmentId", attachmentContent.getAttachment().getId());
        entityManager.getTransaction().commit();
        resp.sendRedirect(req.getParameter("redirection"));

    }
}
