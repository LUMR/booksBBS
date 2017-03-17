<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page import="java.util.Iterator" %>
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
    <title>user</title>
</head>
<body>
<%
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart == true) {
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> iter = items.iterator();

            while (iter.hasNext()){
                //读取数据元素
                FileItem item = iter.next();
                //判断元素类型,true为普通表单元素,false为文件元素
                if (!item.isFormField()){
                    String fileName = item.getName();//获取文件名
                    if (fileName != null && fileName != "") {
                        File fullFile = new File(item.getName());
                        File saveFile = new File("image/head/",fullFile.getName());
                        item.write(saveFile);//写入文件
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }


    }
%>
</body>
</html>
