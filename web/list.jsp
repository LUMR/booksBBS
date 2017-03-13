<%@ page import="com.lumr.bbs.vo.SonBoard" %>
<%@ page import="com.lumr.bbs.service.TopicService" %>
<%@ page import="com.lumr.bbs.service.impl.TopicServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.Topic" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lumr.bbs.service.SonBoardService" %>
<%@ page import="com.lumr.bbs.service.impl.SonBoardServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/9
  Time: 下午10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
        <%
            //获取子板块信息
            int sid;
            try {
                sid = Integer.parseInt(request.getParameter("sid"));
            }catch (NumberFormatException e){
                sid = 0;
                out.println("<h1>sid错误！</h1>");
            }
            SonBoardService sonBoardService = new SonBoardServiceImpl();
            SonBoard sonBoard = sonBoardService.getSonBoard(sid);
            if (sonBoard == null) {
                out.print("<h2>没有此主版块</h2>");
                return;
            }else {
        %>
        <div id="smallNav">&gt;&gt; <a href="index.jsp">论坛首页</a> &gt;&gt; <%=sonBoard.getName()%></div>
        <div>
            <a href="post.jsp"><img src="image/post.gif" /></a><br />
            <a href="#">上一页</a> <a href="#">下一页</a>
        </div>
        <%
            }
        %>
        <!--文章列表-->
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <th colspan="2" width="80%">文章</th>
                <th width="10%">作者</th>
                <th>回复</th>
            </tr>
            <%
                //获取子文章
                TopicService topicService = new TopicServiceImpl();
                List<Topic> T_list = topicService.getAllTopic(sonBoard);
                for (Topic aTopic: T_list) {
            %>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href=<%="detail.jsp?tid="+aTopic.getId()%>><%=aTopic.getTitle()%></a></td>
                <td class="textAlignCenter"><%=aTopic.getUser().getName()%></td>
                <td class="textAlignCenter">1</td>
            </tr>
            <%
                }
            %>
        </table>
        <div style="padding:10px;"><a href="#">上一页</a> <a href="#">下一页</a></div>
    </div>  <!--content end-->

    <%--footer--%>
    <%@include file="footer.jsp"%>

</div> <!--container end-->
</body>
</html>
