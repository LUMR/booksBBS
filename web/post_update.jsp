<%@ page import="com.lumr.bbs.vo.SonBoard" %>
<%@ page import="com.lumr.bbs.service.impl.SonBoardServiceImpl" %>
<%@ page import="com.lumr.bbs.service.SonBoardService" %>
<%@ page import="com.lumr.bbs.vo.User" %>
<%@ page import="com.lumr.bbs.service.TopicService" %>
<%@ page import="com.lumr.bbs.service.impl.TopicServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.Topic" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: fsweb
  Date: 17-3-14
  Time: 下午1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Post</title>
</head>
<body>
<%
    //读取user信息
    Object obj = session.getAttribute("user");
    User user = (User)obj;
    if (user == null) {
        request.setAttribute("mess","你还没登录,请先登录");
        request.getRequestDispatcher("post.jsp").forward(request,response);
    }

    //读取sid信息
    int sid = 0;
    try {
        sid = Integer.valueOf(request.getParameter("sid"));
    }catch (NumberFormatException e){
        request.setAttribute("mess","sid错误");
        request.getRequestDispatcher("post.jsp").forward(request,response);
    }
    SonBoardService sonBoardService = new SonBoardServiceImpl();
    SonBoard sonBoard= sonBoardService.getSonBoard(sid);
    if (sonBoard == null) {
        request.setAttribute("mess","sid错误,没有此sid.");
        request.getRequestDispatcher("post.jsp").forward(request,response);
    }

    //读取post信息
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    if (title == "" || content == ""){
        request.setAttribute("mess","你还没填完信息");
        request.getRequestDispatcher("post.jsp").forward(request,response);
    }

    TopicService topicService = new TopicServiceImpl();
    Topic topic = new Topic(title,content,(new Date()),sonBoard,user);
    int result = topicService.addTopic(topic);
%>
<%@include file="header.jsp"%>
<%
    if (result>0)
        out.print("<h1>添加成功</h1>");
    else
        out.print("<h1>添加失败,服务器繁忙</h1>");
%>
<a href="<%="list.jsp?sid="+sonBoard.getId()%>">点击返回子板块</a>
<%@include file="footer.jsp"%>
</body>
</html>
