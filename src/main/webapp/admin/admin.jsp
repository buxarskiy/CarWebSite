<%@ page import="uz.pdp.carwebsite.entity.User" %>
<%@ page import="uz.pdp.carwebsite.entity.enums.RoleName" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body style="background:#25cff2">
<%
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
                <a class="nav-link" href="../index.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="car.jsp">Car</a>
            </li>
            <%
                if (user.hasRole(RoleName.ROLE_SUPPER_ADMIN)) {
            %>
            <li class="nav-item">
                <a class="nav-link" href="../supperadmin/user.jsp">User</a>
            </li>
            <%}%>
        </ul>
    </div>
</nav>
</body>
</html>
