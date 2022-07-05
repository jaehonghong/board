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
<style>
	#section{
	border-radius : 15px;
	margin : 0 auto;
	width:500px;
	background-color:#C9EFFD;
	text-align:center;
	}
	table{
	margin: 0 auto;
	}
</style>
</head>
<body>
<div id="section">
	<h3>게시글 리스트</h3>
	<table border="2">
	<tr>
	<td>번호</td>
	<td>제목</td>
	<td>작성자</td>
	<td>날짜</td>
	<td>이메일</td>
	</tr>
<%
	String level = (String)session.getAttribute("level");

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
	
	String sql = "SELECT * FROM message ORDER BY num asc";
	pstmt=conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs!=null){
		while(rs.next()){
			int id = Integer.parseInt(rs.getString("num"));
			
%>

<tr>
	<td><%=id %></td>
	<td><a href=display.jsp?id=<%=id %>><%=rs.getString("subject") %></a></td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getString("time") %></td>
	<td><%=rs.getString("email") %></td>
</tr>
<%
		}
	}
%>
	</table>
	<%
	if(level.equals("3")){%>		
	<a href="write.jsp">게시글 쓰기</a><br>
	<a href="index.jsp">로그아웃</a>
	<%}%>
	
	<%
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	%>
	</div>
</body>
</html>