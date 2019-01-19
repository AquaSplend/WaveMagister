$(document).ready(()=> {
    let html = $("html");
    let login = $(".login-parent");
    let register = $(".register-parent");
    let input = $("input");
    let reset = $("[type='reset']");
    let otherButtons = $(".mr-auto .navBut");
    let agreementsButton = $("[name='agreementsButton']");
    let profileButton = $("[name='profileButton']");
    let agreements = $(".agreements");
    let profile = $(".profile");
    let dynamicWidth = $('.width-dynamic');
    let modalElements = $(".modal-overlay, .modal");

    login.hide();
    register.hide();
    reset.hide();
    html.fadeIn(1000);

    agreementsButton.on("click", ()=> {
        profile.fadeOut();
        agreements.delay(450).fadeIn();
    });

    profileButton.on("click", ()=> {
        agreements.fadeOut();
        profile.delay(450).fadeIn();
    });

    otherButtons.on("click", function() {
        otherButtons.not($(this)).css("border-bottom", "solid 0");
        $(this).css("border-bottom", "solid 3px");
    });

    input.on("input", ()=> {
        if (input.val !== null) {
            reset.show();
        }
    });

    $(".row input, .underItem form input").on("change", function() {
        $(this).parents("form").submit();
    });

    $.fn.textWidth = function(text, font) {
        if (!$.fn.textWidth.fakeEl) $.fn.textWidth.fakeEl = $("<span>").hide().appendTo(document.body);
        $.fn.textWidth.fakeEl.text(text || this.val() || this.text() || this.attr("placeholder")).css("font", font || this.css("font"));
        return $.fn.textWidth.fakeEl.width();
    };

    dynamicWidth.on("input", function() {
        let inputWidth = $(this).textWidth();
        $(this).css({
            width: inputWidth
        })
    }).trigger("input");

    $(".plus").on("click", function() {
        modalElements.addClass("active");
    });

    $(".close-modal").on("click", function() {
        modalElements.removeClass("active");
    });

    let now = (new Date()).getFullYear();
    let min = now - 70;
    let max = now + 30;
    for (let i = min; i < max; i++) {
        if (i === now)
            $("#selectYearBuilt").append('<option selected value="' + i + '">' + i + '</option>');
        else
            $("#selectYearBuilt").append('<option value="' + i + '">' + i + '</option>');
    }
});