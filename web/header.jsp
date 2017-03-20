<%@ page import="com.lumr.bbs.vo.User" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div id="header">
    <%!
        //静态变量
        int count = 0;
    %>
    <%
        /*采用cookie的方式
        Cookie[] cookie = request.getCookies();
        String username = null;
        String password = null;
        if (cookie != null) {
            for (Cookie aCookie : cookie) {
                if (aCookie.getName().equals("user"))
                    username = aCookie.getValue();
                if (aCookie.getName().equals("password"))
                    password = aCookie.getValue();
            }
            if (username != null && password != null) {
                User user = new User(username,password);
                request.setAttribute("user",user);
                request.getRequestDispatcher("login_update.jsp").forward(request,response);
            }
        }
        */

        //采用session方式
        User headerUser = (User)session.getAttribute("user");

    %>
    <img src="image/logo.gif" />
    <div id="userInfo">
        <%
            if (headerUser == null){
        %>
        您尚未&nbsp;&nbsp; <a href="login.jsp">登录</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="register.jsp">注册</a>&nbsp;&nbsp; |
        <%
        }else {
                count++;
        %>
        <a href="index.jsp">主页</a>
        <span>你好！</span>&nbsp;<a href="userManager.jsp" ><strong><%=headerUser.getName()%></strong></a>&nbsp;
        <span><a href="logout.jsp">注销</a></span>
        <span>该网页已被访问<%=count%>次.</span>
        <%
            }

        %>
    </div> <!--userInfo end-->
</div>  <!--header end-->
