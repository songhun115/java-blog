<%@ page import="com.sbs.java.blog.util.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%@ include file="/jsp/part/toastUiEditor.jspf"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/article.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/main.css" />
<c:if test="${isLogind}">
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
			var editor = $(form).find('.toast-editor')
					.data('data-toast-editor');
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

		function WriteReplyForm__init() {
			$('.write-reply-form .cancel').click(
					function() {
						var editor = $('.write-reply-form .toast-editor').data(
								'data-toast-editor');
						editor.setMarkdown('');
					});
		}
		$(function() {
			WriteReplyForm__init();
		});
	</script>
</c:if>

<style>
.reply__container {
	height: 300px;
}

.article__replys__list__box>reply__box>reply__list>reply__item.high {
	background-color: red;
}
</style>
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

	<div class="detail__container">
		<div class="detail__box">
			<div class="detail__title">${article.title}</div>
			<div class="detail__list">
				<ul class="detail__ul">
					<li class="detail__item">${article.extra.writer}</li>
					<c:forEach items="${cateItems}" var="cateItem">

						<li class="category__item"><a
							href="${pageContext.request.contextPath}/s/article/list?cateItemId=${cateItem.id}">
								<c:if test="${cateItem.id == article.cateItemId }">
								${cateItem.name}
								</c:if>
						</a></li>
					</c:forEach>
					<li class="detail__item">조회수 : ${article.hit}</li>
					<li class="detail__item">${article.regDate}</li>
					<li class="detail__item"><a
						onclick="if( confirm('삭제하시겠습니까?') == false ) return false;"
						href="./delete?id=${article.id}">삭제</a></li>
					<li class="detail__item"><a href="./modify?id=${article.id}">수정</a></li>
				</ul>
			</div>
			<div class="detail__body">
				<div>
					<script type="text/x-template">${article.bodyForXTemplate}</script>
					<div class="toast-editor toast-editor-viewer"></div>
				</div>
			</div>
		</div>

		<div class="reply__container article__replys__list__box ">
			<div class="con reply__box">
				<ul class="reply__list">
					<c:forEach items="${replys}" var="reply">
						<li class="reply__item"><span> <a
								href="./detail?id=${reply.id}">${reply.body}</a>
						</span> <span> <a href="./detail?id=${reply.id}">${reply.regDate}</a>
						</span> <c:if test="${isLogind}">
								<span>
									<ul class="right__box">
										<li><a
											onclick="if( confirm('삭제하시겠습니까?') == false ) return false;"
											href="./replyDelete?id=${reply.id}&redirectUri=${afterDeleteReplyRedirectUri}">삭제</a></li>
										<li><a
											href="./replyModify?id=${reply.id}&redirectUri=${afterModifyReplyRedirectUri}">수정</a></li>
									</ul>
								</span>
							</c:if></li>
					</c:forEach>
				</ul>
			</div>
		</div>


		<c:if test="${isLogind}">
			<div class="write__reply__form__box">
				<form action=doWriteReply method="POST"
					class="write-reply-form form1"
					onsubmit="WriteFormSubmit(this); return false;">
					<input name="articleId" type="hidden" value="${article.id}" /> <input
						name="redirectUri" type="hidden" value="${currentUri}" />
					<div class="form__box form__body">
						<div class="input">
							<textarea name="replyBody" placeholder="댓글을 입력해주세요."></textarea>
						</div>
					</div>

					<div class="form__box form__send">
						<div class="input">
							<input class="send" type="submit" value="전송" /> <input
								class="cancel" type="button" value="취소" />

						</div>
					</div>
				</form>
			</div>
		</c:if>
	</div>
</div>



<%@ include file="/jsp/part/foot.jspf"%>