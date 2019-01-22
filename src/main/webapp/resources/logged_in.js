$(document).ready(()=> {
    let html = $("html");
    let login = $(".login-parent");
    let register = $(".register-parent");
    let input = $("input");
    let reset = $("[type='reset']");
    let otherButtons = $(".mr-auto .navBut");
    let modalPasswordElements = $(".modal-overlay-password, .modal-password");
    let startDate = $("#startDate");
    let endDate = $("#endDate");

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
        }
    });

    $(".userData input, .offers-search-parent form input").on("change", function() {
        $(this).parents("form").submit();
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

    function startDateF() {
        let now = new Date();
        let day = ("0" + now.getDate()).slice(-2);
        let month = ("0" + (now.getMonth() + 1)).slice(-2);
        let today = now.getFullYear() + "-" + (month) + "-" + (day);
        startDate.val(today);
    }

    function endDateF() {
        let end = new Date();
        end.setDate(end.getDate() + 20);
        let month = "0" + (end.getMonth() + 1);
        let date = "0" + end.getDate();
        month = month.slice(-2);
        date = date.slice(-2);
        endDate.val(end.getFullYear() + "-" + month + "-" + date);
    }

    startDateF();
    endDateF();
});