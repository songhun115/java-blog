<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/project.css" />
	
<section id="home">
	<div class="home__bg">
		<img src="${pageContext.request.contextPath}/resource/imgs/bg.jpg"
			alt="" />
	</div>

	<div class="home__contant">
		<h1 class="home__title">Passion is the project</h1>
		<br />
		<h2 class="home_semi__title">between having a job or having a
			career.</h2>
		<p class="home__text">
			프로젝트를 만들며 얻을 수 있는 최고의 성과는 자신의 성장입니다. <br /> 웹 개발자가 되기까지의 과정과 그 과정을
			통해 성장하는 프로젝트를을 확인해주세요. <br />큰 도약을 위해 노력하는 개발자입니다.
		</p>
		<button class="project__btn">Project</button>
	</div>
</section>

<section id="work" class="section section_container">
	<h1 class="work__title">My work</h1>
	<h3>Projects</h3>
	<div class="work_categories">
		<button class="category__btn selected" data-filter="*">
			All<span class="category__count">8</span>
		</button>
		<button class="category__btn" data-filter="front-end">
			Front-end<span class="category__count">3</span>
		</button>
		<button class="category__btn" data-filter="back-end">
			Back-end<span class="category__count"">3</span>
		</button>
		<button class="category__btn" data-filter="mobile">
			Game<span class="category__count">2</span>
		</button>
	</div>

	<div class="work__projects">
		<a href="https://github.com/songhun115/Momentum-Project" class="project" target="blank" data-type="front-end">
			<img
			src="${pageContext.request.contextPath}/resource/imgs/front-end1.png"
			alt="Front-end" class="project__img" />

			<div class="project__description">
				<h3>Front-end1</h3>
				<span>Clone coding with and CSS</span>
			</div>
		</a> <a href="#" class="project" target="blank" data-type="front-end">

			<img
			src="${pageContext.request.contextPath}/resource/imgs/front-end2.png"
			class="project__img" />
			<div class="project__description">
				<h3>Front-end2</h3>
				<span>Clone coding with and CSS</span>
			</div>
		</a> <a href="#" class="project" target="blank" data-type="front-end">
			<img
			src="${pageContext.request.contextPath}/resource/imgs/front-end3.png"
			alt="Front-end" class="project__img" />
			<div class="project__description">
				<h3>Front-end3</h3>
				<span>Clone coding with and CSS</span>
			</div>
		</a> <a href="#" class="project" target="blank" data-type="back-end">
			<img
			src="${pageContext.request.contextPath}/resource/imgs/back-end1.png"
			alt="back-end" class="project__img" />
			<div class="project__description">
				<h3>back-end1</h3>
				<span>Clone coding with and CSS</span>
			</div>
		</a> <a href="#" class="project" target="blank" data-type="back-end">
			<img
			src="${pageContext.request.contextPath}/resource/imgs/back-end2.png"
			alt="back-end" class="project__img" />
			<div class="project__description">
				<h3>back-end2</h3>
				<span>Clone coding with and CSS</span>
			</div>
		</a> <a href="#" class="project" target="blank" data-type="back-end">
			<img
			src="${pageContext.request.contextPath}/resource/imgs/back-end3.png"
			alt="back-end" class="project__img" />
			<div class="project__description">
				<h3>back-end3</h3>
				<span>Clone coding with and CSS</span>
			</div>
		</a> <a href="https://github.com/songhun115/Up-Down-game" class="project" target="blank" data-type="mobile"> <img
			src="${pageContext.request.contextPath}/resource/imgs/mobile1.png"
			alt="mobile" class="project__img" />
			<div class="project__description">
				<h3>mobile1</h3>
				<span>Clone coding with and CSS</span>
			</div>
		</a> <a href="https://github.com/songhun115/Ipon-Calculator" class="project" target="blank" data-type="mobile"> <img
			src="${pageContext.request.contextPath}/resource/imgs/mobile2.png"
			alt="mobile" class="project__img" />
			<div class="project__description">
				<h3>mobile2</h3>
				<span>Clone coding with and CSS</span>
			</div>
		</a>
	</div>
</section>
<div id="up__Button">
	<i class="fas fa-arrow-circle-up"></i>
</div>
<script
	src="${pageContext.request.contextPath}/resource/js/home/project.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>
<%@ include file="/jsp/part/foot.jspf"%>