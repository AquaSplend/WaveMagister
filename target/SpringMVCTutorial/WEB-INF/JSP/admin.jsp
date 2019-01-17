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
            <nav class="navbar navbar-expand-md navbar-dark">
                <a class="navbar-brand mx-auto" rel="home" href=""><span><img alt="Logo" src="resources/logo.svg"/></span></a>
                <button class="navbar-toggler order-first" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mr-auto"></ul>
                    <ul class="navbar-nav">
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
                                    <div class="row">
                                        <div class="col-8 col8">
                                            <c:forEach items="${userList}" var="user">
                                                <form method="post" action="/wavemagister/user.html" commandName="user"> 
                                                    <label for="${user.id}"></label>
                                                    <input hidden id="${user.id}" type="text" name="id" value=${user.id} />
                                                    <label for="${user.username}"></label>
                                                    <input hidden id="${user.username}" type="text" name="username" value=${user.username} />
                                                    <label for="${user.password}"></label>
                                                    <input hidden id="${user.password}" type="text" name="password" value=${user.password} />
                                                    <label for="${user.company}"></label>
                                                    <input id="${user.company}" type="text" name="company" title="Rename" value=${user.company} placeholder="Rename"/>
                                                    <label for="${user.role}"></label>
                                                    <input hidden id="${user.role}" type="text" name="role" value=${user.role} />
                                                    <label for="${user.activated}"></label>
                                                    <input hidden id="${user.activated}" type="text" name="id" value=${user.activated} />
                                                </form>
                                            </c:forEach>
                                            
                                        </div>
                                        <div class="col-4 col4">
                                            <div class="activated">Activated</div>
                                            <div class="onOff">
                                                <form action="" method="post">
                                                    <label class="toggle">
                                                        <input name="Activated" type="hidden" value="0"/>
                                                        <input title="Activated" name="Activated" type="checkbox" checked/>
                                                        <div></div>
                                                    </label>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 col8">
                                            <form action="" method="post">
                                                <label for="Anemos Tankers S.A."></label>
                                                <input id="Anemos Tankers S.A." type="text" name="company" title="Rename" value="Anemos Tankers S.A." placeholder="Rename"/>
                                            </form>
                                        </div>
                                        <div class="col-4 col4">
                                            <div class="activated">Activated</div>
                                            <div class="onOff">
                                                <form action="" method="post">
                                                    <label class="toggle">
                                                        <input title="Activated" type="checkbox" value="0"/>
                                                        <div></div>
                                                    </label>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
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
                                    <div class="row">
                                        <div class="col-8 col8">
                                            <form action="" method="post">
                                                <label for="Exxon Mobil Corp."></label>
                                                <input id="Exxon Mobil Corp." type="text" name="company" title="Rename" value="Exxon Mobil Corp." placeholder="Rename"/>
                                            </form>
                                        </div>
                                        <div class="col-4 col4">
                                            <div class="activated">Activated</div>
                                            <div class="onOff">
                                                <form action="" method="post">
                                                    <label class="toggle">
                                                        <input title="Activated" name="Activated" type="checkbox" value="1"/>
                                                        <div></div>
                                                    </label>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-8 col8">
                                            <form action="" method="post">
                                                <label for="Πετρέλαια Καβάλας Α.Ε."></label>
                                                <input id="Πετρέλαια Καβάλας Α.Ε." type="text" name="company" title="Rename" value="Πετρέλαια Καβάλας Α.Ε." placeholder="Rename"/>
                                            </form>
                                        </div>
                                        <div class="col-4 col4">
                                            <div class="activated">Activated</div>
                                            <div class="onOff">
                                                <form action="" method="post">
                                                    <label class="toggle">
                                                        <input title="Activated" type="checkbox" checked/>
                                                        <div></div>
                                                    </label>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
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