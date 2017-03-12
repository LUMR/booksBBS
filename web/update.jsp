<%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>注册成功</title>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
    <div id="header">
        <img src="image/logo.gif" />
        <div id="userInfo">
            您尚未&nbsp;&nbsp; <a href="login.jsp">登录</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="reg.jsp">注册</a>&nbsp;&nbsp; |
        </div> <!--userInfo end-->
    </div>  <!--header end-->
</div>
<div id="content">
    <%
        //设置请求的编码方式：
//        request.setCharacterEncoding("UTF-8");
        //设置响应的编码方式：
//        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
    %>
    <ul>
        <li>你的名字是：<span><%=name%></span></li>
        <li>你的密码是：<span><%=password%></span></li>
    </ul>
    <hr>
    <strong>感谢你的注册！</strong>
</div>
</body>
</html>
