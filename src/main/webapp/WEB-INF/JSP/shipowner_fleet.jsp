<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="title">Fleet</div>
<button type="button" class="smallButton downloadFleetButton" name="downloadFleet">Download fleet data</button>
<div class="addVesselIcon">
    <button title="Add a new vessel" class="plus"><span>+</span></button>
</div>
<div class="container">
    <c:forEach items="${vesselList}" var="vessel">
        <div class="bg-text fleetList">
            
            <form action="/wavemagister/Vedit">
                <div class="form-row">
                    <div class="form-group vesselUpdateForm">
                        <label style="display:none;" for="vesselId"></label>
                        <input hidden value="${vessel.id}" name="id" type="number" class="input form-control" id="vesselId" title="Vessel ID">
                        <label style="display:none;" for="vesselShipowner"></label>
                        <input hidden value="${vessel.shipowner.id}" name="shipowner" type="number" class="input form-control" id="vesselShipowner" title="Shipowner">
                        <label for="vesselName">Name</label>
                        <input value="${vessel.name}" name="name" type="text" class="input form-control" id="vesselName" title="Vessel name">
                    </div>
                    <div class="form-group">
                        <label for="vesselFlag">Flag</label>
                        <input value="${vessel.flag}" name="flag" type="text" class="input form-control" id="vesselFlag" title="Flag">
                    </div>
                    <div class="form-group">
                        <label for="vesselDwt">DWT</label>
                        <input value="${vessel.dwt}" name="dwt" type="text" class="input form-control" id="vesselDwt" title="Dead weight tonnage">
                    </div>
                    <div class="form-group">
                        <label for="vesselYearBuilt">Year built</label>
                        <input value="${vessel.year_built}" name="year_built" type="text" class="input form-control" id="vesselYearBuilt" title="Year built">
                    </div>
                    <div class="form-group">
                        <label for="vesselCosts">Daily costs ($)</label>
                        <input oninput="if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" value="${vessel.costs}" name="costs" type="text" maxlength="6" class="input form-control" id="vesselCosts" title="Daily costs ($)">
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