package com.sbs.java.blog.servelt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.util.DBUtil;

@WebServlet("/s/article/detail")
public class ArticleDetailServlet extends HttpServlet {	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Article> getArticles; {
			String url = "jdbc:mysql://localhost:3306/blog?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
			String user = "sbsst";
			String password = "sbs123414";
			String driverName = "com.mysql.cj.jdbc.Driver";
		
			String sql = "";
			String id = request.getParameter("id");

			sql += String.format("SELECT * ");
			sql += String.format("FROM article ");
			sql += String.format("WHERE id = %s ",id);

			Connection conn = null;
			List<Article> articles = new ArrayList<>();

			try {
				Class.forName(driverName);
				conn = DriverManager.getConnection(url, user, password);

				List<Map<String, Object>> rows = DBUtil.selectRows(conn, sql);

				for (Map<String, Object> row : rows) {
					articles.add(new Article(row));
				}

			} catch (ClassNotFoundException e) {
				System.err.println("[ClassNotFoundException 예외] ");
				System.err.println("msg : " + e.getMessage());

			} catch (SQLException e) {
				System.err.println("[SQLException 예외] ");
				System.err.println("msg : " + e.getMessage());
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						System.err.println("[SQLException 예외] ");
						System.err.println("msg : " + e.getMessage());
					}
				}
			}

			request.setAttribute("articles", articles);
			request.getRequestDispatcher("/jsp/article/detail.jsp").forward(request, response);
			

		}
	

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
