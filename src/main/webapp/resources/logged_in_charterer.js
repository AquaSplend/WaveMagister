$(document).ready(()=> {
    let oilPrice = $(".oilpricenettable2 tbody tr").next().find("span").html().substr(1);
    let oilParent = $(".oil-parent");
    let offersBigParent = $(".offers-big-parent");
    let chartererAgreementsParent = $(".charterer-agreements-parent");
    let waitWheelText = $(".waitWheelText");
    let cancelWheel = $(".cancelWheel");
    let modalOverlayWheel = $(".modal-overlay-wheel");

    $(".oilIndication").html(oilPrice);

    let date1 = new Date($("#startDate").val());
    let date2 = new Date($("#endDate").val());
    let timeDiff = Math.abs(date2.getTime() - date1.getTime());
    let totalDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

    $(".dailyFreight").each(function () {
        $(this).val(Math.round((oilPrice * 0.13642565 * $("#quantity").val() + $(this).parents().find(".dailyCosts").val()) / totalDays));
    });

    function showChartererAgreements() {
        offersBigParent.fadeOut();
        openWait();
        $.ajax({
            type: "GET",
            url: "/wavemagister/charterer_agreements.html",
            success: function(response) {
                offersBigParent.empty();
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

    function showChartererOffers() {
        chartererAgreementsParent.fadeOut();
        openWait();
        $.ajax({
            type: "GET",
            url: "/wavemagister/charterer_offers.html",
            success: function(response) {
                chartererAgreementsParent.empty();
                offersBigParent.empty();
                offersBigParent.append(response);
                closeWait();
                offersBigParent.delay(450).fadeIn();
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

    showChartererAgreements();

    $(document).on("click", "[name='chartererAgreementsButton']", ()=> {
        oilParent.fadeOut();
        showChartererAgreements();
    });

    $(document).on("click", "[name='offersButton']", ()=> {
        oilParent.delay(450).fadeIn();
        showChartererOffers();
    });

    $(document).on("click", "[name='downloadAgreementsAsCharterer']", ()=> {
        let pdf = new jsPDF();
        pdf.setFontSize(18);
        pdf.text("Agreements", 14, 22);
        pdf.autoTable({html: ".tableAgreements", startY: 30});
        pdf.save("Agreements.pdf");
    });

    function openWait() {
        modalOverlayWheel.addClass("active");
        waitWheelText.hide();
        cancelWheel.hide();
        waitWheelText.show();
        setTimeout(()=> {
            waitWheelText.hide();
            cancelWheel.show();
        }, 6000);
    }

    function closeWait() {
        modalOverlayWheel.removeClass("active");
    }
});