$(document).ready(()=> {
    let html = $("html");
    let login = $(".login-parent");
    let register = $(".register-parent");
    let input = $("input");
    let reset = $("[type='reset']");
    let navbar = $(".navbar-expand-md");
    let otherButtons = $(".mr-auto .navBut");

    login.hide();
    register.hide();
    reset.hide();
    html.fadeIn(1000);
    navbar.addClass("navbarColored");

    otherButtons.on("click", function() {
        otherButtons.not($(this)).css("background-color", "transparent !important");
        $(this).css("background-color", "rgba(238, 238, 238, 0.5) !important");
    });

    input.on("input", ()=> {
        if (input.val !== null) {
            reset.show();
        }
    });

    $(".row input").on("change", function() {
        $(this).parents("form").submit();
    });
});
