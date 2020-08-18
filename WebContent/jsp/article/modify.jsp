<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>

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
}
</style>

<script>
	var submitModifyFormDone = false;
	function submitModifyForm(form) {
		if (submitModifyFormDone) {
			alert('처리중입니다.');
			return;
		}
		form.title.value = form.title.value.trim();
		if (form.title.value.length == 0) {
			alert('제목을 입력해주세요.');
			form.title.focus();
			return false;
		}
		var editor = $(form).find('.toast-editor').data('data-toast-editor');
		var body = editor.getMarkdown();
		body = body.trim();
		if (body.length == 0) {
			alert('내용을 입력해주세요.');
			editor.focus();
			return false;
		}
		form.body.value = body;
		form.submit();
		submitModifyFormDone = true;
	}
</script>

<h1>게시글수정</h1>
<div class="form__container">
	<form action="doModify" class="modify__form form1"
		onsubmit="submitModifyForm(this); return false;">

		<input type="hidden" name="id" value="${article.id}"> <input
			type="hidden" name="body">

		<div class="form__box">
			<div class="labal">카테고리선택</div>
			<div class="input">

				<select name="cateItemId">

					<c:forEach items="${cateItems}" var="cateItem">
						<option
							${article.cateItemId == cateItem.id ? 'selected' : 'selected'}
							value="${cateItem.id}">${cateItem.name}</option>
					</c:forEach>
				</select>

			</div>
		</div>


		<div class="form__box">
			<div class="labal">제목</div>
			<div class="input">
				<input value="${article.title}" name="title" type="text"
					placeholder="제목을 입력해주세요." />
			</div>
		</div>


		<div class="form-row">
			<div class="label">내용</div>
			<div class="input">
				<script type="text/x-template">${article.bodyForXTemplate}</script>
				<div class="toast-editor"></div>
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