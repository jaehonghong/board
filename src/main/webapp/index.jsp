<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	height:150px;
	background-color:#C9EFFD;
	text-align:center;
	}
	#button{
	background-color : white;
	width : 80px;
	heigth:30px;
	}
</style>
</head>
<body>
<form name="loginForm" action="loginProcess.jsp" method="post">
<div id="section">
<h2>���ͳ� ����</h2>
	���̵� : <input type="text" name="id"><br>&nbsp;<br>
	<input id="button" type="submit" value="�α���"><br>
	<a href="joinForm.jsp">ȸ������</a><br>
</div>
</form>

</body>
</html>