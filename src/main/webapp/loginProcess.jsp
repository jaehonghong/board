<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
    <%request.setCharacterEncoding("UTF-8"); %>
<%
	String id=request.getParameter("id");
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/testdb3";
		conn = DriverManager.getConnection(url,"java","java");
		
		pstmt=conn.prepareStatement("SELECT * FROM message_id WHERE id=?");
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){			
				String level = rs.getString("level");
				session.setAttribute("id",id);
				session.setAttribute("level", level);
				out.println("<script>");
				out.println("location.href='come.jsp'");
				out.println("</script>");			
		}
		out.println("<script>");
		out.println("실패");
		out.println("</script>");
		
		
	}
	catch(Exception e){
		out.println("<script>");
		out.println("실패");
		out.println("</script>");
		e.printStackTrace();
	}finally{
		try{
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
%>