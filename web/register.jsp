<%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎访问擎华教育论坛</title>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
    <script src="js/js.js"></script>
</head>

<body>
<div id="container">
    <%--header--%>
    <%@include file="header.jsp"%>
  
  <div id="content">
    <div id="smallNav">&gt;&gt; <a href="index.jsp">论坛首页</a> &gt;&gt; <a href="register.jsp">用户注册</a></div>
    <form action="register_update.jsp" method="post" onsubmit="return registerCheck()">
        <p><label>用户名:<input type="text" name="username"/></label></p>
        <p><label>密&nbsp;&nbsp;码:<input type="password" name="password"/></label></p>
        <p><label>重复密码:<input type="password" name="password1"/></label></p>
        <p>
            性别:&nbsp;&nbsp;
            <label><input type="radio" name="sex" value="男人"/>男</label>
            <label><input type="radio" name="sex" value="妹纸"/>女</label>
            <label><input type="radio" name="sex" value="扶她"/>秘密</label>
            <br />请选择头像
        </p>
        <p>
          <label><img src="image/head/1.gif"/><input type="radio" name="head" value="1.gif" checked="checked"></label>
          <label><img src="image/head/2.gif"/><input type="radio" name="head" value="2.gif"></label>
          <label><img src="image/head/3.gif"/><input type="radio" name="head" value="3.gif"></label>
          <label><img src="image/head/4.gif"/><input type="radio" name="head" value="4.gif"></label>
          <label><img src="image/head/5.gif"/><input type="radio" name="head" value="5.gif"></label>
          <br/>
          <label><img src="image/head/6.gif"/><input type="radio" name="head" value="6.gif"></label>
          <label><img src="image/head/7.gif"/><input type="radio" name="head" value="7.gif"></label>
          <label><img src="image/head/8.gif"/><input type="radio" name="head" value="8.gif"></label>
          <label><img src="image/head/9.gif"/><input type="radio" name="head" value="9.gif"></label>
          <label><img src="image/head/10.gif"/><input type="radio" name="head" value="10.gif"></label>
          <br/>
          <label><img src="image/head/11.gif"/><input type="radio" name="head" value="11.gif"></label>
          <label><img src="image/head/12.gif"/><input type="radio" name="head" value="12.gif"></label>
          <label><img src="image/head/13.gif"/><input type="radio" name="head" value="13.gif"></label>
          <label><img src="image/head/14.gif"/><input type="radio" name="head" value="14.gif"></label>
          <label><img src="image/head/15.gif"/><input type="radio" name="head" value="15.gif"></label>
        </p>
        <%
            String mess = (String)request.getAttribute("mess");
        %>
        <p><strong class="message"><%=mess!=null?mess:""%></strong></p>
        <p><input type="submit" value="注册" /></p>
    </form>
    
  </div>  <!--content end-->

    <%--footer--%>
    <%@include file="footer.jsp"%>
</div> <!--container end-->
</body>
</html>
