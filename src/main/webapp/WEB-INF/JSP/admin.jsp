<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html style="display: none;">
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
        <a class="navbar-brand mx-auto" rel="home" href=""><span><img alt="Logo" src="resources/logo.svg"/></span></a>
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
                            <input type="password" class="input form-control" id="password" maxlength="16" placeholder="Password" required>
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
    <iframe style="display:none;" name="form"></iframe>
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
                                <div class="row">
                                    <div class="col-8 col8 nameInput">
                                        <form target="form" method="post" action="/wavemagister/user.html" commandName="user">
                                            <input hidden type="text" name="id" value=${shipowner.id} />
                                            <input hidden type="text" name="username" value=${shipowner.username} />
                                            <input hidden type="text" name="password" value=${shipowner.password} />
                                            <input type="text" name="company" title="Rename" maxlength="100" value=${shipowner.company} placeholder="Rename"/>
                                            <input hidden type="text" name="role" value=${shipowner.role} />
                                            <input hidden type="text" name="id" value=${shipowner.activated} />
                                        </form>
                                    </div>
                                    <div class="col-4 col4">
                                        <div class="activated">Activated</div>
                                        <div class="onOff">
                                            <form target="form" action="/wavemagister/user.html" method="post">
                                                <input hidden type="text" name="id" value=${shipowner.id} />
                                                <input hidden type="text" name="username" value=${shipowner.username} />
                                                <input hidden type="text" name="password" value=${shipowner.password} />
                                                <input hidden type="text" name="company" value=${shipowner.company} />
                                                <input hidden type="text" name="role" value=${shipowner.role} />
                                                <label class="toggle">
                                                    <c:choose>
                                                        <c:when test="${shipowner.activated=='false'}">
                                                            <input title="Activated" name="Activated" type="checkbox"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input title="Activated" name="Activated" type="checkbox" checked/>
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
                                <div class="row">
                                    <div class="col-8 col8 nameInput">
                                        <form target="form" method="post" action="/wavemagister/user.html" commandName="user">
                                            <input hidden type="text" name="id" value=${charterer.id} />
                                            <input hidden type="text" name="username" value=${charterer.username} />
                                            <input hidden type="text" name="password" value=${charterer.password} />
                                            <input type="text" name="company" title="Rename" maxlength="100" value=${charterer.company} placeholder="Rename"/>
                                            <input hidden type="text" name="role" value=${charterer.role} />
                                            <input hidden type="text" name="id" value=${charterer.activated} />
                                        </form>
                                    </div>
                                    <div class="col-4 col4">
                                        <div class="activated">Activated</div>
                                        <div class="onOff">
                                            <form target="form" action="/wavemagister/user.html" method="post">
                                                <input hidden type="text" name="id" value=${charterer.id} />
                                                <input hidden type="text" name="username" value=${charterer.username} />
                                                <input hidden type="text" name="password" value=${charterer.password} />
                                                <input hidden type="text" name="company" value=${charterer.company} />
                                                <input hidden type="text" name="role" value=${charterer.role} />
                                                <label class="toggle">
                                                    <c:choose>
                                                        <c:when test="${charterer.activated=='false'}">
                                                            <input title="Activated" name="Activated" type="checkbox"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input title="Activated" name="Activated" type="checkbox" checked/>
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