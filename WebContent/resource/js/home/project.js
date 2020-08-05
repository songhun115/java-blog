const workBtnContainer = document.querySelector(".work_categories");

const projectContainer = document.querySelector(".work__projects");
const projects = document.querySelectorAll(".project");
const homeheight = home.getBoundingClientRect().height;
workBtnContainer.addEventListener("click", (e) => {
  const filter = e.target.dataset.filter || e.target.parentNode.dataset.filter;
  if (filter == null) {
    return;
  }

  const active = document.querySelector(".category__btn.selected");
  active.classList.remove("selected");
  const target =
    e.target.nodeName === "BUTTON" ? e.target : e.target.parentNode;
  target.classList.add("selected");

  projectContainer.classList.add("anim-out");
  setTimeout(() => {
    projects.forEach((project) => {
      if (filter === "*" || filter === project.dataset.type) {
        project.classList.remove("invisible");
      } else {
        project.classList.add("invisible");
      }
    });
    projectContainer.classList.remove("anim-out");
  }, 350);
});

const homeContactBtn = document.querySelector(".project__btn");
homeContactBtn.addEventListener("click", () => {
  scrollIntoView("#work"); //<- 이 아래 함수를 불러다 아이디만 적어주면 그 아이디위치로 이동
});

// 화면을 선택한 section의 위치로 이동 시키는 함수
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
