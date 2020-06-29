function MobileSideBar__init() {
    var $btnToggleMobileSideBar = $('.btn-toggle-mobile-side-bar');

    $btnToggleMobileSideBar.click(function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $('.mobile-side-bar').removeClass('active');
        }
        else {
            $(this).addClass('active');
            $('.mobile-side-bar').addClass('active');
        }
    });
}

$(function () {
    MobileSideBar__init();
});

// 탑바 스크롤
$(window).scroll(function () {
    var scrollTop = $(window).scrollTop();

    if (scrollTop > 175) {
        $('.top-bar').addClass('follow');
        $('.logo').addClass('follow2');
    }
    else {
        $('.top-bar').removeClass('follow');
        $('.logo').removeClass('follow2');
    }
});

// 에디터
console.clear();
var editor1__initialValue = $('#origin1').html();
var editor1 = new toastui.Editor({
  el: document.querySelector('#viewer1'),
  height: '600px',
  initialValue: editor1__initialValue,
  viewer:true,
  plugins: [toastui.Editor.plugin.codeSyntaxHighlight]
});