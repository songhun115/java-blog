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
	private List<Article> getArticles() {
		String url = "jdbc:mysql://site37.iu.gy:3306/site37?serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true";
		String user = "site37";
		String password = "sbs123414";
		String driverName = "com.mysql.cj.jdbc.Driver";
		
		List<Article> articles = new ArrayList<>();
		
		Connection connection = null;
		
		String sql = "";
		
		sql += String.format("SELECT * ");
		sql += String.format("FROM article ");
		sql += String.format("ORDER BY id DESC ");
		
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
		}
		finally {
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
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		List<Article> articles = getArticles();
		
		request.setAttribute("articles", articles);
		request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
