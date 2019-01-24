<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="extra.jsp" %>
<html style="display:none;">
<head>
    <title>Admin Panel</title>
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
        <a class="navbar-brand mx-auto" rel="home" href=""><span><img alt="Logo" class="logoImage" src="resources/logo.svg"/></span></a>
        <button class="navbar-toggler order-first" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto"></ul>
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
</header>
<main>
    <div class="container">
        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card-header" id="headingOne">
                    <h2 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            Shipowners
                        </button>
                    </h2>
                </div>
                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                        <div class="container itemInRow">
                            <c:forEach items="${shipowners}" var="shipowner">
                                <div class="row userData">
                                    <div class="col-8 col8 nameInput">
                                        <form>
                                            <input hidden type="text" name="id" value=${shipowner.id} />
                                            <input hidden type="text" name="username" value=${shipowner.username} />
                                            <input hidden type="text" name="password" value=${shipowner.password} />
                                            <input type="text" name="company" title="Rename" maxlength="100" value=${shipowner.company} placeholder="Rename" required />
                                            <input hidden type="text" name="role" value=${shipowner.role} />
                                            <input hidden type="text" name="activated" value=${shipowner.activated} />
                                        </form>
                                    </div>
                                    <div class="col-4 col4">
                                        <div class="activated">Activated</div>
                                        <div class="onOff">
                                            <form>
                                                <input hidden type="text" name="id" value=${shipowner.id} />
                                                <input hidden type="text" name="username" value=${shipowner.username} />
                                                <input hidden type="text" name="password" value=${shipowner.password} />
                                                <input hidden type="text" name="company" value=${shipowner.company} />
                                                <input hidden type="text" name="role" value=${shipowner.role} />
                                                <label class="toggle">
                                                    <c:choose>
                                                        <c:when test="${shipowner.activated=='false'}">
                                                            <input title="Activated" name="activated" type="checkbox"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input title="Activated" name="activated" type="checkbox" checked/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <div></div>
                                                </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingTwo">
                    <h2 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Charterers
                        </button>
                    </h2>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        <div class="container itemInRow">
                            <c:forEach items="${charterers}" var="charterer">
                                <div class="row userData">
                                    <div class="col-8 col8 nameInput">
                                        <form>
                                            <input hidden type="text" name="id" value=${charterer.id} />
                                            <input hidden type="text" name="username" value=${charterer.username} />
                                            <input hidden type="text" name="password" value=${charterer.password} />
                                            <input type="text" name="company" title="Rename" maxlength="100" value=${charterer.company} placeholder="Rename" required />
                                            <input hidden type="text" name="role" value=${charterer.role} />
                                            <input hidden type="text" name="activated" value=${charterer.activated} />
                                        </form>
                                    </div>
                                    <div class="col-4 col4">
                                        <div class="activated">Activated</div>
                                        <div class="onOff">
                                            <form>
                                                <input hidden type="text" name="id" value=${charterer.id} />
                                                <input hidden type="text" name="username" value=${charterer.username} />
                                                <input hidden type="text" name="password" value=${charterer.password} />
                                                <input hidden type="text" name="company" value=${charterer.company} />
                                                <input hidden type="text" name="role" value=${charterer.role} />
                                                <label class="toggle">
                                                    <c:choose>
                                                        <c:when test="${charterer.activated=='false'}">
                                                            <input title="Activated" name="activated" type="checkbox"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input title="Activated" name="activated" type="checkbox" checked/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <div></div>
                                                </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
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