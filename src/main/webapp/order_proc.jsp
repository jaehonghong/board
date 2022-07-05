<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
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
	#button{
	background-color : white;
	width : 80px;
	heigth:30px;
	}
</style>
</head>
<body>
<div id="section">
<h1>인터넷 프로그래머 서점</h1>
<h3>주문해주셔서 감사합니다</h3>

<%
	String[] ids = request.getParameterValues("id");
	if(ids != null){
%>

		
<%
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mariaDB");
	conn=ds.getConnection();
	String sql;
	int recordUpdated;
%>
<table border=2>
	<tr>
	<th>저자</th>
	<th>제목</th>
	<th>가격</th>
	<th>수량</th>
	</tr>
	<%
	for(int i=0;i<ids.length;i++){
		sql = "UPDATE book_table SET qty = qty-1 where id ="+ids[i];
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		sql = "SELECT * FROM book_table WHERE id="+ids[i];
		rs = pstmt.executeQuery(sql);
		while(rs.next()){
	%>
	<tr>
	<td><%=rs.getString("author") %></td>
	<td><%=rs.getString("title") %></td>
	<td><%=rs.getInt("price") %></td>
	<td><%=rs.getInt("qty") %></td>
	</tr>	
	<%  }
		rs.close();
	}
		conn.close();
		pstmt.close();
	}
	%>
	
</table>
<a href="order.jsp"><h3>주문 화면으로 돌아가기</h3></a>

</div>
</body>
</html>