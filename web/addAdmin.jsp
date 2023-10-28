<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,Model.HR,SIMS.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="icon" href="user.png" />        
        <link href="HR.css" rel="stylesheet" />
        <link href="HR_btn.css" rel="stylesheet" />        
        <title>Add Admin</title>
        <style>
            body {

                background-color: #ffffff;
            }
            .card {
                background:url(bg.jpg);
                background-size: cover;
            }
            * {
                color: beige;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-style: oblique;
            }
            .p{
                text-align: center;
                text-shadow: 2px 2px 5px rgb(249, 162, 0);
                text-decoration: wavy;
                margin-top: 20px;
            }
            .card{
                box-shadow: 6px 3px 42px rgb(104, 79, 5);
            }
            .i{
                font: bolder;
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#"><button class="btn1"><strong>HR Dashboard</strong>
                                    <div id="container-stars">
                                        <div id="stars"></div>
                                    </div>
                                    <div id="glow">
                                        <div class="circle"></div>
                                        <div class="circle"></div>
                                    </div></button></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="HR.jsp"><button class="btn btn-warning" type="button">HOME</button></a></li>
                        <li class="nav-item"><a class="nav-link" href="#!"><button class="btn btn-outline-primary"><%=session.getAttribute("HRname")%></button></a></li>
                        <li class="nav-item"><a class="nav-link" href="logout"><button class="btn btn-outline-danger">LOGOUT</button></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--body-->
               <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-sm-5">
                    <div class="card">
                        <div class="card-header" id="cardHeader">
                            <h3 class="p"> Add Admin</h3>
                        </div>
                        <div class="card-body" id="cardBody">
                            <form action="addAdmin" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="name" class="i">Enter Name:</label>
                                    <input type="text" class="form-control " id="name" name="name" required/>
                                </div>                                
                                <div class="form-group">
                                    <label for="email" class="i">Enter Email:</label>
                                    <input type="email" class="form-control " id="email" name="email" required />
                                </div>
                                <div class="form-group">
                                    <label for="password" class="i">Enter Password:</label>
                                    <input type="password" class="form-control" id="password" name="password" required />
                                </div>
                                <div class="form-group">
                                    <label for="reenterPassword" class="i">ReEnter Password:</label>
                                    <input type="password" class="form-control" id="reenterPassword" required />
                                </div>                
                                <div id="passwordMatchMessage"></div>
                                <div class="form-group">
                                    <label for="photo" class="i">Upload Photo:</label><br>
                                    <input type="file" name="photo" id="photo" required/>   
                                </div>                                                                                            
                                <br>
                                <button type="submit" class="btn btn-outline-warning">Submit</button>                               
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        <script>
            const passwordInput = document.getElementById("password");
            const reenterPasswordInput = document.getElementById("reenterPassword");
            const passwordMatchMessage = document.getElementById("passwordMatchMessage");

            passwordInput.addEventListener("input", checkPasswordMatch);
            reenterPasswordInput.addEventListener("input", checkPasswordMatch);

            function checkPasswordMatch() {
                const password = passwordInput.value;
                const reenterPassword = reenterPasswordInput.value;

                if (password === reenterPassword) {
                    passwordMatchMessage.textContent = "Passwords match!";
                    passwordMatchMessage.style.color = "green";
                } else {
                    passwordMatchMessage.textContent = "Passwords do not match.";
                    passwordMatchMessage.style.color = "red";
                }
            }
        </script>
    </body>
</html>
