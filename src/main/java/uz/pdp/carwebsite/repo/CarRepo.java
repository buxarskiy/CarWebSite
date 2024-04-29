package uz.pdp.carwebsite.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.carwebsite.entity.Car;

import static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory;

public class CarRepo {
    public static void deleteById(int carId) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Car car = entityManager.find(Car.class, carId);
        entityManager.remove(car);
        entityManager.getTransaction().commit();
    }
}
