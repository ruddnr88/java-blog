
package com.sbs.java.blog.servelt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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

@WebServlet("/s/article/list")
public class ArticleListServelt extends HttpServlet {
	private List<Article> getArticles(int cateItemId, int page) {
		String url = "jdbc:mysql://site26.iu.gy:3306/site26?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "site26";
		String password = "sbs123414";
		String driverName = "com.mysql.cj.jdbc.Driver";

		int itemInAPage = 5;
		int limitFrom = (page - 1) * itemInAPage;

		String sql = "";

		List<Article> articles = new ArrayList<>();
//		int totalCount = articles.size();
//		int totalPage = (int) Math.ceil((double) totalCount / itemInAPage);

		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");

		if (cateItemId != 0) {
			sql += String.format("AND cateItemId = %d ", cateItemId);
		}

		sql += String.format("ORDER BY id DESC ");
		sql += String.format("LIMIT %d, %d ", limitFrom, itemInAPage);

		Connection conn = null;

		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, password);

			List<Map<String, Object>> rows = DBUtil.selectRows(conn, sql);

			for (Map<String, Object> row : rows) {
				articles.add(new Article(row));
			}

		} catch (ClassNotFoundException e) {
			System.err.println("[ClassNotFoundException 예외]");
			System.err.println("msg : " + e.getMessage());
		} catch (SQLException e) {
			System.err.println("[SQLException 예외]");
			System.err.println("msg : " + e.getMessage());
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					System.err.println("[SQLException 예외]");
					System.err.println("msg : " + e.getMessage());
				}
			}
		}

		return articles;
	}

	private Article getcateItemId(int cateItemId) {
		String sql = "";

		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");
		sql += String.format("AND cateItemId = %d ", cateItemId);
		sql += String.format("ORDER BY id DESC LIMIT 0,5");

		return new Article();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");

		int cateItemId;
		int page;

		if (req.getParameter("cateItemId") == null) {
			cateItemId = 0;
		} else {
			cateItemId = Integer.parseInt(req.getParameter("cateItemId"));
		}

		if (req.getParameter("page") == null) {
			page = 1;

		} else {
			page = Integer.parseInt(req.getParameter("page"));
		}

		List<Article> articles = getArticles(cateItemId, page);

		req.setAttribute("articles", articles);
		req.getRequestDispatcher("/jsp/article/list.jsp").forward(req, resp);
	}
}