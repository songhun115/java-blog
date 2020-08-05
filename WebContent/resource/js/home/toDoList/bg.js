const body = document.querySelector("body");

const img__number = 3;

function paintImg(imgNumber) {
  const image = new Image();
  image.src = `${pageContext.request.contextPath}/resource/imgs/${imgNumber + 1}.jpg`;
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
