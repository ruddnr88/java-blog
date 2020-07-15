package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;


import com.sbs.java.blog.dao.ArticleDao;
import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;

public class ArticleService extends Service {

	private ArticleDao articleDao;

	public ArticleService(Connection dbConn) {
		articleDao = new ArticleDao(dbConn);
	}

	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId, String searchKeywordType,
			String searchKeyword) {
		return articleDao.getForPrintListArticles(page, itemsInAPage, cateItemId, searchKeywordType, searchKeyword);
	}

	public int getForPrintListArticlesCount(int cateItemId, String searchKeywordType, String searchKeyword) {
		return articleDao.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
	}

	public Article getForPrintArticle(int id, int cateItemId) {
		return articleDao.getForPrintArticle(id, cateItemId);
	}

	public List<CateItem> getForPrintCateItems() {
		return articleDao.getForPrintCateItems();
	}

	public CateItem getCateItem(int cateItemId) {
		return articleDao.getCateItem(cateItemId);
	}

	public int write(int cateItemId, String title, String body,int memberId) {
		return articleDao.write(cateItemId, title, body,memberId);
	}

	public void increaseHit(int id) {
		articleDao.increaseHit(id);

	}

	public int delete(int id) {
		return articleDao.delete(id);
	}

	public int modify(int cateItemId, String title, String body, int id) {
		return articleDao.modify(cateItemId, title, body, id);
	}

	public int replywrite(String body, int articleId) {
		return articleDao.replywrite(body, articleId);
	}

	public int getForPrintListReplyCount() {
		return articleDao.getForPrintListReplyCount();
	}

}