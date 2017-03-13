<%@ page import="com.lumr.bbs.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div id="header">
    <%
        /*采用cookie的方式
        Cookie[] cookie = request.getCookies();
        String user = null;
        if (cookie != null) {
            for (Cookie aCookie : cookie) {
                if (aCookie.getName().equals("user"))
                    user = aCookie.getValue();
            }
        }
        */

        //采用session方式
        Object obj = session.getAttribute("user");
        User user = (User) obj;

    %>
    <img src="image/logo.gif" />
    <div id="userInfo">
        <%
            if (user == null){
        %>
        您尚未&nbsp;&nbsp; <a href="login.jsp">登录</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="register.jsp">注册</a>&nbsp;&nbsp; |
        <%
        }else {
        %>
        你好！<h><%=user.getName()%></h>&nbsp;<span><a href="logout.jsp">注销</a></span>
        <%
            }

        %>
    </div> <!--userInfo end-->
</div>  <!--header end-->
