<%@ page import="com.lumr.bbs.vo.User" %>
<%@ page import="com.lumr.bbs.service.UserService" %>
<%@ page import="com.lumr.bbs.service.impl.UserServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册模块</title>
</head>
<body>
<%
    /**
     * 判断是否有东西没填
     */
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String password1 = request.getParameter("password1");
    String sex = request.getParameter("sex");
    String head = request.getParameter("head");
    if (username == "" || password == "" || password1 == "" || sex == ""
            || head == ""){
        request.setAttribute("mess","请完整填写信息。");
        request.getRequestDispatcher("register.jsp").forward(request,response);
    }
%>

<%
    User user = new User(username,password,sex,head);
    UserService userService = new UserServiceImpl();
    int result = userService.register(user);
    switch (result){
        case 1:
            out.println("注册成功");
            out.print(user);
            break;
        case 0:
            request.setAttribute("mess","用户已存在");
            request.getRequestDispatcher("register.jsp").forward(request,response);
            break;
        case -1:
            request.setAttribute("mess","数据库错误，请重试");
            request.getRequestDispatcher("register.jsp").forward(request,response);
            break;
    }
%>
</body>
</html>
