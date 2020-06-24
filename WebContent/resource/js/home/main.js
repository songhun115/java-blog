function MobileSideBar__init() {
    var $btnToggleMobileSideBar = $('.mobile-btn-toggle-side-bar');
    
    $btnToggleMobileSideBar.click(function() {
        if ( $(this).hasClass('active') ) {
            $(this).removeClass('active');
            $('.cover').removeClass('active');
            
        }
        else {
            $(this).addClass('active');
            $('.cover').addClass('active');
            
        }
    });
}


$(function() {
    MobileSideBar__init();
});


function btnBackGround__init() {
    var $btnBackGround = $('.icon');

    $btnBackGround.click(function() {
        if ( $(this).hasClass('active') ) {
            $(this).removeClass('active');
            $('body').removeClass('active');
            $('.top-bar').removeClass('active');            
        }
        else {
            $(this).addClass('active');
            $('.top-bar').addClass('active');
            $('body').addClass('active');          
        }
    });
}

$(function() {
    btnBackGround__init();

});






/*
$('.icon').click(function(){$('body').css("background","#D4D0B8")})

$(function(){
    $('.icon').click(function(){$('body').css("background","#F9F4D9")})    
});
*/