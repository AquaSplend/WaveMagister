<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="wheel.jsp" %>
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
<header>
    <nav class="navbar navbar-expand-md navbar-light navbarColored">
        <a class="navbar-brand mx-auto" rel="home" href=""><span><img alt="Logo" class="logoImage" src="resources/logo.svg"/></span></a>
        <button class="navbar-toggler order-first" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item otherButtonParent">
                    <button type="button" class="navBut otherButton1" name="shipownerAgreementsButton">Agreements</button>
                </li>
                <li class="nav-item otherButtonParent">
                    <button type="button" class="navBut userIdentifier" name="fleetButton">Fleet</button>
                </li>
            </ul>
            <ul class="navbar-nav">
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
    <div class="modal-overlay modal-overlay-newVessel">
        <div class="modal modal-newVessel">
            <a class="close-modal close-modal-newVessel">
                <svg viewBox="0 0 20 20">
                    <path fill="#001755" d="M15.898,4.045c-0.271-0.272-0.713-0.272-0.986,0l-4.71,4.711L5.493,4.045c-0.272-0.272-0.714-0.272-0.986,0s-0.272,0.714,0,0.986l4.709,4.711l-4.71,4.711c-0.272,0.271-0.272,0.713,0,0.986c0.136,0.136,0.314,0.203,0.492,0.203c0.179,0,0.357-0.067,0.493-0.203l4.711-4.711l4.71,4.711c0.137,0.136,0.314,0.203,0.494,0.203c0.178,0,0.355-0.067,0.492-0.203c0.273-0.273,0.273-0.715,0-0.986l-4.711-4.711l4.711-4.711C16.172,4.759,16.172,4.317,15.898,4.045z"></path>
                </svg>
            </a>
            <div class="modal-content">
                <div class="mediumTitle">Add new vessel to fleet</div>
                <div class="bg-text1">
                    <form>
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
</header>
<main>
    <div class="notify bottom-right" data-notification-status="success"></div>
    <div class="notify bottom-right" data-notification-status="error"></div>
    <div class="shipowner-agreements-parent" style="display:none;"></div>
    <div class="fleet" style="display:none;"></div>
</main>
<footer>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/logged_in.js"></script>
<script type="text/javascript" src="resources/logged_in_shipowner.js"></script>
<script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
<script type="text/javascript" src="resources/autotable.js"></script>
</body>
</html>