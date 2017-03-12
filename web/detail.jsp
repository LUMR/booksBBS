<%--
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
    <div id="header">
        <img src="image/logo.gif" />
        <div id="userInfo">
            您尚未&nbsp;&nbsp; <a href="login.jsp">登录</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="reg.jsp">注册</a>&nbsp;&nbsp; |
        </div> <!--userInfo end-->
    </div>  <!--header end-->

    <div id="content">
        <div id="smallNav">&gt;&gt; <a href="index.jsp">论坛首页</a> &gt;&gt; <a href="list.jsp">C#语言</a> &gt;&gt; 帖子信息</div>
        <div><a href="post.jsp"><img src="image/post.gif" /></a>&nbsp;&nbsp;<img src="image/reply.gif" /><br />
            <a href="#">上一页</a> <a href="#">下一页</a>
        </div>
        <div id="Ttitle">本页主题:C#常量与变量解释</div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <th>&nbsp;</th>
                <th class="textAlignleft">C#常量与变量解释</th>
            </tr>
            <tr>
                <td width="20%">
                    teacher<br /><img src="image/head/1.gif" /><br />注册:2008-11-12
                </td>
                <td>
                    <p>从字面意思来看,常量是能经常用到不变的。变量是经常更改赋值的。</p>
                    <p>以下内容省略...</p>
                    <hr />
                    <span>发表：[2008-11-12 14:08] </span>
                </td>
            </tr>
            <tr>
                <td width="20%">
                    zhangsan<br /><img src="image/head/2.gif" /><br />注册:2009-10-15
                </td>
                <td>
                    <p>学习中...</p>
                    <hr />
                    <span>发表：[2008-12-12 15:08]  最后修改:[2008-11-12 14:08]</span>
                </td>
            </tr>
        </table>
        <div style="padding:10px;"><a href="#">上一页</a> <a href="#">下一页</a></div>
    </div>  <!--content end-->
    <div id="footer">
        2010 Guangzhou Qinghua Information Technology Co.,Ltd 版权所有
    </div> <!--footer end-->
</div> <!--container end-->
</body>
</html>
