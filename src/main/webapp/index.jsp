<%@ page contentType="text/html;charset=UTF-8" %>
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
                    <h1 class="notesH1">Waves</h1>
                    <p>Waves generated with javascript and &lt;canvas&gt;.</p>

                </div>
                <div class="notes-canvas-wrap">
                    <canvas id="notesCanvas"></canvas>
                </div>
                <div class="notesContent">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate rerum nemo, autem. Maiores quibusdam asperiores iste laboriosam deleniti quo ratione voluptatem expedita temporibus facere velit cum nesciunt, doloremque ducimus consequuntur numquam, accusamus porro a quam.</p>
                    <p>Beatae ullam repellendus tempore, dicta excepturi necessitatibus magnam praesentium illum voluptates nihil, fugiat est, corporis. Reiciendis veritatis facere reprehenderit nemo quod temporibus ea assumenda nulla iure, mollitia beatae debitis consequuntur a blanditiis quasi suscipit eos ab repellendus deleniti fuga accusamus officia maxime perferendis modi! Fugiat libero incidunt sunt nostrum harum?</p>
                    <p>Quis sit debitis nulla natus neque earum odit nihil sequi doloremque eveniet vel vitae doloribus numquam expedita quaerat ex inventore, optio a ipsum ducimus maiores quisquam recusandae? Officia dolore id quisquam perferendis iste officiis sint fugiat temporibus sequi provident commodi deserunt repellendus enim rerum in iusto nulla, rem facere nemo!</p>
                    <p>Voluptatum est alias eaque, odio in dolorum, laboriosam quos officia rem.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="register-parent">
        <div class="register">
            <div class="title">Register</div>
            <div class="nav-item smallLogin-parent">
                <button type="button" class="smallButton" name="smallLogin">Switch to Login</button>
            </div>
            <div class="bg-text">
                <form action="">
                    <div class="form-group typeRadio">
                        <label for="company-type">Register as</label>
                        <div>
                            <div id="company-type" class="btn-group btn-group-toggle" data-toggle="buttons">
                                <label class="btn btn-secondary active">
                                    <input type="radio" name="options" id="option1" autocomplete="off" value="shipowner" checked>Shipowner
                                </label>
                                <label class="btn btn-secondary">
                                    <input type="radio" name="options" id="option2" value="charterer" autocomplete="off">Charterer
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="company-name">Company name</label>
                        <input id="company-name" type="text" class="input form-control" placeholder="e.g. Perseus Shipping S.A." required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="rUsername">Username</label>
                            <input type="text" class="input form-control" id="rUsername" maxlength="16" placeholder="e.g. perseus" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="rPassword">Password</label>
                            <input type="password" class="input form-control" id="rPassword" maxlength="16" placeholder="Up to 16 characters" required>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="button afterForm" name="Register">Register</button>
                        <input class="button afterForm" type="reset" value="Reset">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="login-parent">
        <div class="login">
            <div class="title">Login</div>
            <div class="nav-item smallRegister-parent" style="display:none;">
                <button type="button" class="smallButton" name="smallRegister">Switch to Register</button>
            </div>
            <div class="bg-text">
                <form method="POST" action="admin.jsp">
                    <div class="form-group">
                        <label for="lusername">Username</label>
                        <input type="text" class="input form-control" id="lusername" maxlength="16" placeholder="Username" required>
                    </div>
                    <div class="form-group">
                        <label for="lpassword">Password</label>
                        <input type="password" class="input form-control" id="lpassword" maxlength="16" placeholder="Password" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="button afterForm" name="login">Login</button>
                        <input class="button afterForm" type="reset" value="Reset">
                    </div>
                </form>
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