
// Place any jQuery/helper plugins in here.
$.ajaxSetup({
    beforeSend: function(xhr, settings) {
        function getCookie(name) {
            var cookieValue = null;
            if (document.cookie && document.cookie !== '') {
                var cookies = document.cookie.split(';');
                for (var i = 0; i < cookies.length; i++) {
                    var cookie = jQuery.trim(cookies[i]);
                    // Does this cookie string begin with the name we want?
                    if (cookie.substring(0, name.length + 1) == (name + '=')) {
                        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                        break;
                    }
                }
            }
            return cookieValue;
        }
        if (!(/^http:.*/.test(settings.url) || /^https:.*/.test(settings.url))) {
            // Only send the token to relative URLs i.e. locally.
            xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
        }
    }
});

function sendAjax(url, params, myCallback, args){
    if (typeof args === "undefined") {
        load_elem = "#load";
    } else {
        load_elem = args.load_elem || "#load";
    }
    $(load_elem).fadeIn().html('<img src="/static/img/ajax-loader.gif" />');
    console.log("Loading..." + load_elem)
    if (typeof args === "undefined" || args.method === "get") {
        $.get(url, params)
        .done(function(data) {
            myCallback(data);
            $(load_elem).fadeOut();
        })
        .fail(function(error){
            console.log(error);
        });
    } else if (args.method === "post") {
        $.post(url, params)
        .done(function(data) {
            myCallback(data);
            $(load_elem).fadeOut();
        })
        .fail(function(error) {
            console.log(error);
        });
    }
}
function goToByScroll(element, callback){
    $('html,body').animate({
        scrollTop: $(element).offset().top - 10},
        'slow', callback);
}
$(document).ready(function () {
    $("#home nav a").on('click', function(e) {
      e.preventDefault();
      var hash = this.hash;
      goToByScroll(hash, function (e) {if (hash == "#contact") {setTimeout(function(){$("#id_email").focus()}, 1)};});
    });
});