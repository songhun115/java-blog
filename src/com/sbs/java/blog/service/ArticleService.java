package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;

import com.sbs.java.blog.dao.ArticleDao;
import com.sbs.java.blog.dto.Article;

public class ArticleService {

	private ArticleDao articleDao;

	public ArticleService(Connection dbConn) {
		articleDao = new ArticleDao(dbConn);
	}

	// 리스트 출력
	public List<Article> getForPrintListArticles(int page, int itemsInAPage, int cateItemId) {
		return articleDao.getForPrintListArticles(page, itemsInAPage, cateItemId);
	}
	
	// id에 맞는 게시물 가져오기
	public Article getArticle(int cateItemI) {
		return articleDao.getArticle(cateItemI);
	}
	
	// 카테고리 번호에 맞는 리스트
	public int getForPrintListArticlesCount(int cateItemId) {
		return articleDao.getForPrintListArticlesCount(cateItemId);
	}

}