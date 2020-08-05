const toggle__btn = document.querySelector(".nav__bar__menu__icon");
const nav__bar = document.querySelector(".nav__bar__container");
const menu__container = document.querySelector(".nav__bar__container");
const menu__item = document.querySelector(".nav__bar__container");
const navbar = document.querySelector("#nav__bar");
const navbar__height = navbar.getBoundingClientRect().height;
document.addEventListener("scroll", () => {
  const class__name = "navbar__dark";
  if (window.scrollY > navbar__height) {
    navbar.classList.add(class__name);
  } else {
    navbar.classList.remove(class__name);
  }
});

menu__container.addEventListener("click", (e) => {
  const active = document.querySelector(".navber__menu__item.right");
  e.target.classList.add("right");
  active.classList.remove("right");
});

toggle__btn.addEventListener("click", () => {
  nav__bar.classList.toggle("open");
});
const body = document.querySelector("body");
function init() {}
init();
