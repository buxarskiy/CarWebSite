<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory" %>
<%@ page import="uz.pdp.carwebsite.entity.Company" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/17/2024
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body style="background: lawngreen">

<%
    Object attachmentId = session.getAttribute("attachmentId");
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    List<Company> companies = entityManager.createQuery("from Company", Company.class).getResultList();


%>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header" style="background: black">
                    <h5 class="card-title text-white">Add Car</h5>
                </div>
                <div class="card-body" style="background: #fd7e14">


                    <form action="../file" method="post" enctype="multipart/form-data">
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
                        <input name="redirection" type="hidden" value="/admin/addCar.jsp">
                        <input name="file" id="photo" class="d-none" type="file">
                    </form>


                    <form action="../admin/car" method="post">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                        </div>
                        <div class="form-group">
                            <label for="company">Company</label>
                            <select name="company" id="company" class="form-control" required>
                                <option value="" selected disabled>Select Company</option>
                                <% for
                                (
                                        Company
                                                company
                                        :
                                        companies
                                ) {%>
                                <option value="<%=company.getId()%>"><%=company
                                        .
                                        getName
                                                (
                                                )%>
                                </option>
                                <%}%>
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
