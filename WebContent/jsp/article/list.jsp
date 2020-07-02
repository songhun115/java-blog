<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
	int totalPage = (int) request.getAttribute("totalPage");
	int paramPage = (int) request.getAttribute("page");
	int cateItemId = (int) request.getAttribute("cateItemId");
%>

<link rel="stylesheet"href="${pageContext.request.contextPath}/resource/css/article/list.css">

<div class="con">
	<h1>Article List</h1>
	<div class="cateItem">
		<ul>
			<li class="<%=1 == cateItemId ? "current" : ""%>"><a href="?cateItemId=1&page=1">IT/일반</a></li>
			<li class="<%=2 == cateItemId ? "current" : ""%>"><a href="?cateItemId=2&page=1">IT/알고리즘</a></li>
			<li class="<%=3 == cateItemId ? "current" : ""%>"><a href="?cateItemId=3&page=1">IT/백엔드</a></li>
			<li class="<%=4 == cateItemId ? "current" : ""%>"><a href="?cateItemId=4&page=1">IT/프론트엔드</a></li>
			<li class="<%=5 == cateItemId ? "current" : ""%>"><a href="?cateItemId=5&page=1">디자인/피그마</a></li>
			<li class="<%=6 == cateItemId ? "current" : ""%>"><a href="?cateItemId=6&page=1">일상/일반</a></li>
		</ul>
	</div>

	<div class="table-box">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>제목</th>
					<th>등록 날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Article article : articles) {
				%>
				<tr>
					<td><%=article.getId()%></td>
					<td><a href="./detail?id=<%=article.getId()%>"><%=article.getTitle()%></a></td>
					<td><%=article.getRegDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<div class="page-box">
		<ul class="flex flex-jc-c">
			<%
				for (int i = 1; i <= totalPage; i++) {
			%>
			<li class="<%=i == paramPage ? "current" : ""%>"><a
				href="?page=<%=i%>" class="block"><%=i%></a></li>
			<%
				}
			%>
		</ul>
	</div>
</div>

<%@ include file="/jsp/part/foot.jspf"%>