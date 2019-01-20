<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html style="display: none;">
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="resources/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="resources/reset.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="resources/style.css"/>
    <link rel="shortcut icon" href="resources/favicon.ico" />
</head>
<video class="video-blurred" autoplay muted loop>
    <source src="resources/video.mp4" type="video/mp4">
</video>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light navbarColored">
        <a class="navbar-brand mx-auto" rel="home" href=""><span><img alt="Logo" class="logoImage" src="resources/logo.svg"/></span></a>
        <button class="navbar-toggler order-first" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item otherButtonParent">
                    <button type="button" class="navBut otherButton1" name="agreementsButton">Agreements</button>
                </li>
                <li class="nav-item otherButtonParent">
                    <button type="button" class="navBut" name="offersButton">Spot offers</button>
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
                    <form action="index.jsp"><button type="submit" class="nav-item navBut">Logout</button></form>
                </li>
            </ul>
        </div>
    </nav>
    <div class="modal-overlay modal-overlay-password">
        <script type="text/javascript" src="https://www.oil-price.net/widgets/brent_crude_price_large/gen.php?lang=en"></script>
        <div class="modal modal-password">
            <a class="close-modal">
                <svg viewBox="0 0 20 20">
                    <path fill="#001755" d="M15.898,4.045c-0.271-0.272-0.713-0.272-0.986,0l-4.71,4.711L5.493,4.045c-0.272-0.272-0.714-0.272-0.986,0s-0.272,0.714,0,0.986l4.709,4.711l-4.71,4.711c-0.272,0.271-0.272,0.713,0,0.986c0.136,0.136,0.314,0.203,0.492,0.203c0.179,0,0.357-0.067,0.493-0.203l4.711-4.711l4.71,4.711c0.137,0.136,0.314,0.203,0.494,0.203c0.178,0,0.355-0.067,0.492-0.203c0.273-0.273,0.273-0.715,0-0.986l-4.711-4.711l4.711-4.711C16.172,4.759,16.172,4.317,15.898,4.045z"></path>
                </svg>
            </a>
            <div class="modal-content">
                <div class="mediumTitle">Add your new password</div>
                <div class="bg-text1">
                    <form method="POST" action="">
                        <div class="form-group">
                            <label style="display:none;" for="password"></label>
                            <input type="password" class="input form-control" id="password" maxlength="16" placeholder="Password" name="password" required>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="button afterForm" name="login">Change password</button>
                            <input class="button afterForm" type="reset" value="Reset">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>
<main>
    <div class="agreements">
        <div class="title">Agreements</div>
        <div class="container">
            <div class="row">
                <div class="col-md col8">
                    <div class="activated">Vessel</div>
                    <div class="underItem">Symphonic</div>
                </div>
                <div class="col-md col8">
                    <div class="activated">Shipowner</div>
                    <div class="underItem">Perseus</div>
                </div>
                <div class="col-md col8">
                    <div class="activated">Voyage start</div>
                    <div class="underItem">18/1/2019</div>
                </div>
                <div class="col-md col8">
                    <div class="activated">Voyage end</div>
                    <div class="underItem">29/1/2019</div>
                </div>
                <div class="col-md col8">
                    <div class="activated">Freight ($)</div>
                    <div class="underItem">50,000</div>
                </div>
            </div>
        </div>
    </div>
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
</main>
<footer>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/charterer.js"></script>
<script type="text/javascript" src="resources/logged_in.js"></script>
</body>
</html>