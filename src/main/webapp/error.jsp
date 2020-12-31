<%--
  Created by IntelliJ IDEA.
  User: UlviAshraf
  Date: 12/25/2020
  Time: 2:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Why Are You Here?</title>

</head>
<body>
<%
    String msg = request.getParameter("msg");
%>
<%=msg%>

</body>
</html>
