<%--
  Created by IntelliJ IDEA.
  User: fsweb
  Date: 17-3-14
  Time: 下午3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<form action="reply_update.jsp" method="post">
    <input name="sid" hidden="hidden" value="<%=sonBoard.getId()%>" >
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <th colspan="2" class="textAlignleft">发表帖子</th>
        </tr>
        <tr>
            <td width="15%">标题</td>
            <td><input type="text" name="title" size="50" value="<%=title!=null?title:""%>"/></td>
        </tr>
        <tr>
            <td width="15%">内容</td>
            <td>
                <textarea name="content" cols="80" rows="20" ><%=content!=null?content:""%></textarea><br />
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