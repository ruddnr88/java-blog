package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;

import com.sbs.java.blog.dao.ArticleReplyDao;

public class ArticleReplyService extends Service{
	

	private ArticleReplyDao articleReplyDao;

	public ArticleReplyService(Connection dbConn) {
		articleReplyDao = new ArticleReplyDao(dbConn);
	}

	public int replywrite(String body) {
		return articleReplyDao.replywrite(body);
	}

	
}
