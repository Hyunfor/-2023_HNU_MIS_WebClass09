<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! // 선언부는 첫 방문자에 의해서 단 한번만 수행
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String uid = "mis";
	String pass = "1234";
	String sql = "SELECT * FROM EMPLOYEE";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보 목록</title>
</head>
<body>
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
	 			out.println("<table border=1>");
	 			
	 			//5. 결과 출력
	 			while(rs.next()){
	 				out.print("<tr>");
	 				
	 				out.print("<td>" + rs.getString("name") + "</td>");
	 				out.print("<td>" + rs.getString("address") + "</td>");
	 				out.print("<td>" + rs.getString("ssn") + "</td>");
	 				
	 				out.print("</tr>");
	 			}
	 			out.println("</table>");	
	 		}catch (Exception e){
	 			e.printStackTrace();
	 		} finally {
	 			try {
	 				// 5. 연결 종료
	 				if(rs != null)
	 					rs.close();
	 				if(stmt != null)
	 					stmt.close();
	 				if(conn != null)
	 					conn.close();
	 			}catch(Exception e) {
	 				e.printStackTrace();
	 			}
	 		}
	 	%>
</body>
</html>