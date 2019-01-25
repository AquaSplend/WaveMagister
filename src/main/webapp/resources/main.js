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
    let modalNotesElements = $(".modal-overlay-notes, .modal-notes");
    let passwordNotEqualsRegister = $(".passwordNotEqualsRegister");
    let passwordLargerThan = $(".passwordLargerThan");

    navbar_brand.hide();
    login.hide();
    register.hide();
    reset.hide();
    html.fadeIn(1000);

    $(document).on("click", ".notesButton", ()=> {
        modalNotesElements.addClass("active");
    });

    $(document).on("click", ".close-modal-notes", ()=> {
        modalNotesElements.removeClass("active");
    });

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

    $(document).on("click", ".registerButtonInitial", (e)=> {
        if ($("#rPassword1").val() !== $("#rPassword2").val()) {
            e.preventDefault();
            passwordNotEqualsRegister.removeClass("hidden");
        } else {
            html.fadeOut();
            register.hide();
            $.ajax({
                type: "POST",
                url: "/wavemagister/register.html",
                data: $(".registerFormInitial").serialize(),
                success: (response)=> {
                    jumbotron.empty().append(response);
                    $("video").addClass("video-blurred");
                    jumbotron.show();
                    $(".navbar-expand-md").removeClass("hidden");
                    html.delay(450).fadeIn();
                },
                error: ()=> {
                    register.show();
                    html.fadeIn();
                    $("[data-notification-status='error']")
                        .show()
                        .removeClass()
                        .attr("data-notification-status", "error")
                        .addClass("bottom-right" + " notify")
                        .addClass("do-show")
                        .empty()
                        .append(`Something went wrong and registration could not be completed.`)
                        .delay(10000).fadeOut();
                }
            });
            return false;
        }
    });

    $(document).on("click", ".loginButtonInitial", ()=> {
        passwordLargerThan.addClass("hidden");
        if ($(".loginInputPassword").val().length < 1 || $(".loginInputUsername").val().length < 1) {
            passwordLargerThan.removeClass("hidden");
        } else {
            $(this).parents("form").submit();
        }
    });

    $(".regFirstTry").on("input", function() {
        if (!passwordNotEqualsRegister.hasClass("hidden")) {
            passwordNotEqualsRegister.addClass("hidden");
        }
    });

    $(".regSecondTry").on("input", function() {
        if (!passwordNotEqualsRegister.hasClass("hidden")) {
            passwordNotEqualsRegister.addClass("hidden");
        }
    });

    $(".loginInputUsername").on("input", function() {
        if (!passwordLargerThan.hasClass("hidden")) {
            passwordLargerThan.addClass("hidden");
        }
    });

    $(".loginInputPassword").on("input", function() {
        if (!passwordLargerThan.hasClass("hidden")) {
            passwordLargerThan.addClass("hidden");
        }
    });
});