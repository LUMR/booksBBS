<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %><%--
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
    //设置上传目录,根据片段名字返回一个绝对路径
    String uploadPath = request.getServletContext().getRealPath("image/head");
    //判断是否为上传
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List<FileItem> items = upload.parseRequest(request);
            out.println("上传文件:"+items.size());
            for (FileItem item : items) {
                //判断是否为普通表单元素
                if (!item.isFormField()){
                    //非表单元素
                    String fileName = item.getName();
                    String fileType = item.getContentType();
                    if (fileName != null && !fileName.equals("") && fileType.contains("image")){
                        //新建文件
                        File temp = new File(fileName);//构建一个临时文件,防止文件名错误
                        File file = new File(uploadPath,temp.getName());
                        item.write(file);
                        out.print("<h1>上传成功</h1><a href='userManager.jsp'>返回</a>'");
                        out.print("<h2>成功上传文件:"+fileName+"\t文件类型:"+item.getContentType());
                    }else {
                        out.print("<h1>上传失败</h1><a href='userManager.jsp'>返回</a>'");
                        out.print("<h2>上传文件:"+fileName+"\t文件类型:"+fileType);
                    }
                }else {
                    //表单元素
                    String fieldName = item.getFieldName();
                    out.println("\n表单域"+fieldName+"值:"+item.getString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<h1>上传失败</h1><a href='userManager.jsp'>返回</a>'");
        }
    }else {
        out.print("没有上传文件.");
    }
%>
</body>
</html>
