<%--
  Created by IntelliJ IDEA.
  User: UlviAshraf
  Date: 12/30/2020
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="assets/css/AdminLogin.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body class="login_background">

<form action="login" method="POST">
    <div div class="col-4 container login_fix_">
        <center>
            <h1>Login:</h1>
        </center>
        <div class="form-group">
            <label>Email:</label>
            <input class="form-control" type="email" name="email" placeholder="enter email">
        </div>
        <div class="form-group">
            <label>Password:</label>
            <input class="form-control" type="password" name="password" placeholder="enter password">
        </div>
        <button class="btn btn-primary" type="submit" name="Login">Login</button>
    </div>
</form>
</body>
</html>
