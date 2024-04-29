package uz.pdp.carwebsite.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.carwebsite.entity.User;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;

public class UserRepo {
    public static User findByEmailAndPassword(String email, String password) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        User user = entityManager.createQuery("select t from User t where t.email = :email", User.class)
                .setParameter("email", email).getSingleResult();

        if (user != null) {
            if (user.getPassword().equals(password)) {
                return user;
            }
        }
        throw new RuntimeException("Error");
    }


    public static void edit(User user) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(user);
        entityManager.getTransaction().commit();
    }

    public static void removeById(int userId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        User user = entityManager.find(User.class, userId);
        entityManager.remove(user);
        entityManager.getTransaction().commit();

    }

    public static User findById(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        return entityManager.find(User.class, id);
    }
}
