package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.util.DBUtil;

public class ArticleDao {
	private Connection dbConn;

	public ArticleDao(Connection dbConn) {
		this.dbConn = dbConn;
	}
	
	// 리스트 출력
	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId) {
		String sql = "";

		itemsInAPage = 10;
		int limitFrom = (page - 1) * itemsInAPage;

		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");
		if (cateItemId != 0) {
			sql += String.format("AND cateItemId = %d ", cateItemId);
		}
		sql += String.format("ORDER BY id DESC ");
		sql += String.format("LIMIT %d, %d ", limitFrom, itemsInAPage);
		List<Map<String, Object>> rows = DBUtil.selectRows(dbConn, sql);
		List<Article> articles = new ArrayList<>();
		for (Map<String, Object> row : rows) {
			articles.add(new Article(row));
		}

		return articles;
	}
	
	// id에 맞는 게시물 가져오기
	public Article getArticle(int id) {
		String sql = "";

		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE id = %d ", id);

		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);

		return new Article(row);
	}

	// 카테고리 번호에 맞는 리스트
	public int getForPrintListArticlesCount(int cateItemId) {
		String sql = "";

		sql += String.format("SELECT COUNT(*) AS cnt ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");
		if (cateItemId != 0) {
			sql += String.format("AND cateItemId = %d ", cateItemId);
		}

		int count = DBUtil.selectRowIntValue(dbConn, sql);
		return count;
	}
}