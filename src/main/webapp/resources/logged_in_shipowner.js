$(document).ready(()=> {
    let shipownerAgreementsParent = $(".shipowner-agreements-parent");
    let fleet = $(".fleet");
    let modalOverlayWheel = $(".modal-overlay-wheel");
    let modalNewVesselElements = $(".modal-overlay-newVessel, .modal-newVessel");

    function showShipownerAgreements() {
        fleet.fadeOut();
        openWait();
        $.ajax({
            type: "GET",
            url: "/wavemagister/shipowner_agreements.html",
            success: (response)=> {
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
            url: "/wavemagister/fleet.html",
            success: (response)=> {
                shipownerAgreementsParent.empty();
                fleet.empty();
                fleet.append(response);
                closeWait();
                fleet.delay(450).fadeIn();
            },
            fail: ()=> {
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

    $(document).on("click", ".addNewVesselButton", ()=> {
        modalNewVesselElements.removeClass("active");
        openWait();
        $.ajax({
            type: "POST",
            url: "/wavemagister/vessel.html",
            data: $(".addVesselForm").serialize(),
            success: ()=> {
                closeWait();
                showFleet();
                $("[data-notification-status='success']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "success")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`This vessel has successfully been added to your fleet.`)
                    .delay(6000).fadeOut();
            },
            error: ()=> {
                closeWait();
                showFleet();
                $("[data-notification-status='error']")
                    .show()
                    .removeClass()
                    .attr("data-notification-status", "error")
                    .addClass("bottom-right" + " notify")
                    .addClass("do-show")
                    .empty()
                    .append(`Something went wrong and the vessel did not get added to your fleet. Please try again.`)
                    .delay(10000).fadeOut();
            }
        });
        return false;
    });

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
        openWait();
        $.ajax({
            type: "POST",
            url: "/wavemagister/Vedit.html",
            data: $(this).parents("form").serialize(),
            success: function() {
                showFleet();
            },
            error: function() {
                closeWait();
                showFleet();
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
            modalOverlayWheel.addClass("active");
        }
    }

    function closeWait() {
        if (modalOverlayWheel.hasClass("active")) {
            modalOverlayWheel.removeClass("active");
        }
    }
});