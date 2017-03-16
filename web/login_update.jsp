<%@ page import="com.lumr.bbs.service.UserService" %>
<%@ page import="com.lumr.bbs.service.impl.UserServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>登陆模块</title>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
    //验证注册信息
    String name = request.getParameter("name");
    String password = request.getParameter("password");
//    User user = (User)request.getAttribute("user");
    UserService userService = new UserServiceImpl();
//    if (user == null)
       User user = new User(name, password);
    switch (userService.login(user)){
        case 1:
            request.setAttribute("mess","登陆成功");
            Cookie cookie = new Cookie("user",user.getName());
//            Cookie cookie1 = new Cookie("password",user.getPassword());
            session.setAttribute("user",user);
            response.addCookie(cookie);
//            response.addCookie(cookie1);
            response.sendRedirect("index.jsp");
            break;
        case 0:
            request.setAttribute("mess","没有此用户，请重试");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            break;
        case -2:
            request.setAttribute("mess","密码错误");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            break;
        case -1:
            request.setAttribute("mess","数据库连接错误");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            break;
    }



%>

<div id="container">
    <div id="header">
        <img src="image/logo.gif" />
        <div id="userInfo">
            您尚未&nbsp;&nbsp; <a href="login.jsp">登录</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="register.jsp">注册</a>&nbsp;&nbsp; |
        </div> <!--userInfo end-->
    </div>  <!--header end-->
</div>
<div id="content">
    <%
        //设置请求的编码方式：
//        request.setCharacterEncoding("UTF-8");
        //设置响应的编码方式：
//        response.setCharacterEncoding("UTF-8");

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
