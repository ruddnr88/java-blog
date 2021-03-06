package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.ArticleReply;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class ArticleDao extends Dao {
	private Connection dbConn;

	public ArticleDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	// 리스트
	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId, String searchKeywordType,
			String searchKeyword) {
		SecSql sql = new SecSql();

		int limitFrom = (page - 1) * itemsInAPage;

		sql.append("SELECT *");
		sql.append(", IFNULL(M.name, '탈퇴한회원') AS extra__writer");
		sql.append("FROM article AS A");
		sql.append("LEFT JOIN `member` AS M");
		sql.append("ON A.memberId = M.id");
		sql.append("WHERE A.displayStatus = 1");
		if (cateItemId != 0) {
			sql.append("AND A.cateItemId = ?", cateItemId);
		}
		if (searchKeywordType.equals("title") && searchKeyword.length() > 0) {
			sql.append("AND A.title LIKE CONCAT('%', ?, '%')", searchKeyword);
		}
		sql.append("ORDER BY A.id DESC ");
		sql.append("LIMIT ?, ? ", limitFrom, itemsInAPage);

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<Article> articles = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}

		return articles;
	}
	
	//게시물 수(검색기능도 같이)
	public int getForPrintListArticlesCount(int cateItemId, String searchKeywordType, String searchKeyword) {
		SecSql sql = new SecSql();

		sql.append("SELECT COUNT(*) AS cnt ");
		sql.append("FROM article ");
		sql.append("WHERE displayStatus = 1 ");

		if (cateItemId != 0) {
			sql.append("AND cateItemId = ? ", cateItemId);
		}

		if (searchKeywordType.equals("title") && searchKeyword.length() > 0) {
			sql.append("AND title LIKE CONCAT('%', ?, '%')", searchKeyword);
		}

		int count = DBUtil.selectRowIntValue(dbConn, sql);
		return count;
	}

	public Article getForPrintArticle(int id) {
		
		SecSql sql = new SecSql();

		sql.append("SELECT A.*");
		sql.append(", IFNULL(M.name, '탈퇴한회원') AS extra__writer");
		sql.append("FROM article AS A");
		sql.append("LEFT JOIN member AS M");
		sql.append("ON A.memberId = M.id");
		sql.append("WHERE A.displayStatus = 1");
		sql.append("AND A.id = ?", id);
		
		return new Article(DBUtil.selectRow(dbConn, sql));
	}

	public List<CateItem> getForPrintCateItems() {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM cateItem ");
		sql.append("WHERE 1 ");
		sql.append("ORDER BY id ASC ");

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<CateItem> cateItems = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			cateItems.add(new CateItem(row));
		}

		return cateItems;
	}

	public CateItem getCateItem(int cateItemId) {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM cateItem ");
		sql.append("WHERE 1 ");
		sql.append("AND id = ? ", cateItemId);

		return new CateItem(DBUtil.selectRow(dbConn, sql));
	}

	public int write(int cateItemId, String title, String body, int memberId) {
		SecSql sql = new SecSql();

		sql.append("INSERT INTO article");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", hit = 0");
		sql.append(", title = ? ", title);
		sql.append(", body = ? ", body);
		sql.append(", displayStatus = '1'");
		sql.append(", cateItemId = ?", cateItemId);
		sql.append(", memberId =?", memberId);

		return DBUtil.insert(dbConn, sql);
	}

	public int increaseHit(int id) {
		SecSql sql = SecSql.from("UPDATE article");
		sql.append("SET hit = hit + 1");
		sql.append("WHERE id = ?", id);

		return DBUtil.update(dbConn, sql);

	}

	public int delete(int id) {

		SecSql sql = new SecSql();

		sql.append("DELETE FROM article ");
		sql.append("WHERE id = ? ", id);

		return DBUtil.update(dbConn, sql);

	}

	public int modify(int cateItemId, String title, String body, int id) {
		SecSql sql = new SecSql();

		sql.append("UPDATE article");
		sql.append("SET updateDate = NOW()");
		sql.append(", title = ? ", title);
		sql.append(", body = ? ", body);
		sql.append(", displayStatus = '1'");
		sql.append(", cateItemId = ?", cateItemId);
		sql.append(" WHERE id = ?", id);

		return DBUtil.update(dbConn, sql);
	}
	
	public ArticleReply getForPrintArticleReply(int id) {

		SecSql sql = new SecSql();

		sql.append("SELECT *");
		sql.append("FROM articleReply");
		sql.append("WHERE id = ?", id);
		
		return new ArticleReply(DBUtil.selectRow(dbConn, sql));
	}

	public int replywrite(String body, int articleId, int memberId) {
		SecSql sql = new SecSql();

		sql.append("INSERT INTO articleReply");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", articleId = ? ", articleId);
		sql.append(", memberId = ? ", memberId);
		sql.append(", body = ? ", body);

		return DBUtil.insert(dbConn, sql);
	}

	public List<ArticleReply> getArticleRepliesList(int articleId) {

		SecSql sql = SecSql.from("SELECT * ");
		sql.append(", M.nickname AS extra__writer");
		sql.append("FROM articleReply AS AR");
		sql.append("INNER JOIN `member` AS M");
		sql.append("ON AR.memberId = M.id");
		sql.append("WHERE AR.articleId = ?", articleId);
		sql.append("ORDER BY AR.id DESC ");

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<ArticleReply> articleReplies = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articleReplies.add(new ArticleReply(row));
		}
		return articleReplies;
	}

	public void modifyReply(String body,int id) {
		
		SecSql sql = SecSql.from("UPDATE articleReply");
		sql.append("SET updateDate = NOW()");
		sql.append(", body = ?",body);
		sql.append("WHERE id = ?", id);

		DBUtil.update(dbConn, sql);

	}

	public int deleteReply(int id) {
		SecSql sql = new SecSql();

		sql.append("DELETE FROM articleReply ");
		sql.append("WHERE id = ? ", id);

		return DBUtil.update(dbConn, sql);
		
	}

	public int getReplyCount(int id) {
		SecSql sql = new SecSql();

		sql.append("SELECT COUNT(*) AS cnt ");
		sql.append("FROM articleReply");
		sql.append("WHERE articleId = ? ", id);

		int count = DBUtil.selectRowIntValue(dbConn, sql);
		return count;
	}



}
