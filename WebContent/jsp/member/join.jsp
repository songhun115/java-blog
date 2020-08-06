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

		form.submit();
	}
</script>
<div class="form__container">
	<form action="doJoin" method="POST" class="join__form form1"
		onsubmit="submitJoinForm(this); return false;">

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
			<div class="labal">전송</div>
			<div class="input">
				<input type="submit" value="전송" /> <a href="../home/main">취소</a>
			</div>
		</div>
	</form>
</div>
<%@ include file="/jsp/part/foot.jspf"%>