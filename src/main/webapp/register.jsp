<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/17/2024
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
</head>
<body style="background: #47e312">
<div class="card container mt-5" style="width: 24rem;">
    <div class="card-header">
        <h5 class="card-title">Register</h5>
    </div>
    <div class="card-body">
        <form action="../register" method="post">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="Enter first name">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name">
            </div>
            <div class="form-group">
                <label for="age">Age</label>
                <input type="number" class="form-control" id="age" name="age" placeholder="Enter age">
            </div>
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
            </div>
            <div class="form-group">
                <label for="password_repeat">Repeat password</label>
                <input type="password" class="form-control" id="password_repeat" name="passwordRepeat" placeholder="PasswordRepeat">
            </div>
            <button type="submit" class="btn btn-primary btn-lg w-100 my-2">Register</button>
        </form>
    </div>
</div>
</body>
</html>
