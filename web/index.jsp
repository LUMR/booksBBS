<%@ page import="com.lumr.bbs.vo.*" %>
<%@ page import="com.lumr.bbs.service.*" %>
<%@ page import="com.lumr.bbs.service.impl.*" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
              SonBoardService sonBoardService = new SonBoardServiceImpl();
              TopicService topicService;
              topicService = new TopicServiceImpl();
              for (MainBoard aM_list : M_list) {
          %>

          <tr>
              <td colspan="4"><%=aM_list.getName()%>
              </td>
          </tr>
          <%
              //获取子板块

              List<SonBoard> S_list = sonBoardService.getAllSonBoard(aM_list);
              for (SonBoard aS_list : S_list) {
                  //获取子板块主题
                  List<Topic> T_list = topicService.getAllTopic(aS_list);
          %>
          <tr>
              <td width="5%">&nbsp;</td>
              <td><img src="image/board.gif"/>
                  <a href=<%="list?sid="+aS_list.getId()%>><%=aS_list.getName()%></a>
              </td>
              <%
                  if (T_list.size() == 0){

              %>
              <td class="textAlignCenter">0</td>
              <td>0<br/>无&nbsp;<span>1970-1-1</span></td>
              <%
                  }else{
                      url = "detail.jsp?sid="+aS_list.getId()+"&tid="+T_list.get(0).getId();
              %>
              <td class="textAlignCenter"><%=T_list.size()%></td>
              <td><a href=<%=url%>><%=T_list.get(0).getTitle()%></a><br/><%=T_list.get(0).getUser().getName()%>
                  <span><%=T_list.get(0).getCreateDate()%></span>
              </td>
          </tr>
          <%
                  }
              }
              }
          %>
      </table>
      </div>  <!--content end-->

      <%--footer--%>
      <%@include file="footer.jsp"%>
  </div> <!--container end-->
  </body>
</html>
