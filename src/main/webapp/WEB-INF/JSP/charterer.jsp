<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="extra.jsp" %>
<html style="display: none;">
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="resources/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="resources/reset.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="resources/style.css"/>
    <link rel="shortcut icon" href="resources/favicon.ico" />
</head>
<video class="video-blurred" muted loop>
    <source src="resources/video.mp4" type="video/mp4">
</video>
<body>
<script type="text/javascript" src="https://www.oil-price.net/widgets/brent_crude_price_large/gen.php?lang=en"></script>
<header>
    <nav class="navbar navbar-expand-lg navbar-light navbarColored">
        <a class="navbar-brand mx-auto" rel="home" href=""><span><img alt="Logo" class="logoImage" src="resources/logo.svg"/></span></a>
        <button class="navbar-toggler order-first" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item otherButtonParent">
                    <button type="button" class="navBut otherButton1" name="chartererAgreementsButton">Agreements</button>
                </li>
                <li class="nav-item otherButtonParent">
                    <button type="button" class="navBut userIdentifier" name="offersButton">Spot offers</button>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item oil-parent" style="display:none;">
                    <div class="oilItems">
                        <div><img alt="Oil price" class="oilImage" src="resources/oil.svg"/></div>
                        <div class="dollarSymbol">$</div>
                        <div class="oilIndication"></div>
                    </div>
                </li>
                <li class="nav-item">
                    <button class="nav-item navBut changePasswordButton">Change password</button>
                </li>
                <li class="nav-item">
                    <form action="/wavemagister/logout"><button type="submit" class="nav-item navBut">Logout</button></form>
                </li>
            </ul>
        </div>
    </nav>
</header>
<main>
    <div class="charterer-agreements-parent" style="display:none"></div>
    <div class="offers-parent" style="display:none">
            <div class="offers-search-parent">
                <div class="title">Spot offers</div>
                <div class="bg-text searchOffers">
                    <div class="smallTitle">Search for freight offers</div>
                    <form class="searchForOffersForm">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="quantity">Cargo quantity (MT)</label>
                                <input value="200000" maxlength="6" type="number" name="quantity" class="input form-control" id="quantity" placeholder="e.g. 200000" title="Cargo quantity (MT)" required="required" />
                                <input hidden class="resultsPrice" type="text" name="oilPrice">
                                <input hidden class="resultsDays" type="text" name="days">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="startDate">Start date</label>
                                <input id="startDate" type="date" title="Voyage start date" class="input form-control" min="2019-01-01" max="2099-12-31" required="required" />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="endDate">End date</label>
                                <input id="endDate" type="date" title="Voyage end date" class="input form-control" min="2019-01-01" max="2099-12-31" required="required" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        <div class="offersResults"></div>
    </div>
</main>
<footer>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/logged_in.js"></script>
<script type="text/javascript" src="resources/logged_in_charterer.js"></script>
<script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
<script type="text/javascript" src="resources/autotable.js"></script>
</body>
</html>