<%@ page import="com.lumr.bbs.service.SonBoardService" %>
<%@ page import="com.lumr.bbs.service.impl.SonBoardServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.SonBoard" %><%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>欢迎访问擎华教育论坛</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
    <!--header-->
    <%@include file="header.jsp"%>

    <%--获取子板块信息--%>
    <%
        int sid = 0;
        try {
            sid = Integer.parseInt(request.getParameter("sid"));
        }catch (NumberFormatException e){
            out.print("<h1>sid错误!</h1>");
        }
        SonBoardService sonBoardService = new SonBoardServiceImpl();
        SonBoard sonBoard= sonBoardService.getSonBoard(sid);
        if (sonBoard == null) {
            out.print("<h2>sid错误,没有此sid.</h2>");
            return;
        }

        //获取转发信息(如果有)
        String mess = (String)request.getAttribute("mess");
        String content = request.getParameter("content");
        String title = request.getParameter("title");
    %>
    <div id="content">
    <div id="smallNav">&gt;&gt; <a href="index.jsp">论坛首页</a> &gt;&gt;
        <a href="<%="list.jsp?sid="+sonBoard.getId()%>"><%=sonBoard.getName()%></a>
    </div>
        <form action="post_update.jsp" method="post">
            <label>
                <input name="sid" hidden="hidden" value="<%=sonBoard.getId()%>">
            </label>
            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <th colspan="2" class="textAlignleft">发表帖子</th>
                </tr>
                <tr>
                    <td width="15%">标题</td>
                    <td><label>
                        <input type="text" name="title" size="50" value="<%=title!=null?title:""%>"/>
                    </label></td>
                </tr>
                <tr>
                    <td width="15%">内容</td>
                    <td>
                        <label>
                            <textarea name="content" cols="80" rows="20"><%=content != null ? content : ""%></textarea>
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
  </div>  <!--content end-->

    <!--footer-->
    <%@include file="footer.jsp"%>
</div> <!--container end-->
</body>
</html>
