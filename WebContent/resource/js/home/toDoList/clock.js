const clockContainer = document.querySelector(".js-clock"),
  clockTitle = clockContainer.querySelector("h1");
dayTitle = clockContainer.querySelector("h2");

function getTime() {
  const date = new Date();

  var Dday = new Date();
  var week = ["일", "월", "화", "수", "목", "금", "토"];
  const hours = date.getHours();
  const minutes = date.getMinutes();
  const seconds = date.getSeconds();

  clockTitle.innerText = `${hours < 10 ? `0${hours}` : hours}:${
    minutes < 10 ? `0${minutes}` : minutes
  }:${seconds < 10 ? `0${seconds}` : seconds}`;
  /*dayTitle.innerText = `${week[Dday.getDay()] + "요일"}`;*/
}

function init() {
  getTime();
  setInterval(getTime, 1000);
}
init();
