package com.sbs.java.blog.servelt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s/article/doWrite")
public class ArticleDoWriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		//서버명blog db.sql 확인하고 꼭 실행해야함
		String url = "jdbc:mysql://site26.iu.gy:3306/site26?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "site26";
		String password = "sbs123414";
		String driverName = "com.mysql.cj.jdbc.Driver";
		
		String title = request.getParameter("title");
		String body = request.getParameter("body");

		Connection connection = null;
		Statement stmt = null;
		
		String sql ="";
		sql += String.format("INSERT INTO article ");
		sql += String.format("SET regDate = NOW()");
		sql += String.format(", updateDate = NOW()");
		sql += String.format(", title = '%s'", title);
		sql += String.format(", body = '%s';",body);
		

		try {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url, user, password);
			stmt = connection.createStatement();
			int affectedRows= stmt.executeUpdate(sql);
			
			response.getWriter().append(affectedRows + "개의 데이터가 추가되었습니다.");
			
		} catch (SQLException e) {
			System.err.printf("[SQL 예외] : %s\n", e.getMessage());
		} catch (ClassNotFoundException e) {
			System.err.printf("[드라이버 클래스 로딩 예외] : %s\n", e.getMessage());
		}
		finally {
			//close 안해주면안됨. finally안에서 꼭 클로즈해줘야함. 
			if( connection !=null) {
				try {
					connection.close();
					//close 하려면 커넥터에 널값을 꼭 넣어야함
				} catch (SQLException e) {
					
					System.err.printf("[SQL 예외 , connection 닫기에러] : %s\n", e.getMessage());
				}
			}
			if( stmt !=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					System.err.printf("[SQL 예외 , stmt 닫기에러] : %s\n", e.getMessage());
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
