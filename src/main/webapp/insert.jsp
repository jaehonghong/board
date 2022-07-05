<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
    <%@ page import="java.text.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#section{
	border-radius : 15px;
	margin : 0 auto;
	width:300px;
	height:100px;
	background-color:#C9EFFD;
	text-align:center;
	}
</style>
</head>
<body>
<%
	String name, email, subject, memo, time;
	name = request.getParameter("name");
	email = request.getParameter("email");
	subject = request.getParameter("subject");
	memo = request.getParameter("memo");
	
	
	
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
		conn=ds.getConnection();
	}
	catch(Exception e){
		out.println("데이터 베이스 접속에 문제가 있습니다<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	
	
	String sql= "INSERT INTO message "+
			"(subject, name, time, memo, email) "+
			"VALUES("+"'"+subject+"','"+name+"',sysdate(),'"+memo+"','"+email+"');";
			pstmt = conn.prepareStatement(sql);
	try{
		pstmt.executeUpdate(sql);
	}catch(Exception e){
		out.println("데이터 베이스 삽입에 문제가 있습니다<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<div id="section">
<h3>게시글이 등록되었습니다.</h3>
<a href="list.jsp">게시글 리스트 보기</a>
</div>

</body>
</html>