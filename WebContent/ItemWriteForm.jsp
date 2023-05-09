<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이템의 정보 입력</title>
</head>
<body>
	<h2>아이템의 정보 입력 폼</h2>
	<form method="post" action="ItemServlet">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="30"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" size="40"></td>
			</tr>
			<tr>
				<td>설명</td>
				<td><input type="text" name="description" size="100"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>