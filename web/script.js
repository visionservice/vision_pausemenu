let isQuitPopupOpen = false

$('#button-resume').click(function() {
    $.post('https://vs_pausemenu/close');
    $('.container').fadeOut();
})

$('#button-map').click(function() {
    $.post('https://vs_pausemenu/map');
    $('.container').fadeOut();
})

$('#button-options').click(function() {
    $.post('https://vs_pausemenu/options');
    $('.container').fadeOut();
})

$('#button-quit').click(function() {
    isQuitPopupOpen = true
    // $(".close-container").fadeIn();
    $('.button-container').fadeOut();
    $('.logo').fadeOut();
    setTimeout(() => {
        $('.close-container').fadeIn();
    }, 350);
})

$('#back').click(function() {
    $('.close-container').fadeOut();
    setTimeout(() => { 
        $('.button-container').fadeIn();
        $('.logo').fadeIn();
    }, 300);
})

$('#quitserver').click(function() {
    $.post('https://vs_pausemenu/disconnect');
    $('.container').fadeOut();
})

$('#quitgame').click(function() {
    $.post('https://vs_pausemenu/quit');
    $('.container').fadeOut();
})

$(document).ready(function() {
    $.post('https://vs_pausemenu/loadtranslation');
});

window.addEventListener("message", function(e) {
    if(e.data.active === true) {
        $('.container').show();
    }

    if(e.data.type == 'loadtranslation') {
        $('#button-resume').text(e.data.resume_button);
        $('#button-map').text(e.data.map_button);
        $('#button-options').text(e.data.options_button);
        $('#button-quit').text(e.data.quit_button);
        $('#back').text("<   " + e.data.back_button);
        $('#whataction').text(e.data.what_action);
        $('#quitserver').text(e.data.quit_from_server);
        $('#quitgame').text(e.data.close_fivem);
        $('.logo').css("background-image", "url(" + e.data.logo_url + ")");
        $('.container').css("background", "linear-gradient(156deg, " + e.data.color1 + " 0%, " + e.data.color2 + " 65%, " + e.data.color3 + " 100%)")
    }
})

$(document).keydown(function(e) {
    if(e.key === "Escape") { // escape key maps to keycode `27`
        if(isQuitPopupOpen === true) {
            isQuitPopupOpen = false
            $(".close-container").fadeOut();
            setTimeout(() => {
                $('.button-container').fadeIn();
                $('.logo').fadeIn();
            }, 300);
        } else {
            $.post('https://vs_pausemenu/close');
            $('.container').fadeOut();
            setTimeout(() => {
                $('.close-container').fadeOut();
                $('.button-container').fadeIn();
                $('.logo').fadeIn();
            }, 300);
        }
   }
});