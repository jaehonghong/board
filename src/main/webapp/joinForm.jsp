<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form name="joinform" action="joinProcess.jsp" method="post">
	아이디 :<input type="text" name="id" id ="id"><br>
	이름 : <input type="text" name="name" id="name"><br>
	<a href="javascript:joinform.submit()">회원가입</a>
</form>

</body>
</html>