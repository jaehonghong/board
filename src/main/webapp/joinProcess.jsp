<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
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
	
	
	String sql= "INSERT INTO message_id "+
			"(id, name) "+
			"VALUES("+"'"+id+"','"+name+"');";
			pstmt = conn.prepareStatement(sql);
	try{
		pstmt.executeUpdate(sql);
	}catch(Exception e){
		out.println("데이터 베이스 삽입에 문제가 있습니다<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#section{
	border-radius : 15px;
	margin : 0 auto;
	width:300px;
	height:90px;
	background-color:#C9EFFD;
	text-align:center;
	}
</style>
</head>
<body>
<div id="section">
<h3>회원가입 완료</h3>
<a href="index.jsp">로그인 페이지로</a>
</div>
</body>
</html>