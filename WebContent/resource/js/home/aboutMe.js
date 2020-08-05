const navbarMenu = document.querySelector(".home__container"); //<- 변수 선언 navbarMenu는 navbar__menu이다
const homeheight = home.getBoundingClientRect().height;
navbarMenu.addEventListener("click", (event) => {
  //<- 클릭시 이벤트 발생
  const target = event.target;

  const link = target.dataset.link;
  console.log(target);
  console.log(link);
  if (link == null) {
    return;
  }
  navbarMenu.classList.remove("open");
  scrollIntoView(link); // <- 이 아래 함수를 불러다 아이디만 적어주면 그 아이디위치로 이동
});
const toggleBar = document.querySelector(".menu__icon");
toggleBar.addEventListener("click", () => {
  navbarMenu.classList.toggle("open");
});

function scrollIntoView(selector) {
  const scrollTo = document.querySelector(selector);
  scrollTo.scrollIntoView({ behavior: "smooth" });
}
const upButton = document.querySelector("#up__Button");
document.addEventListener("scroll", () => {
  if (window.scrollY > homeheight / 2) {
    upButton.classList.add("visible");
  } else {
    upButton.classList.remove("visible");
  }
});

// upButton을 클릭하면 홈으로 이동하는 함수
upButton.addEventListener("click", () => {
  scrollIntoView("#home");
});
