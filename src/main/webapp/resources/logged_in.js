$(document).ready(()=> {
    let html = $("html");
    let login = $(".login-parent");
    let register = $(".register-parent");
    let input = $("input");
    let reset = $("[type='reset']");
    let otherButtons = $(".mr-auto .navBut");
    let modalPasswordElements = $(".modal-overlay-password, .modal-password");
    let modalOverlayWheel = $(".modal-overlay-wheel");
    let passwordNotEqualsChange = $(".passwordNotEqualsChange");
    let passwordFormField1 = $(".passwordFormField1");
    let passwordFormField2 = $(".passwordFormField2");
    
    login.hide();
    register.hide();
    reset.hide();
    html.fadeIn(1000);

    $(".otherButton1").css("border-bottom", "solid 3px");

    otherButtons.on("click", function() {
        otherButtons.not($(this)).css("border-bottom", "solid 0");
        $(this).css("border-bottom", "solid 3px");
    });

    input.on("input", ()=> {
        if (input.val !== null) {
            reset.show();
            reset.show();
        }
    });

    $(document).on("click", ".resetPassword", ()=> {
        if (!passwordNotEqualsChange.hasClass("hidden")) {
            passwordNotEqualsChange.addClass("hidden")
    }
    });

    $(document).on("click", ".passwordChangeButton", (e)=> {
        passwordNotEqualsChange.addClass("hidden");
        if (passwordFormField1.val() !== passwordFormField2.val() || passwordFormField1.val().length < 6 || passwordFormField2.val().length < 6) {
            e.preventDefault();
            passwordNotEqualsChange.removeClass("hidden");
        } else {
            openWait();
            $.ajax({
                type: "POST",
                url: "/wavemagister/change_password.html",
                data: $(".passwordChangeForm").serialize(),
                success: ()=> {
                    modalPasswordElements.removeClass("active");
                    closeWait();
                    $("[data-notification-status='success']")
                        .show()
                        .removeClass()
                        .attr("data-notification-status", "success")
                        .addClass("bottom-right" + " notify")
                        .addClass("do-show")
                        .empty()
                        .append(`Your password has been successfully updated.`)
                        .delay(6000).fadeOut();
                },
                error: ()=> {
                    modalPasswordElements.removeClass("active");
                    closeWait();
                    $("[data-notification-status='error']")
                        .show()
                        .removeClass()
                        .attr("data-notification-status", "error")
                        .addClass("bottom-right" + " notify")
                        .addClass("do-show")
                        .empty()
                        .append(`Something went wrong and your password failed to update.`)
                        .delay(10000).fadeOut();
                }
            });
            return false;
        }
    });

    $(".userData input").on("change", function() {
        openWait();
        $.ajax({
            type: "POST",
            url: "/wavemagister/user.html",
            data: $(this).parents("form").serialize(),
            success: ()=> {
                closeWait();
                $("[data-notification-status='success']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "success")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`Successful update.`)
                    .delay(6000).fadeOut();
            },
            error: ()=> {
                closeWait();
                $("[data-notification-status='error']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "error")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`Something prevented the update. Please try again.`)
                    .delay(10000).fadeOut();
            }
        });
        return false;
    });

    $.fn.textWidth = function(text, font) {
        if (!$.fn.textWidth.fakeEl) $.fn.textWidth.fakeEl = $("<span>").hide().appendTo(document.body);
        $.fn.textWidth.fakeEl.text(text || this.val() || this.text() || this.attr("placeholder")).css("font", font || this.css("font"));
        return $.fn.textWidth.fakeEl.width();
    };

    $(document).on("input", ".width-dynamic", function() {
        let inputWidth = $(this).textWidth();
        $(this).css({
            width: inputWidth
        })
    }).trigger("input");

    passwordFormField1.on("input", function() {
        if (!passwordNotEqualsChange.hasClass("hidden")) {
            passwordNotEqualsChange.addClass("hidden");
        }
    });

    passwordFormField2.on("input", function() {
        if (!passwordNotEqualsChange.hasClass("hidden")) {
            passwordNotEqualsChange.addClass("hidden");
        }
    });

    $(document).on("click", ".changePasswordButton", ()=> {
        modalPasswordElements.addClass("active");
    });

    $(document).on("click", ".close-modal", ()=> {
        modalPasswordElements.removeClass("active");
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

    function openWait() {
        if (!modalOverlayWheel.hasClass("active")) {
            modalOverlayWheel.addClass("active");
        }
    }

    function closeWait() {
        if (modalOverlayWheel.hasClass("active")) {
            modalOverlayWheel.removeClass("active");
        }
    }
});