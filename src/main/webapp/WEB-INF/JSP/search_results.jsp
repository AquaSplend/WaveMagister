<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:forEach items="${offers}" var="offer">
    <div class="bg-text results">
        <form>
            <div class="form-row">
                <div class="form-group">
                    <label for="resVesselName">Vessel</label>
                    <input value=${offer.name} type="text" class="input form-control" id="resVesselName" title="Vessel name" disabled>
                    <input hidden value=${offer.id}>
                    <input hidden class="resultsStartDate" name="resultsStartDate" type="date" />
                    <input hidden class="resultsEndDate" name="resultsEndDate" type="date">
                </div>
                <div class="form-group">
                    <label for="resShipowner">Shipowner</label>
                    <input value=${offer.shipowner.company} type="text" class="input form-control" id="resShipowner" title="Vessel shipowner" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselFlag">Flag</label>
                    <input value=${offer.flag} type="text" class="input form-control" id="resVesselFlag" title="Vessel flag" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselDwt">DWT</label>
                    <input value=${offer.dwt} type="number" class="input form-control" id="resVesselDwt" title="Vessel dead weight tonnage" disabled>
                </div>
                <div class="form-group">
                    <label for="resVesselYearBuilt">Year built</label>
                    <input value=${offer.year_built} type="text" class="input form-control" id="resVesselYearBuilt" title="Vessel year built" disabled>
                </div>
                <div class="form-group">
                    <label for="resCosts">Daily costs ($)</label>
                    <input value=${offer.costs} type="number" class="input form-control dailyCosts" id="resCosts" title="Vessel's daily costs" disabled>
                </div>
                <div class="form-group">
                    <label for="resFreight">Freight ($)</label>
                    <input type="number" class="input form-control dailyFreight" id="resFreight" title="Daily freight" disabled>
                </div>
                <div class="addVesselIcon">
                    <button type="submit" title="Conclude agreement" class="plus concludeOffer">><span></span></button>
                </div>
            </div>
        </form>
    </div>
</c:forEach>