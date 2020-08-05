<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/aboutMe.css" />

<div id="up__Button">
	<i class="fas fa-arrow-circle-up"></i>
</div>


<section id="home">
	<div class="home__bg">
		<img src="${pageContext.request.contextPath}/resource/imgs/About.jpg"
			alt="" />
	</div>

	<div class="home__contant">
		<ul class="home__container">
			<li class="home__item" data-link="#ability"><a href="#"
				class="home__item__title">
					<div class="home__item__title__list">
						My <br /> <span>ability</span> <span>.</span> <br /> <span
							class="home__item__title__list__name">저의
							능력을 공개합니다</span>
					</div>
			</a></li>
			<li class="home__item" data-link="#skills"><a href="#"
				class="home__item__title">
					<div class="home__item__title__list">
						My <br /> <span>Work </span> <span>.</span> <br /> <span
							class="home__item__title__list__name">저의
							기술을 소개합니다</span>
					</div>
			</a></li>
			<li class="home__item" data-link="#testimonials"><a href="#"
				class="home__item__title">
					<div class="home__item__title__list">
						My <br /> <span>Skills</span> <span>.</span> <br /> <span
							class="home__item__title__list__name">저의
							프로그래밍 스킬을 확인하세요</span>
					</div>
			</a></li>
		</ul>
	</div>
</section>

<section id="ability" class="section section__container">
	<h1>My Ability</h1>
	<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Animi
		facere eligendi id ipsa praesentium dolor numquam temporibus similique
		illo earum sed vel distinctio maiores sequi in, saepe ex possimus
		veritatis!</p>
	<div class="about__majors">
		<div class="major">
			<div class="major__icon">
				<i class="fab fa-html5"></i>
			</div>
			<h2 class="major__title">Front-end</h2>
			<div class="major__description">
				HTML, CSS, JavaScript,<br />React, Web APIs
			</div>
		</div>
		<div class="major">
			<div class="major__icon">
				<i class="fab fa-elementor"></i>
			</div>
			<h2 class="major__title">Back-end</h2>
			<div class="major__description">
				Javs,C <br />JavaScript
			</div>
		</div>
		<div class="major">
			<div class="major__icon">
				<i class="fas fa-mobile-alt"></i>
			</div>
			<h2 class="major__title">Mobile</h2>
			<div class="major__description">
				HTML, CSS, JavaScript,<br />React, Web APIs
			</div>
		</div>
	</div>
	<div class="about__jobs">
		<div class="job">
			<img
				src="${pageContext.request.contextPath}/resource/imgs/joblogo.png"
				alt="WooSong" class="job__logo" />
			<div class="job__description">
				<p class="job__name">WooSong University</p>
				<p class="job__period">2016~2020</p>
			</div>
		</div>
		<div class="job"></div>
	</div>
</section>
<!-- Skills  -->
<section id="skills" class="section">
	<div class="section__container">
		<h1>Skills</h1>
		<h2>Skills & Attributes</h2>
		<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit.
			Laudantium blanditiis, sit a, voluptatem ad ipsum placeat ipsam dolor
			sequi, officiis magnam numquam dolore illo ea. Ipsam eaque laudantium
			modi temporibus!</p>
		<div class="skillset">
			<div class="skillset_left">
				<h3 class="skillset__title">Skills</h3>
				<div class="skill">
					<div class="skill__description">
						<span>Java</span> <span>80%</span>
					</div>
					<div class="skill__bar">
						<div class="skill__value" style="width: 80%;"></div>
					</div>
				</div>
				<div class="skill">
					<div class="skill__description">
						<span>HTML</span> <span>90%</span>
					</div>
					<div class="skill__bar">
						<div class="skill__value" style="width: 90%;"></div>
					</div>
				</div>
				<div class="skill">
					<div class="skill__description">
						<span>CSS</span> <span>90%</span>
					</div>
					<div class="skill__bar">
						<div class="skill__value" style="width: 90%;"></div>
					</div>
				</div>
				<div class="skill">
					<div class="skill__description">
						<span>JavaScript</span> <span>80%</span>
					</div>
					<div class="skill__bar">
						<div class="skill__value" style="width: 80%;"></div>
					</div>
				</div>
				<div class="skill">
					<div class="skill__description">
						<span>PhotoShop</span> <span>99%</span>
					</div>
					<div class="skill__bar">
						<div class="skill__value" style="width: 99%;"></div>
					</div>
				</div>
			</div>
			<div class="skillset_rignt">
				<div class="tools">
					<h3 class="skillset__title">Tools</h3>
					<ul class="tools__list">
						<li><span>Visual Studio Code</span></li>
						<li><span>GitHub</span></li>
						<li><span>Sping</span></li>
						<li><span>Eclrips</span></li>
						<li><span>Mysql</span></li>
					</ul>
				</div>
				<div class="etc">
					<h3 class="skillset__title">Etc</h3>
					<ul class="etc__list">
						<li><sapn>Git</sapn></li>
						<li><sapn>Repl</sapn></li>
						<li><sapn>Font</sapn></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Testimonials  -->
<section id="testimonials" class="section">
	<div class="testimonials__container">
		<h1>testimonials</h1>
		<h3>See what they say about me</h3>
		<div class="testimonials">
			<div class="testimonial">
				<img
					src="${pageContext.request.contextPath}/resource/imgs/testimonials1.png"
					alt="people" class="testimonials__avatar" />

				<div class="testimonials__speech-bubble">
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Exercitationem quo blanditiis ullam laborum voluptatibus vitae hic
						nulla, quibusdam suscipit aperiam numquam aspernatur accusantium
						beatae nihil reiciendis tempora dignissimos molestiae saepe.</p>
					<p class="name">
						<a href="#">ManDoo</a>puppy
					</p>
				</div>
			</div>
			<div class="testimonial">
				<div class="testimonials__speech-bubble">
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Exercitationem quo blanditiis ullam laborum voluptatibus vitae hic
						nulla, quibusdam suscipit aperiam numquam aspernatur accusantium
						beatae nihil reiciendis tempora dignissimos molestiae saepe.</p>
					<p class="name">
						<a href="#">Jindol</a> hamster
					</p>
				</div>
				<img
					src="${pageContext.request.contextPath}/resource/imgs/testimonials2.png"
					alt="people" class="testimonials__avatar" />
			</div>
		</div>
	</div>
</section>
<script
	src="${pageContext.request.contextPath}/resource/js/home/aboutMe.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>
<%@ include file="/jsp/part/foot.jspf"%>