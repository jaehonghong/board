    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
    <%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="utf-8" %>
    <%  request.setCharacterEncoding("UTF-8"); 
	    String title = request.getParameter("title");
	    Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM book_table WHERE title LIKE ? ORDER BY title ASC";				
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
		conn=ds.getConnection();
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
	width:500px;
	background-color:#C9EFFD;
	text-align:center;
	}
	table{
	margin: auto;
	}
	.button{
	background-color : white;
	width : 80px;
	heigth:30px;
	}
</style>
</head>
<body>
<div id="section">
	<h1>인터넷 프로그래머 문고</h1>
	<h3>제목을 입력하세요</h3>
	<form method="post">
	책제목 : <input type="text" name="title"><br>&nbsp;<br>
	<input class="button" type="submit" value="검색"><br>
	<a href="come.jsp">게시판 가기</a><br>
	<a href="index.jsp">로그아웃</a>
	</form>
	<%
		if(title!=null){
	%>
	<%
	
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,"%"+title+"%");

	rs = pstmt.executeQuery();
	
	%>
	<hr>
	<form method="post" action="order_proc.jsp">
	<table border=1 cellpadding = 5>
	<tr>
	<th>주문</th>
	<th>저자</th>
	<th>제목</th>
	<th>가격</th>
	<th>남아있는 수량</th>
	</tr>
	<%
		while(rs.next()){
			int id = rs.getInt("id");
	%>
	<tr>
	<td><input type="checkbox" name="id" value="<%=id %>"></td>
	<td><%=rs.getString("author") %></td>
	<td><%=rs.getString("title") %></td>
	<td><%=rs.getInt("price") %> 원</td>
	<td><%=rs.getInt("qty") %> 권</td>
	</tr>
	<%
		}
	%>
	</table>
	<br> <input class="button" type="submit" value="주문">&nbsp;<input class="button" type="reset" value="초기화">
	</form>
	<a href="<%=request.getRequestURI() %>"><h3>다시 주문하기</h3></a>
	<%
	rs.close();
	pstmt.close();
	conn.close();
		}
	%>
	</div>
</body>
</html>