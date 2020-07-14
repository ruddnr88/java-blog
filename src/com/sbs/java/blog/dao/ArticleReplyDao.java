package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class ArticleReplyDao extends Dao {
	private Connection dbConn;

	public ArticleReplyDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public int replywrite(String body) {
		SecSql sql = new SecSql();

		sql.append("INSERT INTO articleReply");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", articleId = 1 ");
		sql.append(", memberId = 1 "); 
		sql.append(", body = ? ", body);

		return DBUtil.insert(dbConn, sql);
	}
	
	
	public Article getArticleId(int id) {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM articleReply ");
		sql.append("WHERE 1 ");
		sql.append("AND articleId = ? ", id);

		return new Article(DBUtil.selectRow(dbConn, sql));
	}
	
	public List<Article> getForPrintArticleReply() {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM articleReply ");
		sql.append("WHERE 1 ");
		sql.append("ORDER BY id ASC ");

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<Article> Articles = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			Articles.add(new Article(row));
		}

		return Articles;
	}

}
