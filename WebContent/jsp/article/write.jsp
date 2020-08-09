<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/write.css" />
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/article.css" />



<div class="form__container">
	<form action="doWrite" class="write__form form1">
		<div class="form__box form__cate">
			<div class="input" >

				<select name="cateItemId">
					<%
						for (CateItem cateItem : cateItems) {
					%>
					<option value="<%=cateItem.getId()%>"><%=cateItem.getName()%></option>

					<%
						}
					%>
				</select>

			</div>
		</div>

		<div class="form__box form__title">
			<div class="input">
				<input name="title" type="text" placeholder="제목을 입력해주세요." />
			</div>
		</div>
		<div class="form__box form__body">
			<div class="input">
				<textarea name="body" placeholder="내용을 입력해주세요."></textarea>
			</div>
		</div>

		<div class="form__box form__send">
			<div class="input">
				<input type="submit" value="전송" /> <a href="list">취소</a>
			</div>
		</div>
	</form>
</div>
<%@ include file="/jsp/part/foot.jspf"%>