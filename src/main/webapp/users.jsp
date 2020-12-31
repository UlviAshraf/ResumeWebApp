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
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://kit.fontawesome.com/f4d711b7d4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/users.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script type="text/javascript" src="js/users.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <title>JSP Page</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("loggedInUser");
%>
<%="Welcome " + user.getName()%>
<%
    //    if (request.getAttribute("owner") == null) {
//        response.sendRedirect("error.jsp?msg=not found");
//    }
    List<User> list = (List<User>) request.getAttribute("users");

%>
<div class="container col-12">
    <div class="mycontainer col-4">
        <form action="users" method="GET">
            <div class="form-group">
                <label for="name">name:</label>
                <input placeholder="Enter name" class="form-control" type="text" name="name" value=""/>
            </div>
            <div class="form-group">
                <label for="surname">surname:</label>
                <input placeholder="Enter surname" class="form-control" type="text" name="surname" value=""/>
            </div>
            <input class="btn btn-primary" type="submit" name="search" value="Search" id="search"/>
        </form>
    </div>
    <div>
        <table class="table mycontainer">
            <thead class="thead-dark">
            <tr>
                <th>Name</th>
                <th>Surname</th>
                <th>Nationality</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                for (User u : list) {
            %>
            <tr>
                <td><%=u.getName()%>
                </td>
                <td><%=u.getSurname()%>
                </td>
                <td><%=u.getNationality().getNationality() == null ? "N/A" : u.getNationality().getNationality()%>
                </td>
                <td style="width: 5px">
                    <input type="hidden" name="id" value="<%=u.getId()%>"/>
                    <input type="hidden" name="action" value="delete"/>
                    <button class="btn btn-danger  " type="submit" value="delete"
                            data-toggle="modal" data-target="#exampleModal"
                            onclick="setIdForDelete(<%=u.getId()%>)">
                        <i class="fas fa-trash-alt"></i>
                    </button>
                </td>
                <td style="width: 5px">
                    <form action="userdetail" method="GET">
                        <input type="hidden" name="id" value="<%=u.getId()%>"/>
                        <input type="hidden" name="action" value="update"/>
                        <button class=" btn btn-secondary" type="submit" value="update">
                            <i class="far fa-edit"></i>
                        </button>
                    </form>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are You Sure?
            </div>
            <div class="modal-footer">
                <form action="userdetail" method="POST">
                    <input type="hidden" name="id" value="" id="forDelete"/>
                    <input type="hidden" name="action" value="delete"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Delete"/>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are You Sure?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">Save changes</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
