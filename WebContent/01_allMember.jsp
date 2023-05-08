<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%! // 선언부는 첫 방문자에 의해서 단 한번만 수행
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "mis";
	String pass = "1234";
	String sql = "SELECT * FROM MEMBER";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JDBC</title>
</head>
<body>
	 <table width="800" border="1">
	 	<tr>
	 		<th>이름</th>
	 		<th>아이디</th>
	 		<th>암호</th>
	 		<th>이메일</th>
	 		<th>전화번호</th>
	 		<th>권한(1:관리자, 2:일반유저)</th>
	 	</tr>
	 	
	 	<%
	 		try{
	 			//1. 드라이버 로딩
	 			Class.forName("oracle.jdbc.driver.OracleDriver");
	 			
	 			//2. Connection 객체 생성
	 			conn = DriverManager.getConnection(url, uid, pass);
	 			
	 			//3. Statement 객체 얻어오기
	 			stmt = conn.createStatement();
	 			
	 			//4. 쿼리 실행 후 ResultSet 객체 얻어오기
	 			rs = stmt.executeQuery(sql);
	 			
	 			//5. 결과 출력
	 			while(rs.next()){
	 				out.print("<tr>");
	 				
	 				out.print("<td>" + rs.getString("name") + "</td>");
	 				out.print("<td>" + rs.getString("userid") + "</td>");
	 				out.print("<td>" + rs.getString("pwd") + "</td>");
	 				out.print("<td>" + rs.getString("email") + "</td>");
	 				out.print("<td>" + rs.getString("phone") + "</td>");
	 				out.print("<td>" + rs.getString("admin") + "</td>");
	 				
	 				out.print("</tr>");
	 			}
	 			
	 		}catch (Exception e){
	 			e.printStackTrace();
	 		}
	 	%>
	 	
	 </table>
</body>
</html>