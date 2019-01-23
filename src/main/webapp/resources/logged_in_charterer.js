$(document).ready(()=> {
    let oilParent = $(".oil-parent");
    let offersParent = $(".offers-parent");
    let chartererAgreementsParent = $(".charterer-agreements-parent");
    let modalOverlayWheel = $(".modal-overlay-wheel");
    let startDate = $("#startDate");
    let endDate = $("#endDate");
    let offersResults = $(".offersResults");

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

    $(".oilIndication").html($(".oilpricenettable2 tbody tr").next().find("span").html().substr(1));

    function showChartererAgreements() {
        oilParent.fadeOut();
        offersParent.fadeOut();
        openWait();
        $.ajax({
            type: "GET",
            url: "/wavemagister/charterer_agreements.html",
            success: function(response) {
                offersResults.empty();
                chartererAgreementsParent.empty();
                chartererAgreementsParent.append(response);
                closeWait();
                chartererAgreementsParent.delay(450).fadeIn();
            },
            fail: function() {
                closeWait();
                $("[data-notification-status='error']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "error")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`Something went wrong and the system could not fetch the shipowner's agreements. Please try again.`)
                    .delay(10000).fadeOut();
            }
        });
    }

    function showSearchOffers() {
        chartererAgreementsParent.fadeOut();
        openWait();
        $.ajax({
            type: "GET",
            url: "/wavemagister/search_results.html",
            success: function(response) {
                chartererAgreementsParent.empty();
                offersResults.empty();
                offersResults.append(response);
                $(".dailyFreight").each(function () {
                    $(this).val(Math.round(($(".oilpricenettable2 tbody tr").next().find("span").html().substr(1) * 0.13642565 * $("#quantity").val() + $(this).parents().find(".dailyCosts").val()) / (Math.ceil(Math.abs((new Date($("#startDate").val())).getTime() - (new Date($("#endDate").val())).getTime()) / (1000 * 3600 * 24)))));
                });
                closeWait();
                oilParent.delay(450).fadeIn();
                offersParent.delay(450).fadeIn();
            },
            fail: function() {
                closeWait();
                $("[data-notification-status='error']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "error")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`Something went wrong. Please try again.`)
                    .delay(10000).fadeOut();
            }
        });
    }

    showChartererAgreements();

    $(document).on("click", "[name='chartererAgreementsButton']", ()=> {
        showChartererAgreements();
    });

    $(document).on("click", "[name='offersButton']", ()=> {
        showSearchOffers();
    });

    $(document).on("click", "[name='downloadAgreementsAsCharterer']", ()=> {
        let pdf = new jsPDF();
        pdf.setFontSize(18);
        pdf.text("Agreements", 14, 22);
        pdf.autoTable({html: ".tableAgreements", startY: 30});
        pdf.save("Agreements.pdf");
    });

    $(document).on("change", ".searchOffers input", function() {
        openWait();
        $.ajax({
            type: "GET",
            url: "/wavemagister/search_results.html",
            success: function(response) {
                offersResults.fadeOut();
                offersResults.empty();
                offersResults.append(response);
                $(".dailyFreight").each(function () {
                    $(this).val(Math.round(($(".oilpricenettable2 tbody tr").next().find("span").html().substr(1) * 0.13642565 * $("#quantity").val() + $(this).parents().find(".dailyCosts").val()) / (Math.ceil(Math.abs((new Date($("#startDate").val())).getTime() - (new Date($("#endDate").val())).getTime()) / (1000 * 3600 * 24)))));
                });
                closeWait();
                offersResults.delay(450).fadeIn();
            },
            fail: function() {
                closeWait();
                $("[data-notification-status='error']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "error")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`Something went wrong and the system could not fetch the search results. Please try again.`)
                    .delay(10000).fadeOut();
            }
        });
    });

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