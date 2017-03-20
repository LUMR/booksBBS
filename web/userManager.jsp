<%@ page import="com.lumr.bbs.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: fsweb
  Date: 17-3-17
  Time: 下午1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>
<div id="container">
<%--header--%>
<jsp:include page="header.jsp"/>
<%
    //判断用户是否登录
    User user = (User)session.getAttribute("user");
    if (user == null) {
        out.print("<h1>你还没登录</h1>");
        out.print("<p><a href='login.jsp'>登录</a></p>");
        return;
    }
%>
<%----%>
<div id="content">
<form action="user_update.jsp" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <th>ID</th>
            <td><p><%=user.getId()%></p></td>
            <td><input type="number" name="userId"></td>
        </tr>
        <tr>
            <th>名字</th>
            <td><p><%=user.getName()%></p></td>
            <td><input type="text" name="userName"></td>
        </tr>
        <tr>
            <th>性别</th>
            <td><p><%=user.getGender()%></p></td>
        </tr>
        <tr>
            <th>注册日期</th>
            <td><p><%=user.getRegDate()%></p></td>
        </tr>

    </table>
    <div id="head_picture">
    <table>
        <tr>
            <th>头像</th>
            <th>上传头像</th>
            <th>上传</th>
        </tr>
        <tr>
            <td><img src="image/head/<%=user.getHead()%>"></td>
            <td><input type="file" name="head"></td>
            <td><input type="submit" value="上传"></td>
        </tr>
    </table>
    </div>
</form>
</div>
</div>
<%--footer--%>
<jsp:include page="footer.jsp" />
</body>
</html>
