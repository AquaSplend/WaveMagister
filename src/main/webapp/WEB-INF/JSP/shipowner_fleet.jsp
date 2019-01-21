<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="title">Fleet</div>
<button type="button" class="smallButton downloadFleetButton" name="downloadFleet">Download fleet data</button>
<div class="addVesselIcon">
    <button title="Add a new vessel" class="plus"><span>+</span></button>
</div>
<div class="modal-overlay modal-overlay-newVessel">
    <div class="modal modal-newVessel">
        <a class="close-modal">
            <svg viewBox="0 0 20 20">
                <path fill="#001755" d="M15.898,4.045c-0.271-0.272-0.713-0.272-0.986,0l-4.71,4.711L5.493,4.045c-0.272-0.272-0.714-0.272-0.986,0s-0.272,0.714,0,0.986l4.709,4.711l-4.71,4.711c-0.272,0.271-0.272,0.713,0,0.986c0.136,0.136,0.314,0.203,0.492,0.203c0.179,0,0.357-0.067,0.493-0.203l4.711-4.711l4.71,4.711c0.137,0.136,0.314,0.203,0.494,0.203c0.178,0,0.355-0.067,0.492-0.203c0.273-0.273,0.273-0.715,0-0.986l-4.711-4.711l4.711-4.711C16.172,4.759,16.172,4.317,15.898,4.045z"></path>
            </svg>
        </a>
        <div class="modal-content">
            <div class="mediumTitle">Add new vessel to fleet</div>
            <div class="bg-text1">
                <form action="">
                    <div class="form-group">
                        <label for="aVesselName">Name</label>
                        <input id="aVesselName" type="text" class="input form-control" placeholder="e.g. Grandiose" maxlength="20" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="aVesselFlag">Flag</label>
                            <input type="text" class="input form-control" id="aVesselFlag" maxlength="2" placeholder="e.g. PA" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="selectYearBuilt">Year built</label>
                            <select id="selectYearBuilt" class="form-control">
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="aVesselDWT">Dead weight tonnage</label>
                            <input oninput="if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number" maxlength="6" class="input form-control" id="aVesselDWT" placeholder="e.g. 150000" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="aVesselCosts">Daily costs ($)</label>
                            <input oninput="if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" type="number" maxlength="6" class="input form-control" id="aVesselCosts" placeholder="e.g. 3000" required>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="button afterForm" name="Register">Add vessel</button>
                        <input class="button afterForm resetBtn" type="reset" value="Reset">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <c:forEach items="${vesselList}" var="vessel">
        <div class="bg-text fleetList">
            <form>
                <div class="form-row">
                    <div class="form-group vesselUpdateForm">
                        <label style="display:none;" for="vesselId"></label>
                        <input hidden value=${vessel.id} name="id" type="text" class="input form-control" id="vesselId" title="Vessel ID">
                        <label style="display:none;" for="vesselShipowner"></label>
                        <input hidden value=${vessel.shipowner} name="shipowner" type="text" class="input form-control" id="vesselShipowner" title="Shipowner">
                        <label for="vesselName">Name</label>
                        <input value=${vessel.name} name="name" type="text" class="input form-control" id="vesselName" title="Vessel name">
                    </div>
                    <div class="form-group">
                        <label for="vesselFlag">Flag</label>
                        <input value=${vessel.flag} name="flag" type="text" class="input form-control" id="vesselFlag" title="Flag">
                    </div>
                    <div class="form-group">
                        <label for="vesselDwt">DWT</label>
                        <input value=${vessel.dwt} name="dwt" type="text" class="input form-control" id="vesselDwt" title="Dead weight tonnage">
                    </div>
                    <div class="form-group">
                        <label for="vesselYearBuilt">Year built</label>
                        <input value=${vessel.year_built} name="year_built" type="text" class="input form-control" id="vesselYearBuilt" title="Year built">
                    </div>
                    <div class="form-group">
                        <label for="vesselCosts">Daily costs ($)</label>
                        <input oninput="if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" value=${vessel.costs} name="costs" type="text" maxlength="6" class="input form-control" id="vesselCosts" title="Daily costs ($)">
                    </div>
                    <div class="form-group vesselActive">
                        <label for="vesselActive">Active</label>
                        <label class="toggle">
                            <c:choose>
                                <c:when test="${vessel.active=='false'}">
                                    <input title="Active" name="active" id="vesselActive" type="checkbox"/>
                                </c:when>
                                <c:otherwise>
                                    <input title="Active" name="active" id="vesselActive" type="checkbox" checked/>
                                </c:otherwise>
                            </c:choose>
                            <div></div>
                        </label>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>
    <table style="display:none;" class="tableFleet">
        <thead>
        <tr>
            <th>Vessel name</th>
            <th>Flag</th>
            <th>Dead weight tonnage</th>
            <th>Year built</th>
            <th>Daily costs ($)</th>
            <th>Active</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${vesselList}" var="vessel">
            <tr>
                <td>${vessel.name}</td>
                <td>${vessel.flag}</td>
                <td>${vessel.dwt}</td>
                <td>${vessel.year_built}</td>
                <td>${vessel.costs}</td>
                <c:choose>
                    <c:when test="${vessel.active=='false'}">
                        <td>No</td>
                    </c:when>
                    <c:otherwise>
                        <td>Yes</td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>