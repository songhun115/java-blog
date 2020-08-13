<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/article.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/main.css" />
<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>

<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<style>
.reply__container {
	height: 300px;
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

								</c:if>
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
				<div con>
					<script type="text/x-templete" id="origin1" style="display: none;">${article.bodyForXTemplate}</script>
					<div id="viewer1"></div>
					<script>
						var editor1__initialValue = getBodyFromXTemplate('#origin1');
						console.log(editor1__initialValue);
						var editor1 = new toastui.Editor({
							el : document.querySelector('#viewer1'),
							height : '600px',
							initialValue : editor1__initialValue,
							viewer : true,
							plugins : [
									toastui.Editor.plugin.codeSyntaxHighlight,
									youtubePlugin, replPlugin, codepenPlugin ]
						});
					</script>
				</div>
			</div>
		</div>

		<div class="reply__container">
			<div class="con reply__box">
				<ul class="reply__list">
					<c:forEach items="${articles}" var="article">
						<li class="article__item"><span> <a
								href="./detail?id=${article.id}"> ㅋㅋ </a>
						</span> <span> <a href="./detail?id=${article.id}">${article.regDate}</a>
						</span> <span> <a href="./detail?id=${article.id}">${article.title}</a>
						</span> <span>
								<ul class="right__box">
									<c:if test="${article.extra.deleteAvailable}">
										<li><a
											onclick="if( confirm('삭제하시겠습니까?') == false ) return false;"
											href="./delete?id=${article.id}">삭제</a></li>
									</c:if>
									<c:if test="${article.extra.deleteAvailable}">
										<li><a href="./modify?id=${article.id}">수정</a></li>
									</c:if>

								</ul>
						</span></li>

					</c:forEach>
				</ul>
			</div>
		</div>




		<div class="form__container">
		
			<form action=doWriteReply method="POST" class="write__form form1">
				<input name="articleId" type="hidden" value="${article.id}" />
				<div class="form__box form__body">
					<div class="input">
						<textarea name="replyBody" placeholder="댓글을 입력해주세요."></textarea>
					</div>
				</div>

				<div class="form__box form__send">
					<div class="input">
						<input type="submit" value="전송" /> <a href="detail">취소</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>



<%@ include file="/jsp/part/foot.jspf"%>