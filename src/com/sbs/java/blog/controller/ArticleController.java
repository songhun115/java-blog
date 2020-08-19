package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Reply;
import com.sbs.java.blog.util.Util;

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
			return doActionList();
		case "detail":
			return doActionDetail();
		case "doWrite":
			return doActionDoWrite();
		case "write":
			return doActionWrite();
		case "delete":
			return doActionDelete();
		case "modify":
			return doActionModify();
		case "doModify":
			return doActionDoModify();
		case "doWriteReply":
			return doActionWriteReply();
		case "replyDelete":
			return doActionReplyDelete();
		case "replyModify":
			return doActionReplyModify();
		case "doReplyModify":
			return doActionReplyDoModify();
		}
		return "";
	}

	
	// 게시물 삭제
	private String doActionDelete() {
		int id = Util.getInt(req, "id");

		int loginedMemberId = (int) req.getAttribute("logindMemberId");

		Map<String, Object> getCheckRsDeleteAvailableRs = articleService.getCheckRsDeleteAvailable(id, loginedMemberId);

		if (Util.isSuccess(getCheckRsDeleteAvailableRs) == false) {
			return "html:<script> alert('" + getCheckRsDeleteAvailableRs.get("msg") + "'); history.back(); </script>";
		}

		articleService.articleDelete(id);

		return "html:<script> alert('" + id + "번 게시물이 삭제되었습니다.'); location.replace('list'); </script>";
	}

	// 댓글 삭제
	private String doActionReplyDelete() {

		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		int loginedMemberId = (int) req.getAttribute("logindMemberId");

		Map<String, Object> getCheckRsDeleteAvailableRs = articleService.getCheckRsDeleteAvailableReply(id,
				loginedMemberId);

		if (Util.isSuccess(getCheckRsDeleteAvailableRs) == false) {
			return "html:<script> alert('" + getCheckRsDeleteAvailableRs.get("msg") + "'); history.back(); </script>";
		}

		String redirectUri = Util.getString(req, "redirectUri", "list");

		articleService.replyDelete(id);

		return "html:<script> alert('" + id + "번 댓글이 삭제되었습니다.'); location.replace('" + redirectUri + "'); </script>";
	}

	// 게시물 수정
	private String doActionModify() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		Article article = articleService.getForPrintArticle(id);

		req.setAttribute("article", article);

		return "article/modify.jsp";
	}

	// 댓글 수정
	private String doActionReplyModify() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");
		int loginedMemberId = (int) req.getAttribute("logindMemberId");

		Map<String, Object> getCheckRsModifyAvailableRs = articleService.getCheckRsModifyAvailableReply(id,
				loginedMemberId);

		if (Util.isSuccess(getCheckRsModifyAvailableRs) == false) {
			return "html:<script> alert('" + getCheckRsModifyAvailableRs.get("msg") + "'); history.back(); </script>";
		}
		Reply reply = articleService.getForPrintArticleReply(id);

		req.setAttribute("reply", reply);

		return "article/reply.jsp";
	}

	// 댓글 수정
	private String doActionReplyDoModify() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");
		String body = Util.getString(req, "body");

		int loginedMemberId = (int) req.getAttribute("logindMemberId");

		Map<String, Object> getReplyCheckRsModifyAvailableRs = articleService.getCheckRsModifyAvailableReply(id,
				loginedMemberId);

		if (Util.isSuccess(getReplyCheckRsModifyAvailableRs) == false) {
			return "html:<script> alert('" + getReplyCheckRsModifyAvailableRs.get("msg")
					+ "'); history.back(); </script>";
		}

		articleService.replyModify(body, id);

		String redirectUri = Util.getString(req, "redirectUri", "list");

		return "html:<script> alert('" + id + "번 댓글이 수정되었습니다.');  location.replace('" + redirectUri + "'); </script>";
	}

	// 게시물 수정
	private String doActionDoModify() {
		String title = req.getParameter("title");
		String body = Util.getString(req, "body");
		int cateItemId = Util.getInt(req, "cateItemId");
		int id = Util.getInt(req, "id");

		articleService.modify(cateItemId, title, body, id);

		String redirectUri = Util.getString(req, "redirectUri", "list");

		return "html:<script> alert('" + id + "번 게시물이 수정되었습니다.'); location.replace('" + redirectUri + "'); </script>";
	}

	// 게시물 작성
	private String doActionWrite() {
		return "article/write.jsp";
	}

	// 게시물 작성
	private String doActionDoWrite() {
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		int logindMemberId = (int) req.getAttribute("logindMemberId");
		int cateItemId = Util.getInt(req, "cateItemId");

		int id = articleService.write(cateItemId, title, body, logindMemberId);

		return "html:<script> alert('" + id + "번 게시물이 생성되었습니다.'); location.replace('list'); </script>";
	}

	// 댓글 작성
	private String doActionWriteReply() {
		if (Util.empty(req, "articleId")) {
			return "html:articleId를 입력해주세요.";
		}

		if (Util.isNum(req, "articleId") == false) {
			return "html:articleId를 정수로 입력해주세요.";
		}

		String replyBody = req.getParameter("replyBody");
		int logindMemberId = (int) req.getAttribute("logindMemberId");
		int articleId = Util.getInt(req, "articleId");

		String redirectUri = Util.getString(req, "redirectUri");
		int id = articleService.doActionDoArticleReply(replyBody, logindMemberId, articleId);
		redirectUri = Util.getNewUri(redirectUri, "generatedArticleReplyId", id + "");

		return "html:<script> alert('" + id + redirectUri + "번 댓글이 생성되었습니다.'); location.replace('" + redirectUri
				+ "'); </script>";
	}

	// 게시물 상세페이지
	private String doActionDetail() {
		if (Util.empty(req, "id")) {
			return "html:id를 입력해주세요.";
		}

		if (Util.isNum(req, "id") == false) {
			return "html:id를 정수로 입력해주세요.";
		}

		int id = Util.getInt(req, "id");

		articleService.increaseHit(id);
		Article article = articleService.getForPrintArticle(id);

		req.setAttribute("article", article);

		int cateItemId = 0;

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		String cateItemName = "전체";

		if (cateItemId != 0) {
			CateItem cateItem = articleService.getCateItem(cateItemId);
			cateItemName = cateItem.getName();
		}

		req.setAttribute("cateItemName", cateItemName);

		int loginedMemberId = (int) req.getAttribute("logindMemberId");

		int articleId = article.getId();

		List<Reply> replys = articleService.getForPrintListArticleReply(articleId, id, cateItemId);
		req.setAttribute("replys", replys);
		// 아이디 가져가야함 가져가서 비교 후 가져오기

		return "article/detail.jsp";
	}

	// 게시물 리스트
	private String doActionList() {
		int page = 1;

		if (!Util.empty(req, "page") && Util.isNum(req, "page")) {
			page = Util.getInt(req, "page");
		}

		int cateItemId = 0;

		if (!Util.empty(req, "cateItemId") && Util.isNum(req, "cateItemId")) {
			cateItemId = Util.getInt(req, "cateItemId");
		}

		String cateItemName = "전체";

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
		req.setAttribute("cPage", page);

		int loginedMemberId = (int) req.getAttribute("logindMemberId");

		List<Article> articles = articleService.getForPrintListArticles(loginedMemberId, page, itemsInAPage, cateItemId,
				searchKeywordType, searchKeyword);
		req.setAttribute("articles", articles);

		return "article/list.jsp";
	}

	@Override
	public String getControllerName() {
		return "article";
	}
}