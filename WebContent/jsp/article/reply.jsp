<%@ page import="com.sbs.java.blog.util.Util"%>
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
}
</style>

<script>
	var onBeforeUnloadSetted = false;
	var onBeforeUnload = function(e) {
		return '떠나시겠습니까?'; // 요새 브라우저는 이 메시지가 아닌 자체의 메세지가 나옵니다.
	};

	function applyOnBeforeUnload() {
		if (onBeforeUnloadSetted)
			return;
		$(window).bind('beforeunload', onBeforeUnload); // 떠날 때 실행되는 함수를 등록
		onBeforeUnloadSetted = true;
	}

	function removeOnBeforeUnload() {
		$(window).unbind('beforeunload', onBeforeUnload); // 떠날 때 실행되는 함수를 해제
		onBeforeUnloadSetted = false;
	}

	var WriteForm__submitDone = false;

	function submitModifyForm(form) {

		if (WriteForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.title.value = form.title.value.trim();

		if (form.title.value.length == 0) {
			alert('제목을 입력해주세요');
			form.title.focus();
			return;
		}

		form.body.value = form.body.value.trim();

		if (form.body.value.length == 0) {
			alert('내용을 입력해주세요');
			form.body.focus();
			return;
		}

		removeOnBeforeUnload();
		form.submit();
		WriteForm__submitDone = true;
	}

	function WriteForm__init() {
		// 폼의 특정 요소를 건드리(?)면, 그 이후 부터 외부로 이동하는 것에 참견하는 녀석을 작동시킨다.
		$('form.write-form input, form.write-form textarea').keyup(function() {
			applyOnBeforeUnload();
		});

	}

	WriteForm__init();
</script>

<h1>댓글수정</h1>
<div class="form__container">
	<form action="doReplyModify" class="modify__form form1"
		onsubmit="submitModifyForm(this); return false;">
		<input type="hidden" name="id" value="${reply.id}">
		<div class="form__box">
			<div class="labal">내용</div>
			<div class="input">
				<textarea name="body" placeholder="내용을 입력해주세요."
					value="${reply.body}" /></textarea>
					
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