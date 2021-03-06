package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.ArticleReply;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.util.Util;
import javax.servlet.http.HttpSession;

public class ArticleController extends Controller {
	public ArticleController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	public void beforeAction() {
		super.beforeAction();
		// 이 메서드는 게시물 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		// 필요없다면 지워도 된다.
	}

	public String doAction() {
		switch (actionMethodName) {
		case "list":
			return ActionList();
		case "detail":
			return ActionDetail();
		case "write":
			return ActionWrite();
		case "doWrite":
			return ActionDoWrite();
		case "delete":
			return ActionDelete();
		case "modify":
			return ActionModify();
		case "doModify":
			return ActionDoModify();
		case "doReply":
			return ActionReply();
		case "modifyReply":
			return ActionModifyReply();
		case "doModifyReply":
			return ActiondoModifyReply();
		case "dodelReply":
			return ActionDeleteReply();

		}
		return "";
	}

	private String ActiondoModifyReply() {
		int id = Util.getInt(req, "id");
		String body = req.getParameter("body");

		articleService.modifyReply(body, id);

		return "html:<script> alert('댓글이 수정되었습니다.'); close(); opener.location.reload(); </script>";
	}

	private String ActionDeleteReply() {
		int id = Util.getInt(req, "id");

		int articleId = 0;

		if (!Util.empty(req, "articleId") && Util.isNum(req, "articleId")) {
			articleId = Util.getInt(req, "articleId");
			System.out.println(articleId);
		}

		articleService.deleteReply(id);

		return "html:<script> alert('" + id + "번 댓글이 삭제되었습니다.'); history.back() </script>";
	}

	private String ActionModifyReply() {

		int id = Util.getInt(req, "id");

		ArticleReply articleReplie = articleService.getForPrintArticleReply(id);

		req.setAttribute("articleReplie", articleReplie);
		return "article/replymodify.jsp";

	}

	private String ActionReply() {
		String body = req.getParameter("body");

		int articleId = 0;

		if (!Util.empty(req, "articleId") && Util.isNum(req, "articleId")) {
			articleId = Util.getInt(req, "articleId");
			System.out.println(articleId);
		}

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		articleService.replywrite(body, articleId, loginedMemberId);

		return "html:<script> alert('댓글이 작성되었습니다.'); location.replace('detail?id=" + articleId
				+ "');opener.location.reload(); </script>";
	}

	private String ActionDoModify() {

		int id = Util.getInt(req, "id");

		if (Util.empty(req, "id")) {
			return "Html:id를 입력해주세요.";
		}
		if (Util.isNum(req, "id") == false) {
			return "Html:id를 정수로 입력해주세요.";
		}

		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int cateItemId = Util.getInt(req, "cateItemId");

		articleService.modify(cateItemId, title, body, id);

		return "html:<script> alert('" + id + "번 게시물이 수정되었습니다.'); location.replace('detail?id=" + id + "&cateItemId"
				+ cateItemId + "'); </script>";
	}

	private String ActionModify() {

		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}
		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}
		int id = Util.getInt(req, "id");

		int cateItemId = 0;
		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		String cateItemName = "Total List";

		if (cateItemId != 0) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();
		}

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		Article article = articleService.getForPrintArticle(id);

		req.setAttribute("cateItemName", cateItemName);
		req.setAttribute("article", article);
		return "article/modify.jsp";
	}

	private String ActionDelete() {
		int id = Util.getInt(req, "id");
		if (Util.empty(req, "id")) {
			return "Html:id를 입력해주세요.";
		}
		if (Util.isNum(req, "id") == false) {
			return "Html:id를 정수로 입력해주세요.";
		}

		articleService.delete(id);

		return "html:<script> alert('" + id + "번 게시물이 삭제되었습니다.'); location.replace('list'); </script>";
	}

	private String ActionDoWrite() {
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int cateItemId = Util.getInt(req, "cateItemId");

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		int id = articleService.write(cateItemId, title, body, loginedMemberId);

		return "html:<script> alert('" + id + "번 게시물이 생성되었습니다.'); location.replace('list'); </script>";
	}

	private String ActionWrite() {
		return "article/write.jsp";
	}

	private String ActionDetail() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		int cateItemId = 0;

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}
		String cateItemName = "Total List";

		if (cateItemId != 0) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();
		}

		articleService.increaseHit(id);

		req.setAttribute("cateItemName", cateItemName);
		Article article = articleService.getForPrintArticle(id);

		req.setAttribute("article", article);

		// 댓글총게시물수

		int page = 1;

		if (!Util.empty(req, "page") && Util.isNum(req, "page")) {
			page = Util.getInt(req, "page");
		}
		int itemsInAPage = 10;
		int replyCount = articleService.getReplyCount(id);
		int totalPage = (int) Math.ceil(replyCount / (double) itemsInAPage);

		req.setAttribute("replyCount", replyCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);

		// 댓글리스트
		List<ArticleReply> articleReplies = articleService.getArticleRepliesList(id);
		req.setAttribute("articleReplies", articleReplies);

		return "article/detail.jsp";
	}

	private String ActionList() {
		long startTime = System.nanoTime();

		int page = 1;

		if (!Util.empty(req, "page") && Util.isNum(req, "page")) {
			page = Util.getInt(req, "page");
		}

		int cateItemId = 0;

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		String cateItemName = "Total List";

		if (cateItemId != 0) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();

		}
		req.setAttribute("cateItemName", cateItemName);

		String searchKeywordType = "";

		if (!Util.empty(req, "searchKeywordType")) {
			searchKeywordType = Util.getString(req, "searchKeywordType");
		}

		String searchKeyword = "";

		if (!Util.empty(req, "searchKeyword")) {
			searchKeyword = Util.getString(req, "searchKeyword");
		}

		int itemsInAPage = 10;
		int totalCount = articleService.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
		int totalPage = (int) Math.ceil(totalCount / (double) itemsInAPage);

		req.setAttribute("totalCount", totalCount);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("page", page);

		List<Article> articles = articleService.getForPrintListArticles(page, itemsInAPage, cateItemId,
				searchKeywordType, searchKeyword);

		req.setAttribute("articles", articles);

		long endTime = System.nanoTime();
		long estimatedTime = endTime - startTime;
// nano seconds to seconds
		double seconds = estimatedTime / 1000000000.0;
		System.out.println("seconds: " + seconds);
		return "article/list.jsp";
	}

	@Override
	public String getControllerName() {
		return "article";
	}
}
