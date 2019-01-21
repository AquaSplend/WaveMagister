$(document).ready(()=> {
    let shipownerAgreementsButton = $("[name='shipownerAgreementsButton']");
    let shipownerAgreementsParent = $(".shipowner-agreements-parent");
    let fleet = $(".fleet");
    let fleetButton = $("[name='fleetButton']");

    function showShipownerAgreements() {
        fleet.fadeOut();
        $.ajax({
            type: "GET",
            url: "/wavemagister/shipowner_agreements.html",
            success: function(response) {
                fleet.empty();
                shipownerAgreementsParent.empty();
                shipownerAgreementsParent.append(response);
                shipownerAgreementsParent.delay(450).fadeIn();
            },
            fail: function() {
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

    function showFleet() {
        shipownerAgreementsParent.fadeOut();
        $.ajax({
            type: "GET",
            url: "/wavemagister/vessels.html",
            success: function(response) {
                shipownerAgreementsParent.empty();
                fleet.empty();
                fleet.append(response);
                fleet.delay(450).fadeIn();
            },
            fail: function() {
                shipownerAgreementsParent.fadeIn();
                $("[data-notification-status='error']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "error")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`Something went wrong and the system could not fetch the fleet data. Please try again.`)
                    .delay(10000).fadeOut();
            }
        });
    }

    function updateFleet() {
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
                    .append(`Something went wrong and the vessel failed to update. Please try again.`)
                    .delay(10000).fadeOut();
            }
        });
        return false;
    }

    showShipownerAgreements();

    shipownerAgreementsButton.on("click", ()=> {
        showShipownerAgreements();
    });

    fleetButton.on("click", ()=> {
        showFleet();
    });

    $(".fleetList input").on("change", function() {
        updateFleet();
    });

    $("[name='downloadAgreementsAsShipowner']").on("click", ()=> {
        let pdf = new jsPDF();
        pdf.setFontSize(18);
        pdf.text("Agreements", 14, 22);
        pdf.autoTable({html: ".tableAgreements", startY: 30});
        pdf.save("Agreements.pdf");
    });

    $("[name='downloadFleet']").on("click", ()=> {
        let pdf = new jsPDF();
        pdf.setFontSize(18);
        pdf.text("Fleet", 14, 22);
        pdf.autoTable({html: ".tableFleet", startY: 30});
        pdf.save("Fleet.pdf");
    });
});