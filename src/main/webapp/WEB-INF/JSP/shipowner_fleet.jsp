<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="title">Fleet</div>
<button type="button" class="smallButton downloadFleetButton" name="downloadFleet">Download fleet data</button>
<div class="addVesselIcon">
    <button title="Add a new vessel" class="plus"><span>+</span></button>
</div>
<div class="container">
    <c:forEach items="${vesselList}" var="vessel">
        <div class="bg-text fleetList">
            <form:form>
                <div class="form-row">
                    <div class="form-group vesselUpdateForm">
                        <label style="display:none;" for="vesselId"></label>
                        <form:input hidden="hidden" value="${vessel.id}"  path="id" type="number" class="input form-control" id="vesselId" title="Vessel ID"/>
                        <label style="display:none;" for="vesselShipowner"></label>
                        <form:input hidden="hidden" value="${vessel.shipowner}" path="shipowner" type="text" class="input form-control" id="vesselShipowner" title="Shipowner" />
                        <label for="vesselName">Name</label>
                        <form:input value="${vessel.name}" path="name" type="text" class="input form-control" id="vesselName" title="Vessel name" />
                    </div>
                    <div class="form-group">
                        <label for="vesselFlag">Flag</label>
                        <form:input value="${vessel.flag}" path="flag" type="text" class="input form-control" id="vesselFlag" title="Flag" />
                    </div>
                    <div class="form-group">
                        <label for="vesselDwt">DWT</label>
                        <form:input value="${vessel.dwt}" path="dwt" type="text" class="input form-control" id="vesselDwt" title="Dead weight tonnage" />
                    </div>
                    <div class="form-group">
                        <label for="vesselYearBuilt">Year built</label>
                        <form:input value="${vessel.year_built}" path="year_built" type="text" class="input form-control" id="vesselYearBuilt" title="Year built" />
                    </div>
                    <div class="form-group">
                        <label for="vesselCosts">Daily costs ($)</label>
                        <form:input oninput="if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" value="${vessel.costs}" path="costs" type="text" maxlength="6" class="input form-control" id="vesselCosts" title="Daily costs ($)" />
                    </div>
                    <div class="form-group vesselActive">
                        <label for="vesselActive">Active</label>
                        <label class="toggle">
                            <c:choose>
                                <c:when test="${vessel.active=='false'}">
                                    <form:input title="Active" path="active" id="vesselActive" type="checkbox"/>
                                </c:when>
                                <c:otherwise>
                                    <form:input title="Active" path="active" id="vesselActive" type="checkbox" checked="checked"/>
                                </c:otherwise>
                            </c:choose>
                            <div></div>
                        </label>
                    </div>
                </div>
            </form:form>
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