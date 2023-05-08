package com.mis.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		// 사용자 등록 정보 가져오기
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String admin = request.getParameter("admin");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String uid = "mis";
		String pass = "1234";
		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, ?, ?, ?)";
		
		try{
			
			//1. 드라이버 로딩
 			Class.forName("oracle.jdbc.driver.OracleDriver");
 			
 			//2. Connection 객체 생성
 			conn = DriverManager.getConnection(url, uid, pass);
 			
 			//3. PreparedStatement 객체 얻어오기
 			pstmt = conn.prepareStatement(sql);
 			
 			//4. 값 채우기
 			pstmt.setString(1, name);
 			pstmt.setString(2, userid);
 			pstmt.setString(3, pwd);
 			pstmt.setString(4, email);
 			pstmt.setString(5, phone);
 			pstmt.setInt(6, Integer.parseInt(admin));
 			
 			//5. 쿼리 실행
 			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 리소스 반환
			try {
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		// 페이지 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("01_allMember.jsp");
		dispatcher.forward(request, response);
	}

}
