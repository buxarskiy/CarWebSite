
<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="static uz.pdp.carwebsite.config.DBConfig.entityManagerFactory" %>
<%@ page import="uz.pdp.carwebsite.entity.User" %>
<%@ page import="java.util.List" %>

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
<body style="background:#25cff2">
<%
    EntityManager entityManager = entityManagerFactory.createEntityManager();
    List<User> users = entityManager.createQuery("from User ", User.class).getResultList();
    User currentUser = (User) session.getAttribute("currentUser");
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
                <a class="nav-link" href="../admin/admin.jsp">Back</a>
            </li>
        </ul>
        <div class="col-2 offset-9">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="../register.jsp">add user</a></li>
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
                <th>First_Name</th>
                <th>Last_name</th>
                <th>Age</th>
                <th>Role</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (User user : users) {
                    if (!currentUser.getId().equals(user.getId())) {
            %>
            <tr>
                <td><%=user.getFirstName()%>
                </td>
                <td><%=user.getLastName()%>
                </td>
                <td><%=user.getAge()%>
                </td>
                <td>
                    <ul>
                        <%
                            for (Role role : user.getRoles()) {%>

                        <li><%=role.getName()%>
                        </li>
                        <% }
                        %>
                    </ul>
                </td>
                <td>
                    <a href="../supperadmin/editUser.jsp?userId=<%=user.getId()%>" class="btn btn-dark">edit</a>
                    <a href="http://localhost:8080/delete/user?userId=<%=user.getId()%>" class="btn btn-dark">delete</a>
                </td>
            </tr>
            <%
                }
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
