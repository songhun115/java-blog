const toDoForm = document.querySelector(".js__toDoForm"),
  toDoInput = toDoForm.querySelector("input"),
  toDoList = document.querySelector(".js__toDoList");

const toDosLocalStorage = "toDos";
let toDos = [];

function removeToDos(event) {
  const btn = event.target;
  const li = btn.parentNode;
  toDoList.removeChild(li);
  const cleanToDos = toDos.filter(function (toDo) {
    return toDo.id !== parseInt(li.id);
  });
  toDos = cleanToDos;
  saveToDoS();
}

function saveToDoS() {
  localStorage.setItem(toDosLocalStorage, JSON.stringify(toDos));
}

function paintToDo(text) {
  const li = document.createElement("li");
  const delBtn = document.createElement("button");
  const span = document.createElement("span");
  const newId = toDos.length + 1;

  delBtn.innerText = "❌";
  delBtn.addEventListener("click", removeToDos);
  delBtn.style.margin = "0px 10px";
  delBtn.style.backgroundColor = "transparent";
  delBtn.style.borderColor = "transparent";
  delBtn.style.borderRadius = "4px";
  delBtn.style.fontSize = "1.1rem";
  delBtn.style.cursor = "pointer";
  span.innerText = text;

  li.appendChild(delBtn);
  li.appendChild(span);
  li.id = newId;
  toDoList.appendChild(li);
  const toDoObj = {
    text: text,
    id: newId,
  };

  toDos.push(toDoObj);
  saveToDoS();
}

function handleSubmit(event) {
  event.preventDefault();
  const currentValue = toDoInput.value;
  paintToDo(currentValue);
  toDoInput.value = "";
}

function loadToDos() {
  const loadToDos = localStorage.getItem(toDosLocalStorage);
  if (loadToDos !== null) {
    const parsedToDos = JSON.parse(loadToDos);
    parsedToDos.forEach(function (toDo) {
      paintToDo(toDo.text);
    });
  }
}

function init() {
  loadToDos();
  toDoForm.addEventListener("submit", handleSubmit);
}

init();
