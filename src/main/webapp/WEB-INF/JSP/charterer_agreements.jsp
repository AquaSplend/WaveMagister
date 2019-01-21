<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="title">Agreements</div>
<button type="button" class="smallButton" name="downloadAgreementsAsCharterer">Download agreements</button>
<div class="container">
    <c:forEach items="${chartererAgreementList}" var="agreement">
        <div class="row">
            <div class="col-md col8">
                <div class="activated">Vessel</div>
                <div class="underItem">${agreement.vessel.name}</div>
            </div>
            <div class="col-md col8">
                <div class="activated">Shipowner</div>
                <div class="underItem">${agreement.vessel.shipowner.company}</div>
            </div>
            <div class="col-md col8">
                <div class="activated">Voyage start</div>
                <div class="underItem">${agreement.start}</div>
            </div>
            <div class="col-md col8">
                <div class="activated">Voyage end</div>
                <div class="underItem">${agreement.end}</div>
            </div>
            <div class="col-md col8">
                <div class="activated">Freight ($)</div>
                <div class="underItem">${agreement.freight}</div>
            </div>
        </div>
    </c:forEach>
</div>
<table style="display:none;" class="tableAgreements">
    <thead>
    <tr>
        <th>Vessel</th>
        <th>Shipowner</th>
        <th>Voyage start</th>
        <th>Voyage end</th>
        <th>Freight</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${chartererAgreementList}" var="agreement">
        <tr>
            <td>${agreement.vessel.name}</td>
            <td>${agreement.vessel.shipowner.company}</td>
            <td>${agreement.start}</td>
            <td>${agreement.end}</td>
            <td>${agreement.freight}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>