<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="com.lumr.bbs.service.UserService" %>
<%@ page import="com.lumr.bbs.service.impl.UserServiceImpl" %>
<%@ page import="com.lumr.bbs.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: fsweb
  Date: 17-3-17
  Time: 下午2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user-upload</title>
</head>
<body>
<%
    //获取上传目录,根据片段名字返回一个绝对路径
    String uploadPath = request.getServletContext().getRealPath("image/head");
    //判断是否为上传
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(1024*1024*1);//设定最大文件大小,单位byte
        try {
            List<FileItem> items = upload.parseRequest(request);
            out.println("<h1>上传文件:"+items.size()+"</h1>");
            for (FileItem item : items) {
                //判断是否为普通表单元素
                if (!item.isFormField()){
                    //非表单元素
                    String fileName = item.getName();
                    String fileType = item.getContentType();
                    if (fileName != null && !fileName.equals("") && fileType.contains("image")){
                        //新建文件
                        //
                        File temp = new File(fileName);//构建一个临时文件,防止文件名错误
                        String Type = temp.getName().substring(temp.getName().lastIndexOf("."));
                        User user = (User)session.getAttribute("user");
                        fileName = user.getId()+Type;
                        File file = new File(uploadPath,fileName);
                        item.write(file);
                        user.setHead(fileName);
                        UserService userService = new UserServiceImpl();
                        userService.update(user);
                        out.print("<h2>上传成功</h2><a href='userManager.jsp'>返回</a>'");
                        out.print("<h3>成功上传文件:"+fileName+"\t文件类型:"+item.getContentType());
                    }else {
                        out.print("<h2>上传失败</h2><a href='userManager.jsp'>返回</a>'");
                        out.print("<h3>上传文件:"+fileName+"\t文件类型:"+fileType);
                    }
                }else {
                    //表单元素
                    String fieldName = item.getFieldName();
                    out.println("<br/>表单域:"+fieldName+"\t\t值:"+item.getString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<h2>上传失败</h2><a href='userManager.jsp'>返回</a>'");
        }
    }else {
        out.print("没有上传文件.");
    }
%>
</body>
</html>
