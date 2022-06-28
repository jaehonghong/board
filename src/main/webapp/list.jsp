<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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

	Connection conn = null;
	Statement stmt = null;
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/testdb3";
		conn = DriverManager.getConnection(url,"java","java");
	}catch(Exception e){
		out.println("데이터 베이스 접속에 문제가 있습니다<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	stmt = conn.createStatement();
	String sql = "SELECT * FROM message ORDER BY num asc";
	ResultSet rs = stmt.executeQuery(sql);
	
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
	<a href="write.jsp">게시글 쓰기</a>
	<%}%>
	
	<%
	if(stmt != null)
		stmt.close();
	if(conn != null)
		conn.close();
	%>
</body>
</html>