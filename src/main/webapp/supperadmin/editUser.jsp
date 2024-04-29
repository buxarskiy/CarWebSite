
<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="java.util.List" %>
<%@ page import="static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory" %>
<%@ page import="uz.pdp.carwebsite.entity.User" %>
<%@ page import="uz.pdp.carwebsite.entity.Role" %>
<%@ page import="uz.pdp.carwebsite.repo.RoleRepo" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/18/2024
  Time: 8:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../static/bootstrap.min.css">
</head>
<body style="background: #0d6efd">
<%
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    int userId = Integer.parseInt(request.getParameter("userId"));
    User user = entityManager.find(User.class, userId);
    List<Role> roles = RoleRepo.findAll();
%>

<div class="row mt-5">
    <div class="col-3 offset-4">
        <div style="background: #47e312" class="card p-2">
            <h1 class="text-white">Edit product</h1>
            <form action="http://localhost:8080/edit/user" method="post">
                <input type="hidden" name="id" value="<%=user.getId()%>">
                <h4 class="text-white">Roles</h4>
                <select name="roleId" class="form-control" multiple aria-label="Select User Roles">
                    <% for (Role role : roles) { %>
                    <% boolean isSelected = user.getRoles().contains(role); %>
                    <option value="<%=role.getId()%>"
                            <% if (isSelected) { %>selected<% } %>><%=role.getName()%>
                    </option>
                    <% } %>
                </select>
                <input class="form-control my-3" type="number" name="age" value="<%=user.getAge()%>">
                <input class="form-control my-3" type="text" name="firstName" value="<%=user.getFirstName()%>">
                <input class="form-control my-3" type="text" name="lastName" value="<%=user.getLastName()%>">
                <div class="text-center">
                    <button style="background: red" class="btn btn-dark btn-lg w-100">edit</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
