<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html style="display: none;">
    <head>
        <title>Agreements</title>
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
            <nav class="navbar navbar-expand-md navbar-light navbarColored">
                <a class="navbar-brand mx-auto" rel="home" href=""><span><img alt="Logo" src="resources/logo.svg"/></span></a>
                <button class="navbar-toggler order-first" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item otherButtonParent">
                            <button type="button" class="navBut" name="agreementsButton">Agreements</button>
                        </li>
                        <li class="nav-item otherButtonParent">
                            <button type="button" class="navBut" name="profileButton">Profile</button>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <form action="index.jsp"><button type="submit" class="nav-item navBut">Logout</button></form>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <main class="mainItems">
            <div class="agreements">
                <div class="title">Agreements</div>
                <div class="container">
                    <div class="row">
                        <div class="col-md col8">
                            <div class="activated">Vessel</div>
                            <div class="underItem">Symphonic</div>
                        </div>
                        <div class="col-md col8">
                            <div class="activated">Charterer</div>
                            <div class="underItem">ExxonMobil Corp.</div>
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
                            <div class="activated">Freight</div>
                            <div class="underItem">$ 50,000</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="profile" style="display: none;">
                <div class="title">Profile</div>
                <div class="smallTitle">Password</div>
                <div class="passwordChange">
                    <form action="" method="post">
                        <input class="width-dynamic proba dva" id="password" type="password" name="password" value="5555" />
                    </form>
                </div>
                <div class="title vesselsTitle">Vessels</div>
                <div class="addVesselIcon">
                    <button title="Add new vessel" class="plus"><span>+</span></button>
                </div>
                <div class="container">
                    <c:forEach items="${vesselList}" var="vessel">
                        <div class="row">
                            <div class="col-md col8">
                                <div class="activated">Name</div>
                                <div class="underItem underItemText">
                                    <form method="post" action="/wavemagister/vessel.html" commandName="vessel">
                                        <input hidden type="text" name="id" value=${vessel.id} />
                                        <input class="width-dynamic proba dva" id="vesselName" type="text" name="name" value=${vessel.name} />
                                        <input hidden type="text" name="flag" value=${vessel.flag} />
                                        <input hidden type="text" name="year_built" value="${vessel.year_built}" />
                                        <input hidden type="text" name="dwt" value=${vessel.dwt} />
                                        <input hidden type="text" name="shipowner" value=${vessel.shipowner} />
                                        <input hidden type="text" name="active" value=${vessel.active} />
                                    </form>
                                </div>
                            </div>
                            <div class="col-md col8">
                                <div class="activated">Flag</div>
                                <div class="underItem underItemText">
                                    <form method="post" action="/wavemagister/vessel.html" commandName="vessel">
                                        <input class="width-dynamic proba dva" id="vesselFlag" type="text" name="flag" value="MA" />
                                    </form>
                                </div>
                            </div>
                            <div class="col-md col8">
                                <div class="activated">Year built</div>
                                <div class="underItem underItemText">
                                    <form method="post" action="/wavemagister/vessel.html" commandName="vessel">
                                        <input class="width-dynamic proba dva" id="vesselYearBuilt" type="text" name="year_built" value="2019" />
                                    </form>
                                </div>
                            </div>
                            <div class="col-md col8">
                                <div class="activated">DWT</div>
                                <div class="underItem underItemText">
                                    <form method="post" action="/wavemagister/vessel.html" commandName="vessel">
                                        <input class="width-dynamic proba dva" id="dwt" type="text" name="dwt" value="154398" />
                                    </form>
                                </div>
                            </div>
                            <div class="col-md col8">
                                <div class="activated">Daily costs ($)</div>
                                <div class="underItem underItemText">
                                    <form method="post" action="/wavemagister/vessel.html" commandName="vessel">
                                        <input class="width-dynamic proba dva" id="vesselDailyCosts" type="text" name="costs" value="3,500" />
                                    </form>
                                </div>
                            </div>
                            <div class="col-md col8">
                                <div class="activated">Active</div>
                                <div class="underItem"><form action="/wavemagister/vessel.html" method="post">
                                        <label class="toggle">
                                            <input title="Active" type="checkbox" checked/>
                                            <div></div>
                                        </label>
                                    </form></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
        <footer>
        </footer>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script type="text/javascript" src="resources/logged_in.js"></script>
    </body>
</html>