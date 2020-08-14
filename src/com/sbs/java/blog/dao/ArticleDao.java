package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.sbs.java.blog.util.SecSql;
import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Reply;
import com.sbs.java.blog.util.DBUtil;

public class ArticleDao extends Dao {
	private Connection dbConn;

	public ArticleDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId, String searchKeywordType,
			String searchKeyword) {
		SecSql sql = new SecSql();

		int limitFrom = (page - 1) * itemsInAPage;

		sql.append("SELECT * ");
		sql.append("FROM article ");
		sql.append("WHERE displayStatus = 1 ");
		if (cateItemId != 0) {
			sql.append("AND cateItemId = ? ", cateItemId);
		}
		if (searchKeywordType.equals("title") && searchKeyword.length() > 0) {
			sql.append("AND title LIKE CONCAT('%', ?, '%')", searchKeyword);
		}
		sql.append("ORDER BY id DESC ");
		sql.append("LIMIT ?, ? ", limitFrom, itemsInAPage);

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<Article> articles = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}

		return articles;
	}

	public List<Reply> getForPrintListArticleReplays(int articleId, int id, int cateItemId) {
		SecSql sql = new SecSql();

		sql.append("SELECT * ");
		sql.append("FROM articleReply ");
		sql.append("WHERE displayStatus = 1 ");
		sql.append("AND articleId = ? ", articleId);

		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<Reply> replys = new ArrayList<>();

		for (Map<String, Object> row : rows) {
			replys.add(new Reply(row));
		}
		if (articleId == id) {
			return replys;
		}
		return null;
	}

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

		sql.append("SELECT A.*, M.nickname AS extra__writer ");
		sql.append("FROM article AS A");
		sql.append("INNER JOIN member AS M");
		sql.append("ON A.memberId = M.id");
		sql.append("WHERE 1 ");
		sql.append("AND A.id = ? ", id);
		sql.append("AND A.displayStatus = 1 ");

		return new Article(DBUtil.selectRow(dbConn, sql));
	}

	public Reply getForPrintArticleReply(int id) {
		SecSql sql = new SecSql();

		sql.append("SELECT A.*, M.nickname AS extra__writer ");
		sql.append("FROM articleReply AS A");
		sql.append("INNER JOIN member AS M");
		sql.append("ON A.memberId = M.id");
		sql.append("WHERE 1 ");
		sql.append("AND A.id = ? ", id);
		sql.append("AND A.displayStatus = 1 ");

		return new Reply(DBUtil.selectRow(dbConn, sql));

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

	public int write(int cateItemId, String title, String body, int logindMemberId) {
		SecSql sql = new SecSql();

		sql.append("INSERT INTO article");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", title = ? ", title);
		sql.append(", body = ? ", body);
		sql.append(", displayStatus = '1'");
		sql.append(", MemberId = ?", logindMemberId);
		sql.append(", cateItemId = ?", cateItemId);

		return DBUtil.insert(dbConn, sql);
	}

	// 댓글 작성
	public int doActionDoArticleReply(String replyBody, int logindMemberId, int articleId) {
		SecSql sql = new SecSql();

		sql.append("INSERT INTO articleReply");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", body = ? ", replyBody);
		sql.append(", displayStatus = '1'");
		sql.append(", articleId = ? ", articleId);
		sql.append(", memberId = ?", logindMemberId);

		return DBUtil.insert(dbConn, sql);
	}

	// 게시물 조회 함수 
	public int increaseHit(int id) {
		SecSql sql = SecSql.from("UPDATE article");
		sql.append("SET hit = hit + 1");
		sql.append("WHERE id = ?", id);

		return DBUtil.update(dbConn, sql);
	}

	// 게시물 삭제 함수
	public int articleDelete(int id) {
		SecSql sql = new SecSql();

		sql.append("DELETE FROM article");
		sql.append("WHERE id = ?", id);

		return DBUtil.delete(dbConn, sql);
	}
	
	// 댓글 삭제 함수
	public int replyDelete(int id) {
		SecSql sql = new SecSql();

		sql.append("DELETE FROM articleReply");
		sql.append("WHERE id = ?", id);

		return DBUtil.delete(dbConn, sql);
	}

	// 게시물 수정 함수
	public int modify(int cateItemId, String title, String body, int id) {

		SecSql sql = new SecSql();

		sql.append("UPDATE article");
		sql.append("SET updateDate = NOW()");
		sql.append(", cateItemId = ?", cateItemId);
		sql.append(", title = ? ", title);
		sql.append(", body = ? ", body);
		sql.append(" WHERE id = ? ", id);
		return DBUtil.update(dbConn, sql);
	}

	public int replyModify(String body, int id) {
		SecSql sql = new SecSql();

		sql.append("UPDATE articleReply");
		sql.append("SET updateDate = NOW()");
		sql.append(", body = ? ", body);
		sql.append(" WHERE id = ? ", id);
		return DBUtil.update(dbConn, sql);
	}

	

}
