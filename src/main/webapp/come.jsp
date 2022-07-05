<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <%
    String level = (String)session.getAttribute("level");
   
    
    if(level.equals("1")){
    	out.println("<script>");
		out.println("location.href='level1.jsp'");
		out.println("</script>");
    }
    else{
    	out.println("<script>");
		out.println("location.href='list.jsp'");
		out.println("</script>");
    } 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>