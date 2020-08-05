<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/write.css" />

<style>
/* 라이브러리 */
.form__container {
	max-width: 1200px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid red;
}

.form1 {
	display: block;
	width: 100%;
}

.form__box {
	display: flex;
	align-items: center;
}

.form1 .form__box:not(:first-child) {
	margin-top: 10px;
}

.form1 .form__box>.labal {
	width: 100px;
}

.form1 .form__box>.input {
	flex-grow: 1;
}

.form1 .form__box>.input>input, .form1 .form__box>.input>textarea {
	display: block;
	width: 100%;
	box-sizing: border-box;
	padding: 10px;
}

.form1 .form__box>.input>textarea {
	height: 500px;
}

.form1 .form__box>.input>select {
	padding: 5px;
}

@media ( max-width :700px) {
	.form__box {
		display: block
	}
}
/* 커스텀 */
.form__container {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 1000px;
	border: 1px solid blue;
}
</style>
<div class="form__container">
	<form action="doWrite" class="write__form form1">
		<div class="form__box">
			<div class="labal">카테고리선택</div>
			<div class="input">

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

		<div class="form__box">
			<div class="labal">제목</div>
			<div class="input">
				<input name="title" type="text" placeholder="제목을 입력해주세요." />
			</div>
		</div>
		<div class="form__box">
			<div class="labal">내용</div>
			<div class="input">
				<textarea name="body" placeholder="내용을 입력해주세요."></textarea>
			</div>
		</div>

		<div class="form__box">
			<div class="labal">전송</div>
			<div class="input">
				<input type="submit" value="전송" /> <a href="list">취소</a>
			</div>
		</div>
	</form>
</div>
<%@ include file="/jsp/part/foot.jspf"%>