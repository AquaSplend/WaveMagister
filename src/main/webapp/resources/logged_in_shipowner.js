$(document).ready(()=> {
    let shipownerAgreementsParent = $(".shipowner-agreements-parent");
    let fleet = $(".fleet");
    let waitWheelText = $(".waitWheelText");
    let cancelWheel = $(".cancelWheel");
    let modalOverlayWheel = $(".modal-overlay-wheel");
    let modalNewVesselElements = $(".modal-overlay-newVessel, .modal-newVessel");

    function showShipownerAgreements() {
        fleet.fadeOut();
        openWait();
        $.ajax({
            type: "GET",
            url: "/wavemagister/shipowner_agreements.html",
            success: function(response) {
                fleet.empty();
                shipownerAgreementsParent.empty();
                shipownerAgreementsParent.append(response);
                closeWait();
                shipownerAgreementsParent.delay(450).fadeIn();
            },
            fail: function() {
                closeWait();
                fleet.fadeIn();
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
        openWait();
        $.ajax({
            type: "GET",
            url: "/wavemagister/vessels.html",
            success: function(response) {
                shipownerAgreementsParent.empty();
                fleet.empty();
                fleet.append(response);
                closeWait();
                fleet.delay(450).fadeIn();
            },
            fail: function() {
                closeWait();
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
        openWait();
        $.ajax({
            type: "POST",
            url: "/wavemagister/vessel.html",
            data: $(this).parents("form").serialize(),
            success: function() {
                closeWait();
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
                closeWait();
                $("[data-notification-status='error']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "error")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`Something went wrong and the vessel data failed to update. Please try again.`)
                    .delay(10000).fadeOut();
            }
        });
        return false;
    }

    showShipownerAgreements();

    $(document).on("click", "[name='shipownerAgreementsButton']", ()=> {
        showShipownerAgreements();
    });

    $(document).on("click", "[name='fleetButton']", ()=> {
        showFleet();
    });

    $(document).on("click", ".addVesselIcon", ()=> {
        modalNewVesselElements.addClass("active");
    });

    $(document).on("click", ".close-modal-newVessel", ()=> {
        modalNewVesselElements.removeClass("active");
    });

    $(document).on("change", ".fleetList input", function() {
        updateFleet();
    });

    $(document).on("click", "[name='downloadAgreementsAsShipowner']", ()=> {
        let pdf = new jsPDF();
        pdf.setFontSize(18);
        pdf.text("Agreements", 14, 22);
        pdf.autoTable({html: ".tableAgreements", startY: 30});
        pdf.save("Agreements.pdf");
    });

    $(document).on("click", "[name='downloadFleet']", ()=> {
        let pdf = new jsPDF();
        pdf.setFontSize(18);
        pdf.text("Fleet", 14, 22);
        pdf.autoTable({html: ".tableFleet", startY: 30});
        pdf.save("Fleet.pdf");
    });

    function openWait() {
        if (!modalOverlayWheel.hasClass("active")) {
            waitWheelText.hide();
            cancelWheel.hide();
            modalOverlayWheel.addClass("active");
            waitWheelText.show();
            setTimeout(() => {
                waitWheelText.hide();
                cancelWheel.show();
            }, 6000);
        }
    }

    function closeWait() {
        if (modalOverlayWheel.hasClass("active")) {
            modalOverlayWheel.removeClass("active");
        }
    }
});