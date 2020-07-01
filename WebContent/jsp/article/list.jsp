<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	List<Article> articles = (List<Article>) request.getAttribute("articles");
%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/list.css">

<div class="con">
	<h1>Article List</h1>

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
	<%
		for (int i = 1; i <= Math.ceil((double)articles.size()); i++) {
	%>
	<a href="${pageContext.request.contextPath}/s/article/list?cateItemId=${param.cateItemId}&page=<%= i %>"><span><%= i %></span></a>
	<%
		}
	%>
</div>

<%@ include file="/jsp/part/foot.jspf"%>