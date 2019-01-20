$(document).ready(()=> {
    let html = $("html");
    let login = $(".login-parent");
    let register = $(".register-parent");
    let input = $("input");
    let reset = $("[type='reset']");
    let otherButtons = $(".mr-auto .navBut");
    let agreementsButton = $("[name='agreementsButton']");
    let offersButton = $("[name='offersButton']");
    let fleetButton = $("[name='fleetButton']");
    let agreements = $(".agreements");
    let fleet = $(".fleet");
    let offersParent = $(".offers-parent");
    let resultsParent = $(".results-parent");
    let dynamicWidth = $('.width-dynamic');
    let modalNewVesselElements = $(".modal-overlay-newVessel, .modal-newVessel");
    let modalPasswordElements = $(".modal-overlay-password, .modal-password");
    let startDate = $("#startDate");
    let endDate = $("#endDate");

    login.hide();
    register.hide();
    reset.hide();
    html.fadeIn(1000);

    agreementsButton.on("click", ()=> {
        fleet.fadeOut();
        offersParent.fadeOut();
        resultsParent.fadeOut();
        agreements.delay(450).fadeIn();
    });

    fleetButton.on("click", ()=> {
        agreements.fadeOut();
        fleet.delay(450).fadeIn();
    });

    offersButton.on("click", ()=> {
        agreements.fadeOut();
        offersParent.delay(450).fadeIn();
        resultsParent.delay(450).fadeIn();
    });

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

    $(".row input, .underItem form input, .offers-search-parent form input").on("change", function() {
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
        modalNewVesselElements.addClass("active");
    });

    $(".changePasswordButton").on("click", function() {
        modalPasswordElements.addClass("active");
    });

    $(".close-modal").on("click", ()=> {
        modalNewVesselElements.removeClass("active");
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

    $(".fleetList input").on("change", function() {
        let id = $(this).parents().find("#vesselId").val();
        let vesselShipowner = $(this).parents().find("#vesselShipowner").val();
        let name = $(this).parents().find("#vesselName").val();
        let flag = $(this).parents().find("#vesselFlag").val();
        let dwt = $(this).parents().find("#vesselDwt").val();
        let vesselYearBuilt = $(this).parents().find("#vesselYearBuilt").val();
        let vesselActive = $(this).parents().find("#vesselActive").prop('checked');

        if (id && vesselShipowner && name && flag && dwt && vesselYearBuilt && vesselActive) {
            $.ajax({
                type: "POST",
                url: "/wavemagister/vessel.html",
                data: $(this).parents("form").serialize(),
                success: function() {
                    $("[data-notification-status='success']")
                        .show()
                        .removeClass()
                        .attr("data-notification-status", "success")
                        .addClass("bottom-right" + " notify")
                        .addClass("do-show")
                        .empty()
                        .append(`The vessel has been updated.`)
                        .delay(6000).fadeOut();
                },
                fail: function() {
                    $("[data-notification-status='error']")
                        .show()
                        .removeClass()
                        .attr("data-notification-status", "error")
                        .addClass("bottom-right" + " notify")
                        .addClass("do-show")
                        .empty()
                        .append(`Something happened and the vessel failed to update. Please refresh the page.`)
                        .delay(10000).fadeOut();
                }
            });
        }
        return false;
    });
});