<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory" %>
<%@ page import="uz.pdp.carwebsite.entity.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.carwebsite.entity.User" %>
<%@ page import="uz.pdp.carwebsite.entity.CarDetail" %>
Created by IntelliJ IDEA.
User: user
Date: 4/17/2024
Time: 2:49 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body>
<%
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    List<Car> cars = entityManager.createQuery("from Car", Car.class).getResultList();
    User user = (User) session.getAttribute("currentUser");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Car</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="../index.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../admin/admin.jsp">Back</a>
            </li>
        </ul>
        <div class="col-2 offset-9">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="addCar.jsp">add car</a></li>
            </ul>
        </div>
    </div>
</nav>
<div>
    <hr>
    <div>
        <table class="table table-success mx-2">
            <thead>
            <tr>
                <th>Photo</th>
                <th>Name</th>
                <th>Company</th>
                <th>Details</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%for (Car car : cars) {%>
            <tr>
                <td><img src="/file?id=<%=car.getPhoto().getId()%>" width="120" alt=""></td>
                <td><%=car.getName()%>
                </td>
                <td><%=car.getCompany().getName()%>
                </td>
                <td>
                    <ul>
                        <%
                            if (!car.getCarDetails().isEmpty()) {
                                for (CarDetail carDetail : car.getCarDetails()) {%>
                        <li><%=carDetail.getKey() + ": " + carDetail.getValue()%>
                        </li>
                        <%
                            }
                        } else {
                        %>
                        No details
                        <%
                            }
                        %>
                    </ul>
                </td>
                <td>
                    <a href="../admin/addDetail.jsp?carId=<%=car.getId()%>" class="btn btn-dark">add details</a>
                    <a href="../admin/editCar.jsp?carId=<%=car.getId()%>" class="btn btn-dark">edit</a>
                    <a href="http://localhost:8080/delete/car?carId=<%=car.getId()%>" class="btn btn-dark">delete</a>
                </td>
            </tr>
            <%} %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
