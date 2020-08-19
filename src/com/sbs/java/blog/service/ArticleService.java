package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dao.ArticleDao;
import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Reply;
import com.sbs.java.blog.util.Util;

public class ArticleService extends Service {

	private ArticleDao articleDao;

	public ArticleService(Connection dbConn) {

		articleDao = new ArticleDao(dbConn);
	}

	// 게시물 다 가져오기
	public List<Article> getForPrintListArticles(int actorId, int page, int itemsInAPage, int cateItemId,
			String searchKeywordType, String searchKeyword) {

		List<Article> articles = articleDao.getForPrintListArticles(page, itemsInAPage, cateItemId, searchKeywordType,
				searchKeyword);

		for (Article article : articles) {
			updateArticleExtraDateForPrint(article, actorId);
		}

		return articles;
	}

	public List<Reply> getForPrintListArticleReply(int actorId, int id, int cateItemId) {

		List<Reply> replys = articleDao.getForPrintListArticleReplays(actorId, id, cateItemId);

		for (Reply reply : replys) {
			updateArticleExtraDateForPrintReply(reply, actorId);
		}
		return replys;
	}

	private void updateArticleExtraDateForPrintReply(Reply reply, int id) {
		boolean deleteAvailable = Util.isSuccess(getCheckRsDeleteAvailableReply(reply, id));
		reply.getExtra().put("deleteAvailable", deleteAvailable);

		boolean modifyAvailable = Util.isSuccess(getCheckRsModifyAvailableReply(reply, id));
		reply.getExtra().put("modifyAvailable", modifyAvailable);

	}

	private void updateArticleExtraDateForPrint(Article article, int actorId) {
		boolean deleteAvailable = Util.isSuccess(getCheckRsDeleteAvailable(article, actorId));
		article.getExtra().put("deleteAvailable", deleteAvailable);

		boolean modifyAvailable = Util.isSuccess(getCheckRsModifyAvailable(article, actorId));
		article.getExtra().put("modifyAvailable", modifyAvailable);

	}

	// 개시물 개수
	public int getForPrintListArticlesCount(int cateItemId, String searchKeywordType, String searchKeyword) {
		return articleDao.getForPrintListArticlesCount(cateItemId, searchKeywordType, searchKeyword);
	}

	// id에 해당하는 게시물 가져오기
	public Article getForPrintArticle(int id) {
		return articleDao.getForPrintArticle(id);
	}
	
	// id에 해당하는 댓글 가져오기
	public Reply getForPrintArticleReply(int id) {
		return articleDao.getForPrintArticleReply(id);
	}

	// 카테고리들 다 가져오기
	public List<CateItem> getForPrintCateItems() {
		return articleDao.getForPrintCateItems();
	}

	// 카테고리 아이디 불러오기
	public CateItem getCateItem(int cateItemId) {
		return articleDao.getCateItem(cateItemId);
	}

	// 게시물 작성
	public int write(int cateItemId, String title, String body, int logindMemberId) {
		return articleDao.write(cateItemId, title, body, logindMemberId);
	}

	// 댓글 작성
	public int doActionDoArticleReply(String replyBody, int logindMemberId, int articleId) {
		return articleDao.doActionDoArticleReply(replyBody, logindMemberId, articleId);
	}

	// 게시물 조회수 기능
	public void increaseHit(int id) {
		articleDao.increaseHit(id);
	}

	// 게시물 삭제
	public int articleDelete(int id) {
		return articleDao.articleDelete(id);
	}
	//댓글 삭제
	public int replyDelete(int id) {
		return articleDao.replyDelete(id);
	}

	// 게시물 수정
	public int modify(int cateItemId, String title, String body, int id) {
		return articleDao.modify(cateItemId, title, body, id);

	}
	
	//댓글 수정
	public int replyModify(String body, int id) {
		return articleDao.replyModify( body, id);
		
	}

	private Map<String, Object> getCheckRsModifyAvailable(Article article, int actorId) {
		return getCheckRsDeleteAvailable(article, actorId);
	}

	// 게시물 수정삭제 확인절차
	private Map<String, Object> getCheckRsDeleteAvailable(Article article, int actorId) {

		Map<String, Object> rs = new HashMap<>();

		if (article == null) {
			rs.put("resultCode", "F-1");
			rs.put("msg", "존재하지 않는 게시물입니다.");

			return rs;
		}

		if (article.getMemberId() != actorId) {
			rs.put("resultCode", "F-2");
			rs.put("msg", "작성자 본인이 아닙니다.");

			return rs;
		}

		rs.put("resultCode", "S-1");
		rs.put("msg", "작업이 가능합니다.");

		return rs;
	}

	public Map<String, Object> getCheckRsDeleteAvailable(int id, int actorId) {

		Article article = articleDao.getForPrintArticle(id);

		return getCheckRsDeleteAvailable(article, actorId);
	}

	// 게시물 수정삭제 확인절차
	private Map<String, Object> getCheckRsDeleteAvailableReply(Reply reply, int actorId) {

		Map<String, Object> rs = new HashMap<>();

		if (reply == null) {
			rs.put("resultCode", "F-1");
			rs.put("msg", "존재하지 않는 댓글입니다.");

			return rs;
		}

		if (reply.getMemberId() != actorId) {
			rs.put("resultCode", "F-2");
			rs.put("msg", "작성자 본인이 아닙니다.");

			return rs;
		}

		rs.put("resultCode", "S-1");
		rs.put("msg", "작업이 가능합니다.");

		return rs;
	}

	private Map<String, Object> getCheckRsModifyAvailableReply(Reply reply, int actorId) {

		Map<String, Object> rs = new HashMap<>();

		if (reply == null) {
			rs.put("resultCode", "F-1");
			rs.put("msg", "존재하지 않는 댓글입니다.");

			return rs;
		}

		if (reply.getMemberId() != actorId) {
			rs.put("resultCode", "F-2");
			rs.put("msg", "작성자 본인이 아닙니다.");

			return rs;
		}

		rs.put("resultCode", "S-1");
		rs.put("msg", "작업이 가능합니다.");

		return rs;
	}

	public Map<String, Object> getCheckRsDeleteAvailableReply(int id, int actorId) {
		Reply reply = articleDao.getForPrintArticleReply(id);

		return getCheckRsDeleteAvailableReply(reply, actorId);
	}

	public Map<String, Object> getCheckRsModifyAvailableReply(int id, int actorId) {
		Reply reply = articleDao.getForPrintArticleReply(id);

		return getCheckRsModifyAvailableReply(reply, actorId);
		
	}

	



}