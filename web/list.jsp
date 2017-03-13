<%--
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

        <div id="smallNav">&gt;&gt; <a href="index.jsp">论坛首页</a> &gt;&gt; C#语言</div>
        <div>
            <a href="post.jsp"><img src="image/post.gif" /></a><br />
            <a href="#">上一页</a> <a href="#">下一页</a>
        </div>

        <!--文章列表-->
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <th colspan="2" width="80%">文章</th>
                <th width="10%">作者</th>
                <th>回复</th>
            </tr>
            <%
                int sid = Integer.getInteger(request.getParameter("sid"));
                SonBoard sonBoard = new SonBoard();
                TopicService topicService = new TopicServiceImpl();
                out.print(sid);
            %>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="detail.jsp">C#常量与变量解释</a></td>
                <td class="textAlignCenter">teacher</td>
                <td class="textAlignCenter">1</td>
            </tr>

        </table>
        <div style="padding:10px;"><a href="#">上一页</a> <a href="#">下一页</a></div>
    </div>  <!--content end-->

    <%--footer--%>
    <%@include file="footer.jsp"%>

</div> <!--container end-->
</body>
</html>
