<%@ page import="com.lumr.bbs.vo.User" %>
<%@ page import="com.lumr.bbs.service.SonBoardService" %>
<%@ page import="com.lumr.bbs.service.impl.SonBoardServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.SonBoard" %>
<%@ page import="com.lumr.bbs.service.TopicService" %>
<%@ page import="com.lumr.bbs.service.impl.TopicServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.Topic" %>
<%@ page import="com.lumr.bbs.service.ReplyService" %>
<%@ page import="com.lumr.bbs.service.impl.ReplyServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.Reply" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: fsweb
  Date: 17-3-14
  Time: 下午4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>reply_update</title>
</head>
<body>

<%
    //读取user信息
    Object obj = session.getAttribute("user");
    User user = (User)obj;
    if (user == null) {
        request.setAttribute("mess","你还没登录,请先登录");
        request.getRequestDispatcher("detail.jsp").forward(request,response);
    }

    //读取sid信息
    int sid = 0;
    int tid = 0;
    try {
        sid = Integer.valueOf(request.getParameter("sid"));
        tid = Integer.valueOf(request.getParameter("tid"));
    }catch (NumberFormatException e){
        request.setAttribute("mess","sid或tid错误");
        request.getRequestDispatcher("detail.jsp").forward(request,response);
    }
    SonBoardService sonBoardService = new SonBoardServiceImpl();
    SonBoard sonBoard= sonBoardService.getSonBoard(sid);
    if (sonBoard == null) {
        request.setAttribute("mess","sid错误,没有此sid.");
        request.getRequestDispatcher("detail.jsp").forward(request,response);
    }
    TopicService topicService = new TopicServiceImpl();
    Topic topic = topicService.getTopicById(tid,sonBoard);
    if (topic == null) {
        request.setAttribute("mess","tid错误,没有此tid.");
        request.getRequestDispatcher("detail.jsp").forward(request,response);
    }
    //读取detail信息
    String content = request.getParameter("content");
    if (content == ""){
        request.setAttribute("mess","你还没填完信息");
        request.getRequestDispatcher("detail.jsp").forward(request,response);
    }

    ReplyService replyService = new ReplyServiceImpl();
    Reply reply = new Reply(content,(new Date()),(new Date()),user,topic);
    int result = replyService.addReply(reply);
    if (result>0){
        response.sendRedirect("detail.jsp?sid="+sid+"&tid="+tid);
    }else{
        request.setAttribute("mess","服务器繁忙,添加失败");
        request.getRequestDispatcher("detail.jsp").forward(request,response);
    }
%>

</body>
</html>
