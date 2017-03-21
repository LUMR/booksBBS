<%@ page import="com.lumr.bbs.vo.*" %>
<%@ page import="com.lumr.bbs.service.*" %>
<%@ page import="com.lumr.bbs.service.impl.*" %>
<%@ page import="java.util.List" %>
<%@ page import="org.w3c.dom.stylesheets.MediaList" %>
<%--导入jstl标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/9
  Time: 下午8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>欢迎访问擎华教育论坛</title>
      <link href="style/style.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
  <div id="container">
      <%--header--%>
      <%@include file="header.jsp"%>

      <div id="content">
      <table cellpadding="0" cellspacing="0" width="100%">
          <tr>
              <th colspan="2" width="70%">论坛</th>
              <th width="5%">主题</th>
              <th>最后发表</th>
          </tr>
          <%
              List<MainBoard> M_list = (List<MainBoard>)request.getAttribute("M_list");
              String url;
          %>
          <%--使用JSTL标签--%>
          <c:forEach var="Mlist" items="${M_list}">

          <tr>
              <td colspan="4">${Mlist.getName()}
              </td>
          </tr>

          </c:forEach>

      </table>
      </div>  <!--content end-->

      <%--footer--%>
      <%@include file="footer.jsp"%>
  </div> <!--container end-->
  </body>
</html>
