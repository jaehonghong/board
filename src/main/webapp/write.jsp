<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#section{
	margin : 0 auto;
	width:500px;
	height:300px;
	text-align:center;
	padding: 30px;
	}
	table{
	margin: 0 auto;
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
	<h3>게시글 입력 화면</h3>
	<form action="insert.jsp" method="post">
		<table border="2">
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" size="60"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" size="60"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea type="text" name="memo" cols="53" rows="5"></textarea></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" size="60"></td>
			</tr>
			<tr>
			</tr>
		</table>
		<br><br> <input class="button" type="submit" value="게시글 등록"> <input class="button" type="reset" value="다시 쓰기">
	</form>
	<a href="list.jsp">게시글 리스트 보기</a>
	</div>
</body>
</html>