d<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html style="display:none;">
<head>
    <title>Wave Magister</title>
    <link rel="stylesheet" type="text/css" href="resources/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="resources/reset.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="resources/style.css"/>
    <link rel="shortcut icon" href="resources/favicon.ico" />
</head>
<video autoplay muted loop>
    <source src="resources/video.mp4" type="video/mp4">
</video>
<body>
<header>
</header>
<main>
    <div class="jumbotron-parent">
        <div class="jumbotron">
            <h1 class="display-4"><span><img alt="Logo" src="resources/logo_big.svg"/></span></h1>
            <p class="lead">This project is under development. It will be up and live soon.</p>
            <hr class="my-4">
            <div class="jumbotron-buttons">
                <button type="button" class="button jumbotron-button" name="login">Login</button>
                <button type="button" class="button jumbotron-button" name="register">Register</button>
            </div>
            <button type="button" class="smallButton notesButton" name="notes">Notes</button>
        </div>
    </div>
    <div class="modal-overlay modal-overlay-notes">
        <div class="modal modal-notes">
            <a class="close-modal">
                <svg viewBox="0 0 20 20">
                    <path fill="#001755" d="M15.898,4.045c-0.271-0.272-0.713-0.272-0.986,0l-4.71,4.711L5.493,4.045c-0.272-0.272-0.714-0.272-0.986,0s-0.272,0.714,0,0.986l4.709,4.711l-4.71,4.711c-0.272,0.271-0.272,0.713,0,0.986c0.136,0.136,0.314,0.203,0.492,0.203c0.179,0,0.357-0.067,0.493-0.203l4.711-4.711l4.71,4.711c0.137,0.136,0.314,0.203,0.494,0.203c0.178,0,0.355-0.067,0.492-0.203c0.273-0.273,0.273-0.715,0-0.986l-4.711-4.711l4.711-4.711C16.172,4.759,16.172,4.317,15.898,4.045z"></path>
                </svg>
            </a>
            <div class="modal-content">
                <div class="notesHeader">
                    <h1 class="notesH1">Wave Magister</h1>
                    <p>Team project for Coding Bootcamp 6 (AFDEmp)</p>
                </div>
                <div class="notesContent">
                    <p>ATTENTION: THIS PROJECT HAS BEEN CREATED EXCLUSIVELY FOR EDUCATIONAL PURPOSES. IT WILL NEVER BE INTENDED TO BE USED IN THE PROFESSIONAL INDUSTRY NOR DO THE ELEMENTS IT UTILIZES REPRESENT THE METHODS, TOOLS, PRACTICES AND APPLICATIONS OF THE REAL WORLD. THEY HAVE BEEN ASSEMBLED AND INCLUDED IN THIS PROJECT ONLY TO DEMONSTRATE A WEB APPLICATION THAT OPERATES FLAWLESSLY. WITH THIS STATEMENT, ITS SCOPE IS EXPLICITLY EXCLUDED FROM COMMERCIAL EXPLOITATION.</p>
                    <p>Wave Magister is a team project created within the courses of Coding Bootcamp 6, held by the Alliance For Digital Employability (AFDEmp) under the auspices of Hellenic Professionals Informatics Society (HEPIS). Based on the VesselBot digital chartering marketplace, it aims to emulate the way charterers and tanker shipowners can interact to conclude voyage charterparty agreements, that is, it is an online shipbroking service.</p>
                    <p>The main idea is quite simple: Just like real property transactions, shipowners insert in the system basic data about the vessels that they want to operate in the crude oil spot market and charterers search for the appropriate vessels to be chartered. If a vessel matches the needs of a charterer for a specific voyage, he can select it and the agreement is concluded.</p>
                    <p>The system recognizes three types of users: shipowners, charterers and an “emergency” administrator, having little interact with the system due to the nature of the data submitted and transacted.</p>
                    <p>The shipowner’s panel comprises of two sub-panels: one for reviewing all the agreements that have been concluded and one for managing his vessels. The second sub-panel allows him to insert new vessels into his fleet, amend them* and choose whether they are active and available in the spot market.</p>
                    <p>The charterer’s first sub-panel works exactly like the shipowner’s one and allows him to review all the concluded transactions. But the second one is the most substantial part of this web application. This panel, called “Spot offers”, allows him to search for available offers, based on the data that shipowners have already inserted. If he finds a vessel that suits his needs for a specific voyage, he can choose it and a new entry is created in the system containing all the relevant data to the specific agreement.</p>
                    <p>Lastly, the administrator’s role is to amend the companies’ firm names if a mistake occurs and to activate new users’ account after they have been registered.</p>
                    <p>* Entities can be amended by directly editing their fields in the relevant sub-panels.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="register-parent">
        <div class="register">
            <div class="title">Register</div>
            <div class="smallLogin-parent">
                <button type="button" class="smallButton" name="smallLogin">Switch to Login</button>
            </div>
            <div class="bg-text">
                <form:form  method="POST" action="/wavemagister/register.html" modelAttribute="register">
                    <div class="form-group typeRadio">
                        <label for="company-type">Register as</label>
                        <div>
                            <div id="company-type" class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary active">
                                    <form:radiobutton name="role" id="option1" path="role" autocomplete="off" value="shipowner" checked="checked" />Shipowner
                                </label>
                                <label class="btn btn-secondary">
                                    <form:radiobutton name="role" id="option2" path="role" value="charterer" autocomplete="off" />Charterer
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company-name">Company name</label>
                        <form:input id="company-name" type="text" path="company" class="input form-control" placeholder="e.g. Perseus Shipping S.A." required="required" />
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="rUsername">Username</label>
                            <form:input type="text" class="input form-control" id="rUsername" path="username" maxlength="16" placeholder="e.g. perseus" required="required" />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="rPassword">Password</label>
                            <form:input type="password" class="input form-control" id="rPassword" path="password" maxlength="16" placeholder="Up to 16 characters" required="required" />
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="button afterForm" name="Register">Register</button>
                        <input class="button afterForm" type="reset" value="Reset">
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <div class="login-parent">
        <div class="login">
            <div class="title">Login</div>
            <div class="smallRegister-parent" style="display:none;">
                <button type="button" class="smallButton" name="smallRegister">Switch to Register</button>
            </div>
            <div class="bg-text">
                <form:form method="POST" action="/wavemagister/main.html" modelAttribute="login">
                    <div class="form-group">
                        <label for="lusername">Username</label>
                        <form:input type="text" class="input form-control" id="lusername" path="username" maxlength="16" placeholder="Username" required="required" />
                    </div>
                    <div class="form-group">
                        <label for="lpassword">Password</label>
                        <form:input type="password" class="input form-control" id="lpassword" path="password" maxlength="16" placeholder="Password" required="required" />
                    </div>
                    <div class="text-center">
                        <button type="submit" class="button afterForm" name="login">Login</button>
                        <input class="button afterForm" type="reset" value="Reset">
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</main>
<footer>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/main.js"></script>
</body>
</html>