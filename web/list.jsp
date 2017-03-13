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
        <div><a href="post.jsp"><img src="image/post.gif" /></a><br />
            <a href="#">上一页</a> <a href="#">下一页</a>
        </div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <th colspan="2" width="80%">文章</th>
                <th width="10%">作者</th>
                <th>回复</th>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="detail.jsp">C#常量与变量解释</a></td>
                <td class="textAlignCenter">teacher</td>
                <td class="textAlignCenter">1</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">newTopic</a></td>
                <td class="textAlignCenter">teacher</td>
                <td class="textAlignCenter">1</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">oo</a></td>
                <td class="textAlignCenter">teacher</td>
                <td class="textAlignCenter">2</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">c#是微软开发的语言</a></td>
                <td class="textAlignCenter">zhangsan</td>
                <td class="textAlignCenter">0</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">大家好</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">0</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言 问题集锦3</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">12</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言 问题集锦2</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">10</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言 问题集锦1</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">0</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言测试帖6</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">0</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言测试帖5</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">0</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言测试帖4</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">0</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言测试帖3</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">0</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言测试帖2</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">0</td>
            </tr>
            <tr>
                <td width="5%" class="textAlignCenter"><img src="image/topic.gif" /></td>
                <td> <a href="#">C#语言测试帖1</a></td>
                <td class="textAlignCenter">goodman</td>
                <td class="textAlignCenter">0</td>
            </tr>
        </table>
        <div style="padding:10px;"><a href="#">上一页</a> <a href="#">下一页</a></div>
    </div>  <!--content end-->

    <%--footer--%>
    <%@include file="footer.jsp"%>
</div> <!--container end-->
</body>
</html>
