<%@ page import="java.util.ArrayList" %>
<%@ page import="uz.pdp.carwebsite.entity.CarDetail" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/17/2024
  Time: 10:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body style="background: #47e312">
<%
    int carId = Integer.parseInt(request.getParameter("carId"));
    List<CarDetail> carDetails = new ArrayList<>();
    Object object = session.getAttribute("details");
    if (object != null) {
        carDetails = (List<CarDetail>) object;
    }
%>
<%for (CarDetail carDetail : carDetails) {%>
<p>
<h1><%=carDetail.getKey() + ": " + carDetail.getValue()%>
</h1>
</p>
<%}%>

<form action="../admin/add/detail" method="post">
    <div class="d-flex">
        <input type="hidden" name="carId" value="<%=carId%>">
        <input placeholder="Key" name="key" type="text" class="form-control m-3">
        <input placeholder="Value" name="value" type="text" class="form-control m-3">
    </div>
    <button class="btn btn-dark w-100">add</button>
</form>

<hr>
<hr>
<hr>
<form action="/admin/detail" method="post">
    <input type="hidden" value="<%=carId%>" name="carId">
    <button class="btn btn-primary btn-lg w-100">save changes</button>
</form>
</body>
</html>
