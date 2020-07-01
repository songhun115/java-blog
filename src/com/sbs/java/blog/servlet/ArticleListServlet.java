package com.sbs.java.blog.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Article;
import com.sbs.java.blog.util.DBUtil;

@WebServlet("/s/article/list")
public class ArticleListServlet extends HttpServlet {
	private List<Article> getArticle(int cateItemId) {
		String url = "jdbc:mysql://site37.iu.gy:3306/site37?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "site37";
		String password = "sbs123414";
		String driverName = "com.mysql.cj.jdbc.Driver";

		String sqlPage = "";

		sqlPage += String.format("SELECT COUNT (*) ");
		sqlPage += String.format("FROM article ");
		sqlPage += String.format("WHERE cateItemId = %d ", cateItemId);

		return null;
	}

	private List<Article> getArticles(int cateItemId, int page) {
		String url = "jdbc:mysql://site37.iu.gy:3306/site37?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "site37";
		String password = "sbs123414";
		String driverName = "com.mysql.cj.jdbc.Driver";

		List<Article> articles = new ArrayList<>();

		Connection connection = null;

		String sql = "";

		int itemsInAPage = 5;
		int limitFrom = (page - 1) * itemsInAPage;

		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("WHERE displayStatus = 1 ");

		if (cateItemId != 0) {
			sql += String.format("AND cateItemId = %d ", cateItemId);
		}

		sql += String.format("ORDER BY id DESC LIMIT %d, %d", limitFrom, itemsInAPage);

		try {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url, user, password);
			List<Map<String, Object>> rows = DBUtil.selectRows(connection, sql);

			for (Map<String, Object> row : rows) {
				articles.add(new Article(row));
			}

		} catch (SQLException e) {
			System.err.printf("[SQL 예외] : %s\n", e.getMessage());
		} catch (ClassNotFoundException e) {
			System.err.printf("[드라이버 클래스 로딩 예외] : %s\n", e.getMessage());
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					System.err.printf("[SQL 예외] : %s\n", e.getMessage());
				}
			}
		}

		return articles;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");

		int cateItemId;

		if (request.getParameter("cateItemId") == null) {
			cateItemId = 0;
		} else {
			cateItemId = Integer.parseInt(request.getParameter("cateItemId"));
		}

		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		List<Article> articles = getArticles(cateItemId, page);

		request.setAttribute("articles", articles);
		request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
