<%--
  Created by IntelliJ IDEA.
  User: fsweb
  Date: 17-3-13
  Time: 下午4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
</body>
</html>
