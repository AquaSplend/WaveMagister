$(document).ready(()=> {
    let agreementsButton = $("[name='agreementsButton']");
    let offersButton = $("[name='offersButton']");
    let oilPrice = $(".oilpricenettable2 tbody tr").next().find("span").html().substr(1);
    let oilParent = $(".oil-parent");

    $(".oilIndication").html(oilPrice);

    let date1 = new Date($("#startDate").val());
    let date2 = new Date($("#endDate").val());
    let timeDiff = Math.abs(date2.getTime() - date1.getTime());
    let totalDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

    $(".dailyFreight").each(function () {
        $(this).val(Math.round((oilPrice * 0.13642565 * $("#quantity").val() + $(this).parents().find(".dailyCosts").val()) / totalDays));
    });

    agreementsButton.on("click", ()=> {
        oilParent.fadeOut();
    });

    offersButton.on("click", ()=> {
        oilParent.delay(450).fadeIn();
    });
});