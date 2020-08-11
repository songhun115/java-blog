<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/write.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/article.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/member/member.css" />

<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>

<script>
	function submitLoginForm(form) {
		form.loginId.value = form.loginId.value.trim();

		if (form.loginId.value.length == 0) {
			alert('로그인 아이디를 입력해주세요.');
			form.loginId.focus();
			return;
		}

		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			alert('로그인 비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		form.submit();
	}
</script>


<div class="article__container">

	<div class="bg__item">
		<img src="${pageContext.request.contextPath}/resource/imgs/bg2.jpg"
			alt="" />
	</div>
	<div class="bg__item">
		<img src="${pageContext.request.contextPath}/resource/imgs/bg1.jpg"
			alt="" />
	</div>
	<div class="bg__item">
		<img src="${pageContext.request.contextPath}/resource/imgs/bg3.jpg"
			alt="" />
	</div>
</div>
<div class="form__container">
	<div class="login__contarner">
		<div class="member">
			<h3>
				회원 정보 입력
				</h2>
		</div>
		<form action="doLogin" method="POST" class="login__form form1"
			onsubmit="submitLoginForm(this); return false;">
			<input type="hidden" name="loginPwReal" />
			<input type="hidden" name="redirectUrl" value="${param.afterLoginRedirectUrl}" />
			<div class="form__box">
				<div class="labal">아이디</div>
				<div class="input">
					<input name="loginId" type="text" placeholder="아이디를 입력해주세요." />
				</div>
			</div>
			<div class="form__box">
				<div class="labal">비밀번호</div>
				<div class="input">
					<input name="loginPw" type="password" placeholder="비밀번호를 입력해주세요." />
				</div>
			</div>

			<div class="form__box">
				<div class="laber">전송</div>
				<div class="input">
					<input type="submit" value="전송" /> <a href="../home/main">취소</a>
				</div>
			</div>

		</form>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf"%>