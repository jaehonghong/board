<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>게시글 내용</h3>
<%
	String subject="",memo="",name="",time="",email="",id="";	
	id = request.getParameter("id");
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
		conn=ds.getConnection();
	}catch(Exception e){
		out.println("데이터 베이스 접속에 문제가 있습니다<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	String sql = "SELECT * FROM message WHERE num = "+ id;
	pstmt=conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	while(rs.next()){
		subject = rs.getString("subject");
		memo = rs.getString("memo");
		name = rs.getString("name");
		time = rs.getString("time");
		email = rs.getString("email");
	}
%>
<table border="2">
	<tr>
		<td>제목</td>
		<td><%=subject %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%=memo %></td>
	</tr>

	<tr>
		<td>날짜</td>
		<td><%=time %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=email %></td>
	</tr>
</table>

<br>
<br>
<a href="list.jsp">게시글 보기</a>
</body>
</html>