<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="uz.pdp.carwebsite.entity.Car" %>
<%@ page import="static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory" %>
<%@ page import="uz.pdp.carwebsite.entity.Company" %>
<%@ page import="java.util.List" %>
Created by IntelliJ IDEA.
  User: user
  Date: 4/18/2024
  Time: 3:52 AM
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
    int carId = Integer.parseInt(request.getParameter("carId"));
    Car car = entityManager.createQuery("select t from Car t where t.id =:id", Car.class).setParameter("id", carId).getSingleResult();

    Object attachmentId = session.getAttribute("attachmentId");
    List<Company> companies = entityManager.createQuery("from Company", Company.class).getResultList();
%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body" style="background: #fd7e14">
                    <form action="/file" method="post" enctype="multipart/form-data">
                        <label for="photo">
                            <%
                                if (attachmentId == null) {%>
                            <img
                                    src="https://s.yimg.com/uu/api/res/1.2/orM1KMpndK00_EugdDCtyg--~B/aD0yMjU7dz00MDA7YXBwaWQ9eXRhY2h5b24-/http://magazines.zenfs.com/diminuendo/1.0/original/f159e376a7ad308afca22af609ba4b9946dbc1ce.gif"
                                    alt="" width="300">
                            <img class="mx-5" width="50"
                                 src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWTJaSthXTSxa6Zhl2WoZaXsuYrK4Ldkdjc4VWRH1duulwDXPI5vtIulZaHfoABB6XDeM&usqp=CAU">
                            <button>upload</button>
                            <%} else {%>
                            <img src="/file?id=<%=attachmentId%>" class="mx-2" width="250">
                            <img src="https://i.pinimg.com/originals/59/4f/99/594f996dc101f387cbbdb83255637d2a.gif"
                                 width="250" style="border-radius: 80px" class="mx-3"
                                 alt="">
                            <button>upload</button>
                            <%}%>
                        </label>
                        <input name="redirection" type="hidden" value="/admin/editCar.jsp">
                        <input name="file" id="photo" class="d-none" type="file">
                    </form>
                    <form action="../admin/edit/car" method="post">
                        <div class="form-group">
                            <input name="id" type="hidden" value="<%=car.getId()%>">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" value="<%=car.getName()%>" name="name"
                                   placeholder="Name" required>
                        </div>
                        <div class="form-group">
                            <label for="company">Company</label>
                            <select name="companyId" id="company" class="form-control" required>
                                <option value="" selected disabled>Select Company</option>
                                <% for (Company company : companies) {
                                    if (car.getId().equals(company.getId())) {%>
                                <option value="<%=company.getId()%>" selected><%=company.getName()%>
                                </option>
                                <%} else {%>
                                <option value="<%=company.getId()%>"><%=company.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-dark my-2 btn-lg w-100">Add Car</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
