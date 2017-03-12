<%@ page import="com.lumr.bbs.vo.*" %>
<%@ page import="com.lumr.bbs.service.*" %>
<%@ page import="com.lumr.bbs.service.impl.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
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
      <div id="header">
          <img src="image/logo.gif" />
          <div id="userInfo">
              您尚未&nbsp;&nbsp; <a href="login.jsp">登录</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="reg.jsp">注册</a>&nbsp;&nbsp; |
          </div> <!--userInfo end-->
      </div>  <!--header end-->

      <div id="content">
      <table cellpadding="0" cellspacing="0" width="100%">
          <tr>
              <th colspan="2" width="70%">论坛</th>
              <th width="5%">主题</th>
              <th>最后发表</th>
          </tr>
          <%
              MainBoardService mainBoardService = new MainBoardServiceImpl();
              List<MainBoard> M_list = mainBoardService.getAllMainBoard();
              SonBoardService sonBoardService = new SonBoardServiceImpl();
              for (int i = 0; i < M_list.size(); i++) {

          %>
          <tr>
              <td colspan="4"><%=M_list.get(i).getName()%></td>
          </tr>
          <%
                List<SonBoard> S_list = sonBoardService.getAllSonBoard(M_list.get(i));
                for (int j = 0; j < S_list.size(); j++) {
          %>
          <tr>
          <td width="5%">&nbsp;</td>
          <td><img src="image/board.gif" /> <a href="list.jsp"><%=S_list.get(j).getName()%></a></td>
          <td class="textAlignCenter">14</td>
          <td>uuu<br />teacher <span> [ 2008-11-12 14:08 ]</span></td>
        </tr>
          <%
                }
              }
          %>
      </table>
    </div>  <!--content end-->

      <div id="footer">
      2010 Guangzhou Qinghua Information Technology Co.,Ltd 版权所有
    </div> <!--footer end-->
  </div> <!--container end-->
  </body>
</html>
