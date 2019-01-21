<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="offers-parent" style="display:none;">
    <div class="offers-search-parent">
        <div class="title">Spot offers</div>
        <div class="bg-text searchOffers">
            <div class="smallTitle">Search for freight offers</div>
            <form action="">
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="quantity">Cargo quantity (MT)</label>
                        <input value="200000" oninput="if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number" maxlength="6" class="input form-control" id="quantity" placeholder="e.g. 200000" title="Cargo quantity (MT)" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="startDate">Start date</label>
                        <input id="startDate" type="date" title="Voyage start date" class="input form-control" min="2019-01-01" max="2099-12-31" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="endDate">End date</label>
                        <input id="endDate" type="date" title="Voyage end date" class="input form-control" min="2019-01-01" max="2099-12-31" required>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="results-parent" style="display:none;">
    <div class="bg-text results">
        <form action="">
            <div class="form-row">
                <div class="form-group">
                    <label for="resVesselName">Vessel</label>
                    <input value="Sea Warrior" type="text" class="input form-control" id="resVesselName" title="Vessel name" disabled>
                </div>
                <div class="form-group">
                    <label for="resShipowner">Shipowner</label>
                    <input value="Perseus" type="text" class="input form-control" id="resShipowner" title="Vessel shipowner" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselFlag">Flag</label>
                    <input value="MA" type="text" class="input form-control" id="resVesselFlag" title="Vessel flag" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselDwt">DWT</label>
                    <input value="243684" type="number" class="input form-control" id="resVesselDwt" title="Vessel dead weight tonnage" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselYearBuilt">Year built</label>
                    <input value="2019" type="text" class="input form-control" id="resVesselYearBuilt" title="Vessel year built" disabled>
                </div>
                <div class="form-group">
                    <label for="resCosts">Daily costs ($)</label>
                    <input value="3500" type="number" class="input form-control dailyCosts" id="resCosts" title="Vessel's daily costs" disabled>
                </div>
                <div class="form-group">
                    <label for="resFreight">Freight ($)</label>
                    <input type="number" class="input form-control dailyFreight" id="resFreight" title="Daily freight" disabled>
                </div>
                <div class="addVesselIcon">
                    <button type="submit" title="Conclude agreement" class="plus"><span>+</span></button>
                </div>
            </div>
        </form>
    </div>
    <div class="bg-text results">
        <form action="">
            <div class="form-row">
                <div class="form-group">
                    <label for="resVesselName">Vessel</label>
                    <input value="Sea Warrior" type="text" class="input form-control" id="resVesselName" title="Vessel name" disabled>
                </div>
                <div class="form-group">
                    <label for="resShipowner">Shipowner</label>
                    <input value="Perseus" type="text" class="input form-control" id="resShipowner" title="Vessel shipowner" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselFlag">Flag</label>
                    <input value="MA" type="text" class="input form-control" id="resVesselFlag" title="Vessel flag" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselDwt">DWT</label>
                    <input value="243684" type="number" class="input form-control" id="resVesselDwt" title="Vessel dead weight tonnage" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselYearBuilt">Year built</label>
                    <input value="2019" type="text" class="input form-control" id="resVesselYearBuilt" title="Vessel year built" disabled>
                </div>
                <div class="form-group">
                    <label for="resCosts">Daily costs ($)</label>
                    <input value="3500" type="number" class="input form-control dailyCosts" id="resCosts" title="Vessel's daily costs" disabled>
                </div>
                <div class="form-group">
                    <label for="resFreight">Freight ($)</label>
                    <input type="number" class="input form-control dailyFreight" id="resFreight" title="Daily freight" disabled>
                </div>
                <div class="addVesselIcon">
                    <button type="submit" title="Conclude agreement" class="plus"><span>+</span></button>
                </div>
            </div>
        </form>
    </div>
</div>