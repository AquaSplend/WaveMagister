$(document).ready(()=> {
    let chartererAgreementsButton = $("[name='chartererAgreementsButton']");
    let offersButton = $("[name='offersButton']");
    let oilPrice = $(".oilpricenettable2 tbody tr").next().find("span").html().substr(1);
    let oilParent = $(".oil-parent");
    let offersBigParent = $(".offers-big-parent");
    let chartererAgreementsParent = $(".charterer-agreements-parent");

    $(".oilIndication").html(oilPrice);

    let date1 = new Date($("#startDate").val());
    let date2 = new Date($("#endDate").val());
    let timeDiff = Math.abs(date2.getTime() - date1.getTime());
    let totalDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

    $(".dailyFreight").each(function () {
        $(this).val(Math.round((oilPrice * 0.13642565 * $("#quantity").val() + $(this).parents().find(".dailyCosts").val()) / totalDays));
    });

    chartererAgreementsButton.on("click", ()=> {
        offersBigParent.fadeOut();
        offersBigParent.empty();
        chartererAgreementsParent.load("charterer_agreements.jsp");
        chartererAgreementsParent.delay(450).fadeIn();
    });

    offersButton.on("click", ()=> {
        chartererAgreementsParent.fadeOut();
        offersBigParent.load("charterer_offers.jsp");
        offersBigParent.delay(450).fadeIn();
    });

    chartererAgreementsButton.on("click", ()=> {
        oilParent.fadeOut();
    });

    offersButton.on("click", ()=> {
        oilParent.delay(450).fadeIn();
    });

    $("[name='downloadAgreementsAsCharterer']").on("click", ()=> {
        let pdf = new jsPDF();
        pdf.setFontSize(18);
        pdf.text("Agreements", 14, 22);
        pdf.autoTable({html: ".tableAgreements", startY: 30});
        pdf.save("Agreements.pdf");
    });
});