<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="agreements">
    <div class="title">Agreements</div>
    <button type="button" class="smallButton" name="downloadAgreementsAsShipowner">Download agreements</button>
    <div class="container">
        <c:forEach items="${agreementList}" var="agreement">
            <div class="row">
                <div class="col-md col8">
                    <div class="activated">Vessel</div>
                    <div class="underItem">${agreement.vessel.name}</div>
                </div>
                <div class="col-md col8">
                    <div class="activated">Charterer</div>
                    <div class="underItem">${agreement.charterer.company}</div>
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
</div>
<table style="display:none;" class="tableAgreements">
    <thead>
    <tr>
        <th>Vessel</th>
        <th>Charterer</th>
        <th>Voyage start</th>
        <th>Voyage end</th>
        <th>Freight</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${agreementList}" var="agreement">
    <tr>
        <td>${agreement.vessel.name}</td>
        <td>${agreement.charterer.company}</td>
        <td>${agreement.start}</td>
        <td>${agreement.end}</td>
        <td>${agreement.freight}</td>
    </tr>
    </tbody>
    </c:forEach>
</table>