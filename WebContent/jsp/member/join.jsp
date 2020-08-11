<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
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
	function submitJoinForm(form) {
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

		form.loginPwconfirm.value = form.loginPwconfirm.value.trim();

		if (form.loginPwconfirm.value.length == 0) {
			alert('로그인 비밀번호확인 입력해주세요.');
			form.loginPwconfirm.focus();
			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			alert('닉네임을 입력해주세요.');
			form.nickname.focus();
			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			alert('이메일 입력해주세요.');
			form.email.focus();
			return;
		}

		  form.loginPwReal.value = sha256(form.loginPw.value);
		  form.loginPw.value= '';
		  form.loginPwconfirm.value= '';
		  
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
	<div class="join__contarner">
		<div class="member">
			<h3>
				회원 정보 입력
				</h2>
		</div>
		<form action="doJoin" method="POST" class="join__form form1"
			onsubmit="submitJoinForm(this); return false;">
			
			<input type="hidden" name="loginPwReal" />
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
				<div class="labal">비밀번호 확인</div>
				<div class="input">
					<input name="loginPwconfirm" type="password"
						placeholder="비밀번호확인을 입력해주세요." />
				</div>
			</div>
			<div class="form__box">
				<div class="labal">이름</div>
				<div class="input">
					<input name="name" type="text" placeholder="이름을 입력해주세요." />
				</div>
			</div>
			<div class="form__box">
				<div class="labal">닉네임</div>
				<div class="input">
					<input name="nickname" type="text" placeholder="닉네임을 입력해주세요." />
				</div>
			</div>
			<div class="form__box">
				<div class="labal">email</div>
				<div class="input">
					<input name="email" type="email" placeholder="이메일을 입력해주세요." />
				</div>
			</div>


			<div class="form__box">
				<div class="input">
					<input type="submit" value="전송" /> <a href="../home/main">취소</a>
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="/jsp/part/foot.jspf"%>