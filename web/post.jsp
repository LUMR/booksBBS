<%--
  Created by IntelliJ IDEA.
  User: lumr
  Date: 2017/3/12
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎访问擎华教育论坛</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="container">
  <div id="header">
    <img src="image/logo.gif" />
    <div id="userInfo">
      您尚未&nbsp;&nbsp; <a href="login.jsp">登录</a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="register.jsp">注册</a>&nbsp;&nbsp; |
    </div> <!--userInfo end-->
  </div>  <!--header end-->
  
  <div id="content">
    <div id="smallNav">&gt;&gt; <a href="index.jsp">论坛首页</a> &gt;&gt; <a href="list.jsp">C#语言</a></div>
    <form>
        <table cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <th colspan="2" class="textAlignleft">发表帖子</th>
          </tr>
          <tr>
            <td width="15%">标题</td>
            <td><input type="text" size="50"/></td>
          </tr>
          <tr>
            <td width="15%">内容</td>
            <td>
              <textarea cols="80" rows="20"></textarea><br />
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
    </form>
    
  </div>  <!--content end-->
  <div id="footer">
    2010 Guangzhou Qinghua Information Technology Co.,Ltd 版权所有
  </div> <!--footer end-->
</div> <!--container end-->
</body>
</html>
