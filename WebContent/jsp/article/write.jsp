<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/write.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/article.css" />




<script>
	var onBeforeUnloadSetted = false;
	var onBeforeUnload = function(e) {
		return '떠나시겠습니까?'; // 요새 브라우저는 이 메시지가 아닌 자체의 메세지가 나옵니다.
	};

	function applyOnBeforeUnload() {
		console.log("hi~");
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

	function WriteFormSubmit(form) {

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

<div class="form__container">
	<form action="doWrite" method="POST" class="write__form form1"
		onsubmit="WriteFormSubmit(this); return false;">

		<input name="memberId" type="heidden" value="<%=logindMemberId%>" />
		<div class="form__box form__cate">
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
<script src="${pageContext.request.contextPath}/resource/js/write.js"></script>
<%@ include file="/jsp/part/foot.jspf"%>