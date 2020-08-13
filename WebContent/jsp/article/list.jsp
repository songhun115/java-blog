<%@ page import="java.util.List"%>
<%@ page import="com.sbs.java.blog.dto.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>

<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/article.css" />
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/article/list.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/common.css" />

<style>
.page-box>ul>li>a {
	padding: 0 10px;
	text-decoration: underline;
	color: #787878;
}

.page-box>ul>li:hover>a {
	color: black;
}

.page-box>ul>li.current>a {
	color: red;
}

.navber__menu__item {
	color: rgba(0, 0, 0, 0.9);
}

.navber__menu__item:hover {
	border: 2px solid black;
}

.right__box {
	display: flex;
}

.right__box>li {
	width: 100%;
}

@media ( max-width : 800px) {
	.head__name>h1 {
		font-size: 60px;
		line-height: 60px;
	}
	.article__item>span:nth-child(1), .article__item>span:nth-child(2),
		.article__item>span:nth-child(3), .article__item>span:nth-child(4) {
		float: none;
	}
	/* 카테고리 시작 */
	.category__list {
		justify-content: center;
	}
	.category__list>div {
		display: none;
	}
	.category__item {
		padding: 5px;
		font-size: 12px;
		display: flex;
		flex-wrap: wrap;
	}
	.category__item>a {
		white-space: nowrap;
		boerder: 1px solid red;
	}
	.category__item:not(:last-child)::before {
		position: absolute;
		clear: both;
		content: "";
		top: 20%;
		right: 0;
		width: 1px;
		height: 50%;
		background-color: black;
	}

	/* 카테고리 끝 */

	/* 폼 시작 */
	.right__box {
		display: none;
	}
	.search-box {
		display: flex;
		justify-content: center;
	}
	.search-box  button {
		font-size: 14px;
	}
	/* 폼 끝 */

	/* 게시물 시작 */
	.article__item {
		flex: none;
	}
	.article__box {
		margin: 0;
	}
	.article__item {
		padding: 10px 5px;
		height: auto;
	}
	.article__item>span {
		padding: 5px;
	}
	.article__item>span:not(:last-child)>a {
		font-size: 12px;
	}
	.
	.article__item>span>a {
		color: )
	}
	.article__item>span:nth-child(2) {
		white-space: nowrap;
	}
	.article__item>span:nth-child(3) {
		overflow: hidden;
		width: 90%;
		text-overflow: ellipsis;
		white-space: nowrap;
		display: block;
	}
	.article__item>span:not(:nth-child(3))>a {
		font-size: 14px;
	}
	.article__item>span:nth-child(3)>a {
		font-size: 16px;
	}
	.article__item>span:nth-child(4) {
		display: none;
	}
	/* 게시물 끝 */

	/* 배경 이미지 시작 */
	.bg__item:nth-child(3)>img {
		width: 300px
	}
	.bg__item:first-child {
		display: none;
	}

	/* 배경 이미지 끝*/
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


	<div class="head__name">
		<h1>
			What is<br> News?
		</h1>
		<p>정성훈 블로그의 새로운 소식을 접해보세요</p>
	</div>
	<div class="category__box">

		<div class="con search-box flex flex-jc-c">
			<form action="${pageContext.request.contextPath}/s/article/list">
				<input type="hidden" name="page" value="1" /> <input type="hidden"
					name="cateItemId" value="${param.cateItemId}" /> <input
					type="hidden" name="searchKeywordType" value="title" /> <input
					type="text" name="searchKeyword" value="${param.searchKeyword}" />
				<button type="submit">
					</a>검색
				</button>
			</form>
			<div class="write">
				<button class="write__btn">
					<a href="${pageContext.request.contextPath}/s/article/write">게시글
						작성</a>
				</button>
			</div>
		</div>



		<ul class="category__list">
			<div class="total">총 게시물 수 : ${totalCount}</div>
			<li class="category__item"><a
				href="${pageContext.request.contextPath}/s/article/list">전체 </a></li>
			<c:forEach items="${cateItems}" var="cateItem">
				<li class="category__item"><a
					href="${pageContext.request.contextPath}/s/article/list?cateItemId=${cateItem.id}">
						${cateItem.name}</a></li>

			</c:forEach>
		</ul>




		<div class="con article__box">
			<ul class="article__list">


				<c:forEach items="${articles}" var="article">
				<li class="article__item"><span> <a
							href="./detail?id=${article.id}"> <!-- article.getExtra().getWriterter %> -->ㅋㅋ
						</a>
					</span> <span> <a href="./detail?id=${article.id}">${article.regDate}</a>
					</span> <span> <a href="./detail?id=${article.id}">${article.title}</a>
					</span> <span>
							<ul class="right__box">
								<c:if test="${article.extra.deleteAvailable}">
									<li>
										<button>
											<a
												onclick="if( confirm('삭제하시겠습니까?') == false ) return false;"
												href="./delete?id=${article.id}">삭제</a>
										</button>
									</li>
								</c:if>
								<c:if test="${article.extra.deleteAvailable}">
									<li>
										<button>
											<a href="./modify?id=${article.id}">수정</a>
										</button>
									</li>
								</c:if>

							</ul> </sapn></li>
				</c:forEach>


			</ul>
		</div>


		<div class="con page-box">
			<ul class="flex flex-jc-c">
				

				
				<c:forEach var="i" begin="1" end="${ totalPage}" step="1">
				<<li class="${i == cPage ? 'current' : ''}"><a
					href="?cateItemId=${param.cateItemId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}&page=${i}"
					class="block">${i}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/resource/js/home/articleList.js"></script>
<%@ include file="/jsp/part/foot.jspf"%>