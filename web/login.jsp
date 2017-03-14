<%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>欢迎访问擎华教育论坛</title>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
    String mess = (String)request.getAttribute("mess");
%>
<div id="container">
    <div id="header">
        <img src="image/logo.gif" />
        <br/><br/>
        <div id="userInfo">
            您尚未&nbsp;&nbsp; <a href="login.jsp">登录</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="register.jsp">注册</a>&nbsp;&nbsp; |
        </div> <!--userInfo end-->
    </div>  <!--header end-->

    <div id="content">
        <div id="smallNav">&gt;&gt; <a href="index.jsp">论坛首页</a> &gt;&gt; <a href="login.jsp">用户登录</a></div>
        <form align="center" action="login_update.jsp" method="post">
            <table>
                <tr>
                    <td>用户名:</td>
                    <td><input type="text" align="center" name="name"/></td>
                </tr>
                <tr>
                    <td>密&nbsp;&nbsp;码:</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="登录" /></td>
                </tr>
                <tr>
                    <td class="message"><%=(mess!=null)?mess:""%></td>
                </tr>
            </table>
        </form>
    </div>  <!--content end-->
    <div id="footer">
        2010 Guangzhou Qinghua Information Technology Co.,Ltd 版权所有
    </div> <!--footer end-->
</div> <!--container end-->
</body>
</html>
