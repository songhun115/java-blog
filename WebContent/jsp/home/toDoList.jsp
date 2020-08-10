<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf" %>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/toDoList.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/main.css" />


<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,600;0,700;1,400&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/5df49777a0.js"
	crossorigin="anonymous"></script>


<!-- 시간 -->
<div class="js-clock">
	<h1>00:00</h1>
</div>
<div class="container">
	<h4 class="js__greetings"></h4>
	<div class="icon__box">
		<a href="index.html"> <i class="fas fa-redo icon"></i>
		</a>
	</div>
</div>

<!-- To Do List -->

<form class="js__toDoForm">
	<input class="inputing" type="text" placeholder="Write a to do List" />
</form>

<div class="formContainer">
	<ul class="js__toDoList"></ul>
</div>

<span class="js__weather"></span>

	<script
	src="${pageContext.request.contextPath}/resource/js/home/toDoList/clock.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/home/toDoList/list.js"></script>
<script>
	const body = document.querySelector("body");

	const img__number = 3;

	function paintImg(randomNumber) {
		const image = new Image();
		image.src = '${pageContext.request.contextPath}/resource/imgs/${randomNumber + 1}.jpg';
		image.style.width = "100%";
		image.classList.add("bgImage");
		body.appendChild(image);
	}

	function genRandom() {
		const number = Math.floor(Math.random() * img__number);
		return number;
	}

	function init() {
		const randomNumber = genRandom();
		paintImg(randomNumber);
	}
	init();
</script>
<%@ include file="/jsp/part/foot.jspf" %>
