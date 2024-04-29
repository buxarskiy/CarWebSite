<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 4/17/2024
  Time: 1:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="static/bootstrap.min.css">
    <style>
        body {
            background-color: #000;
            color: #fff;
        }

        .card {
            background-color: #fff;
            color: #000;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-dark text-white">
                    Login
                </div>
                <div class="card-body">
                    <form action="auth/login" method="post">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input name="email" type="email" class="form-control" id="email"
                                   placeholder="Enter your email">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" id="password"
                                   placeholder="Enter your password">
                        </div>
                        <button type="submit" class="btn btn-dark btn-lg w-100">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
