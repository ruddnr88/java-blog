function MobileSideBar__toggle() {
    var $btn = $('.btn-toggle-mobile-side-bar');
    var $mobileSideBar = $('.mobile-side-bar');
    var $mobileSideBarBg = $('.mobile-side-bar-bg');
    var $html = $('html');

    if ( $btn.hasClass('active') ) {
        // 모바일 사이드바 끄기
        $btn.removeClass('active');
        $mobileSideBar.removeClass('active');
        $mobileSideBarBg.removeClass('active');
        $html.removeClass('mobile-side-bar-actived');
    }
    else {
        // 모바일 사이드바 켜기
        $btn.addClass('active');
        $mobileSideBar.addClass('active');
        $mobileSideBarBg.addClass('active');
        $html.addClass('mobile-side-bar-actived');
    }
}

function MobileSideBar__init() {
    $('.btn-toggle-mobile-side-bar, .mobile-side-bar-bg').click(MobileSideBar__toggle);

    $('.mobile-side-bar .menu-box-1 ul > li').click(function(e) {
        if ( $(this).hasClass('active') ) {
            $(this).removeClass('active');
        }
        else {
            $(this).addClass('active');
        }

        e.stopPropagation();
    });
}

$(function() {
    MobileSideBar__init();

    $('.btn-toggle-mobile-side-bar').click();
    $('.mobile-side-bar .menu-box-1 > ul > li:last-child').click();
});