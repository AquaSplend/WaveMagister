$(document).ready(()=> {
    let html = $("html");
    let jumbotron = $(".jumbotron-parent");
    let login = $(".login-parent");
    let register = $(".register-parent");
    let smallLogin = $(".smallLogin-parent");
    let smallRegister = $(".smallRegister-parent");
    let allLogin = $("[name='login'],[name='smallLogin']");
    let allRegister = $("[name='register'],[name='smallRegister']");
    let input = $("input");
    let reset = $("[type='reset']");
    let navbar = $(".navbar-expand-md");
    let navbar_brand = $(".navbar-brand");
    let otherButton_parent = $(".otherButtonParent");
    let otherButtons = $(".mr-auto .navBut");

    navbar_brand.hide();
    login.hide();
    register.hide();
    reset.hide();
    html.fadeIn(1000);

    otherButtons.on("click", function() {
        otherButtons.not($(this)).css("background-color", "transparent !important");
        $(this).css("background-color", "rgba(238, 238, 238, 0.5) !important");
    });

    allLogin.on("click", ()=> {
        jumbotron.fadeOut();
        register.fadeOut();
        smallLogin.fadeOut();
        setTimeout(()=>{
            navbar.addClass("navbarColored");
            otherButton_parent.fadeIn();
        }, 450);
        navbar_brand.delay(450).fadeIn();
        login.delay(450).fadeIn();
        smallRegister.delay(450).fadeIn();
    });

    allRegister.on("click", ()=> {
        jumbotron.fadeOut();
        login.fadeOut();
        smallRegister.fadeOut();
        setTimeout(()=>{
            navbar.addClass("navbarColored");
            otherButton_parent.fadeIn();
        }, 450);
        navbar_brand.delay(450).fadeIn();
        register.delay(450).fadeIn();
        smallLogin.delay(450).fadeIn();
    });

    input.on("input", ()=> {
        if (input.val != null) {
            reset.show();
        }
    });
});