<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	ResultSet rs = null;
	String sql;
	Connection conn = null;
	Statement stmt = null;
try{
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/testdb3";
		conn = DriverManager.getConnection(url,"java","java");
	}
	catch(Exception e){
		out.println("������ ���̽� ���ӿ� ������ �ֽ��ϴ�<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
	stmt = conn.createStatement();
	
	sql= "INSERT INTO message_id "+
			"(id, name) "+
			"VALUES("+"'"+id+"','"+name+"');";
	try{
		stmt.executeUpdate(sql);
	}catch(Exception e){
		out.println("������ ���̽� ���Կ� ������ �ֽ��ϴ�<hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>ȸ������ �Ϸ�</h3>
<a href="index.jsp">�α��� ��������</a>
</body>
</html>