<%@ page import="com.lumr.bbs.service.SonBoardService" %>
<%@ page import="com.lumr.bbs.service.impl.SonBoardServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.SonBoard" %>
<%@ page import="com.lumr.bbs.vo.Topic" %>
<%@ page import="com.lumr.bbs.service.TopicService" %>
<%@ page import="com.lumr.bbs.service.impl.TopicServiceImpl" %>
<%@ page import="com.lumr.bbs.service.ReplyService" %>
<%@ page import="com.lumr.bbs.service.impl.ReplyServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.Reply" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/9
  Time: 下午9:47
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
        <%
            //获取子板块信息
            int sid = 0;
            int tid = 0;
            try {
                sid = Integer.parseInt(request.getParameter("sid"));
                tid = Integer.parseInt(request.getParameter("tid"));
            }catch (NumberFormatException e){
                out.println("<h1>sid或tid错误！</h1>");
            }
            SonBoardService sonBoardService = new SonBoardServiceImpl();
            SonBoard sonBoard = sonBoardService.getSonBoard(sid);
            if (sonBoard == null){
                out.print("<h1>sid错误，没有此子板块。");
                return;
            }
            //获取文章信息
            TopicService topicService = new TopicServiceImpl();
            Topic topic = topicService.getTopicById(tid,sonBoard);
            if (topic == null) {
                out.print("<h1>tid错误，没有此文章。");
                return;
            }
        %>
        <div id="smallNav">
            &gt;&gt; <a href="index.jsp">论坛首页</a>
            &gt;&gt; <a href=<%="list.jsp?sid="+sid%>><%=sonBoard.getName()%></a> &gt;&gt; 帖子信息
        </div>

        <div><a href="post.jsp"><img src="image/post.gif" /></a>&nbsp;&nbsp;<img src="image/reply.gif" /><br />
            <a href="#">上一页</a> <a href="#">下一页</a>
        </div>

        <!--文章内容-->
        <div id="Ttitle">本页主题:<%=topic.getTitle()%></div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <th>&nbsp;</th>
                <th class="textAlignleft"><%=topic.getTitle()%></th>
            </tr>
            <tr>
                <td width="20%">
                    <%=topic.getUser().getName()%><br />
                    <img src="image/head/1.gif" /><br />
                    注册:<%=topic.getUser().getRegDate()%>
                </td>
                <td>
                    <p><%=topic.getContent()%></p>
                    <hr />
                    <span>发表：[<%=topic.getCreateDate()%>] </span>
                </td>
            </tr>
            <!--获取回复-->
            <%
                ReplyService replyService = new ReplyServiceImpl();
                List<Reply> replies = replyService.getAllReply(topic);
                for (Reply reply : replies) {
            %>
            <tr>
                <td width="20%">
                    <%=reply.getUser().getName()%><br /><img src="image/head/2.gif" />
                    <br />注册:<%=reply.getUser().getRegDate()%>
                </td>
                <td>
                    <p><%=reply.getContent()%></p>
                    <hr />
                    <span>发表：[<%=reply.getCreateDate()%>]  最后修改:[<%=reply.getAlterDate()%>]</span>
                </td>
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
