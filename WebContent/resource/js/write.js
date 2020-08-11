var onBeforeUnloadSetted = false;
var onBeforeUnload = function(e) {
  return '떠나시겠습니까?'; // 요새 브라우저는 이 메시지가 아닌 자체의 메세지가 나옵니다.
};

function applyOnBeforeUnload() {
  if ( onBeforeUnloadSetted ) return;
  $(window).bind('beforeunload', onBeforeUnload); // 떠날 때 실행되는 함수를 등록
  onBeforeUnloadSetted = true;
}

function removeOnBeforeUnload() {
  $(window).unbind('beforeunload', onBeforeUnload); // 떠날 때 실행되는 함수를 해제
  onBeforeUnloadSetted = false;
}
var WriteForm__submitDone = false;

function WriteForm__submit(form) {
  if ( WriteForm__submitDone ) {
    alert('처리중입니다.');
    return;
  }
  
  form.name.value = form.name.value.trim();
  
  if ( form.name.value.length == 0 ) {
    alert('이름좀...');
    form.name.focus();
    return;
  }
  
  // 폼을 발송하기 전에는, 페이지 이동을 참견하는 녀석을 꺼버린다.
  removeOnBeforeUnload();
  form.submit();
  WriteForm__submitDone = true;
}

function WriteForm__init() {
  // 폼의 특정 요소를 건드리(?)면, 그 이후 부터 외부로 이동하는 것에 참견하는 녀석을 작동시킨다.
  $('form.write-form input, form.write-form textarea').keyup(function() {
    applyOnBeforeUnload();
  });
}

WriteForm__init();