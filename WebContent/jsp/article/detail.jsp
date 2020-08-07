<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<%
	Article article = (Article) request.getAttribute("article");
String cateItemName = (String) request.getAttribute("cateItemName");
%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/article.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/main.css" />
<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/common.js"></script>

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
			<div class="detail__title">
				<%=article.getTitle()%>
			</div>
			<div class="detail__list">
				<ul class="detail__ul">
					<li class="detail__item">개발성훈</li>
					<li class="detail__item"><a href="<%=article.getId()%>"><%=cateItemName%></a></li>
					<li class="detail__item">조회수 : <%=article.getHit()%></li>
					<li class="detail__item"><%=article.getRegDate()%></li>
					<li class="detail__item"><a
						href="./delete?id=<%=article.getId()%>">삭제</a></li>
					<li class="detail__item"><a
						href="./modify?id=<%=article.getId()%>">수정</a></li>

				</ul>
			</div>
			<div class="detail__body">
				<div con>
					<script type="text/x-templete" id="origin1" style="display: none;"><%=article.getBodyForXTemplate()%></script>
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
	</div>

</div>



<%@ include file="/jsp/part/foot.jspf"%>