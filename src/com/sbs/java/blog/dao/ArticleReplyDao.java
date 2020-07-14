package com.sbs.java.blog.dao;

import java.sql.Connection;

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

}
