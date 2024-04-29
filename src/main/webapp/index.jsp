<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory" %>
<%@ page import="uz.pdp.carwebsite.entity.Car" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.carwebsite.entity.User" %>
<%@ page import="uz.pdp.carwebsite.entity.CarDetail" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>BMW</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">

</head>
<body>
<%
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    List<Car> cars = entityManager.createQuery("from Car", Car.class).getResultList();
    User user = (User) session.getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">CarWeb</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register.jsp">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin/admin.jsp">Admin</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row mt-5">
        <%
            for (Car car : cars) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card">
                <img src="/file?id=<%=car.getPhoto().getId()%>" class="card-img-top" height="350">
                <div class="card-body" style="background:#a6b5cc">
                    <h5 class="card-title">Company: <%=car.getCompany().getName()%>
                    </h5>
                    <h6 class="card-title">Type: <%=car.getName()%>
                    </h6>
                    <p class="card-text">Narx: $35,000</p>
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
                    <a href="register.jsp" class="btn btn-primary">purchase</a>
                </div>
            </div>
        </div>
        <% }%>
    </div>
</div>

</body>
</html>