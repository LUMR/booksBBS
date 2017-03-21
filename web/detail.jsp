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
    <script src="js/js.js"></script>
    <script src="js/ckeditor/ckeditor.js"></script>
    <script src="js/editor.js"></script>
    <%--<script src="js/ckeditor/samples/js/sample.js"></script>--%>
</head>
<body>
<div id="container">
    <%--header--%>
    <%@include file="header.jsp"%>

    <div id="content">
        <!--获取子板块和文章信息-->
        <%
            //获取子板块信息
            int sid = 0;
            int tid = 0;
            int pages;
            if (request.getParameter("pages") == null)
                pages = 0;
            else {
                try{
                    pages = Integer.parseInt(request.getParameter("pages"));
                }catch (NumberFormatException e){
                    pages = 0;
                }
            }
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
            &gt;&gt; <a href="<%="list.jsp?sid="+sid%>"><%=sonBoard.getName()%></a> &gt;&gt; 帖子信息
        </div>
        <!--上下页计算-->
        <div>
            <%
                String pageURL = "detail.jsp?sid="+sid+"&tid="+tid+"&pages=";
                String lastpages = pageURL+(pages>0?pages-1:0);
                String nextpages = pageURL+(pages+1);
            %>
            <a href="<%="post.jsp?sid="+sonBoard.getId()%>"><img src="image/post.gif" /></a>&nbsp;&nbsp;
            <a href="" ><img src="image/reply.gif" /></a><br />
            <a href="<%=lastpages%>">上一页</a>
            <%

            %>

            <a href="<%=nextpages%>">下一页</a>
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
                    <img class="head" src="image/head/<%=topic.getUser().getHead()%>" /><br />
                    注册:<%=topic.getUser().getRegDate()%>
                </td>
                <td>
                    <span>楼主:</span>
                    <p><%=topic.getContent()%></p>
                    <hr />
                    <span>发表：[<%=topic.getCreateDate()%>] </span>
                </td>
            </tr>

            <!--获取回复-->
            <%
                ReplyService replyService = new ReplyServiceImpl();
                List<Reply> replies = replyService.getAllReply(topic,pages);
                int floots = 1+pages*10;//楼层数
                for (Reply reply : replies) {
            %>

            <tr>
                <td width="20%">
                    <strong><%=reply.getUser().getName()%></strong><br /><img class="head" src="image/head/<%=reply.getUser().getHead()%>" />
                    <br />注册:<%=reply.getUser().getRegDate()%>
                </td>
                <td>
                    <span><%=floots++%>楼:</span>
                    <p><%=reply.getContent()%></p>
                    <hr />
                    <span>发表：[<%=reply.getCreateDate()%>]&nbsp;&nbsp;最后修改:[<%=reply.getAlterDate()%>]</span>

                    <%
                        //判断是否有权修改回复
                        if (headerUser!=null&&headerUser.getName().equals(reply.getUser().getName()))
                            out.print("<span><a href=\"javascript:replyDelete()\" location=\"reply_delete.jsp?rid=\""+reply.getId()+">删除</a>&nbsp;&nbsp;" +
                                    "<a href=\"\" onclick=\"\">修改</a></span>");
                    %>
                    <%--<a href="javascript:return replyDelete()" location="reply_delete.jsp?rid="></a>--%>
                </td>
            </tr>

            <%
                }
            %>
        </table>
        <div style="padding:10px;"><a href="<%=lastpages%>">上一页</a> <a href="<%=nextpages%>">下一页</a></div>

        <!--回复表单-->
        <%
            String mess = (String)request.getAttribute("mess");
            String content = request.getParameter("content");
        %>
        <form action="reply_update.jsp" method="post">
            <label>
                <input name="tid" hidden="hidden" value="<%=topic.getId()%>">
            </label>
            <label>
                <input name="sid" hidden="hidden" value="<%=sonBoard.getId()%>">
            </label>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <th colspan="2" class="textAlignleft">回复帖子</th>
                </tr>
                <tr>
                    <%--<td width="15%">内容</td>--%>
                    <td>
                        <label>
                            <textarea id="editor" name="content" cols="80" rows="20"><%=content != null ? content : ""%></textarea>
                        </label><br />
                        (不能大于:1000字)
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
            <div class="textAlignCenter" style="padding:10px;">
                <input type="submit"  value="提交"/>
                <input type="reset" value="重置" />
            </div>
            <p class="message"><%=(mess != null)?mess:""%></p>
        </form>
        <script>
            CKEDITOR.replace('editor');
        </script>
    </div>  <!--content end-->

    <%--footer--%>
    <%@include file="footer.jsp"%>
</div> <!--container end-->
</body>
</html>
