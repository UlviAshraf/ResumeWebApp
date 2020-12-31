<%-- 
    Document   : user
    Created on : Dec 13, 2020, 6:53:02 PM
    Author     : UlviAshraf
--%>

<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.company.entity.User" %>
<%@page import="com.company.dao.inter.UserDaoInter" %>
<%@page import="com.company.main.Context" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="css/users.css">
</head>
<body>
<%
    User u = (User) request.getAttribute("user");
    Date date = u.getBirthDate();
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    String dateStr = sdf.format(date);
%>

<div class="container col-12">
    <form action="userdetail" method="POST">
        <input type="hidden" name="id" value="<%=u.getId()%>"/>
        <input type="hidden" name="action" value="update">
        <div class="col-4">
            <label for="name">name:</label>
            <input class="form-control" type="text" name="name" value="<%=u.getName()%>">
        </div>
        <div class="col-4">
            <label for="surname">surname:</label>
            <input class="form-control" type="text" name="surname" value="<%=u.getSurname()%>"/>
        </div>
        <div class="col-4">
            <label for="email">email:</label>
            <input class="form-control" type="email" name="email" value="<%=u.getEmail()%>">
        </div>
        <div class="col-4">
            <label for="phone">phone:</label>
            <input class="form-control" type="text" name="phone" value="<%=u.getPhone()%>">
        </div>
        <div class="col-4">
            <label for="birthdate">birthdate:</label>
            <input class="form-control" type="text" name="birthdate" value="<%=dateStr%>">
        </div>
        <div class="col-4">
            <label for="address"> address:</label>
            <input class="form-control" name="address" type="text" value="<%=u.getAddress()%>"/>
        </div>
        <div class="mycontainer col-2">
            <button class="btn btn-primary" type="submit" name="save" value="Update">Update</button>
        </div>
    </form>
</div>
</body>
</html>
