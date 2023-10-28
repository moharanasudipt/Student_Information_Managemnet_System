<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,Model.HR,SIMS.*" %>
<% if(session.getAttribute("HRname")==null) 
{ response.sendRedirect("Login.html"); } 
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />        
        <title>HR DASHBOARD</title>
        <!-- LOGO-->
        <link rel="icon" href="user.png" />        
        <link href="HR.css" rel="stylesheet" />
        <link href="HR_btn.css" rel="stylesheet" />        
        <style>
            img{
                height: 130px;
                width: 130px;
                border-radius: 50%;
            }
            .card {
                width: 100%;
                max-width: 300px;
                min-width: 200px;
                height: 250px;
                background-color: #292929;
                margin: 10px;
                border-radius: 10px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.24);
                border: 2px solid rgba(7, 7, 7, 0.12);
                font-size: 16px;
                transition: all 0.3s ease;
                position: relative;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                cursor: pointer;
                font-family: 'Poppins', sans-serif;
            }
            .icon {
                margin: 0 auto;
                width: 100%;
                height: 80px;
                max-width: 80px;
                background: linear-gradient(90deg, #7eaaff 0%, #ff48fb 40%, rgba(0, 0, 0, 0.28) 60%);
                border-radius: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                transition: all 0.8s ease;
                background-position: 0px;
                background-size: 200px;
            }
            .icon svg {
                fill: white;
            }

            .card .title {
                width: 100%;
                margin: 0;
                text-align: center;
                margin-top: 30px;
                color: white;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 4px;
            }

            .card .text {
                width: 80%;
                margin: 0 auto;
                font-size: 13px;
                text-align: center;
                margin-top: 20px;
                color: white;
                font-weight: 200;
                letter-spacing: 2px;
                opacity: 0;
                max-height: 0;
                transition: all 0.3s ease;
            }

            .card:hover {
                height: 270px;
            }

            .card:hover .text {
                transition: all 0.3s ease;
                opacity: 1;
                max-height: 40px;
            }

            .card:hover .icon {
                background-position: -120px;
                transition: all 0.3s ease;
            }

            .btn3 {
                position: relative;
                padding: 10px 20px;
                border-radius: 7px;
                border: 1px solid rgb(61, 106, 255);
                font-size: 14px;
                text-transform: uppercase;
                font-weight: 600;
                letter-spacing: 2px;
                background: transparent;
                color: #fff;
                overflow: hidden;
                box-shadow: 0 0 0 0 transparent;
                -webkit-transition: all 0.2s ease-in;
                -moz-transition: all 0.2s ease-in;
                transition: all 0.2s ease-in;
            }

            .btn3:hover {
                background: rgb(61, 106, 255);
                box-shadow: 0 0 30px 5px rgba(0, 142, 236, 0.815);
                -webkit-transition: all 0.2s ease-out;
                -moz-transition: all 0.2s ease-out;
                transition: all 0.2s ease-out;
            }

            .btn3:hover::before {
                -webkit-animation: sh02 0.5s 0s linear;
                -moz-animation: sh02 0.5s 0s linear;
                animation: sh02 0.5s 0s linear;
            }

            .btn3::before {
                content: '';
                display: block;
                width: 0px;
                height: 86%;
                position: absolute;
                top: 7%;
                left: 0%;
                opacity: 0;
                background: #fff;
                box-shadow: 0 0 50px 30px #fff;
                -webkit-transform: skewX(-20deg);
                -moz-transform: skewX(-20deg);
                -ms-transform: skewX(-20deg);
                -o-transform: skewX(-20deg);
                transform: skewX(-20deg);
            }

            @keyframes sh02 {
                from {
                    opacity: 0;
                    left: 0%;
                }

                50% {
                    opacity: 1;
                }

                to {
                    opacity: 0;
                    left: 100%;
                }
            }

            .btn3:active {
                box-shadow: 0 0 0 0 transparent;
                -webkit-transition: box-shadow 0.2s ease-in;
                -moz-transition: box-shadow 0.2s ease-in;
                transition: box-shadow 0.2s ease-in;
            }
        </style>
    </head>
    <body>        
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
                        <li class="nav-item"><a class="nav-link" href="logout"><button class="btn btn2">LOGOUT</button></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--Header-->
        <header class="py-4 bg-image-full" style="background-image: url('bg.jpg')">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src='<%=session.getAttribute("HRPhoto")%>' alt="HR" />
                <h1 class="text-white fs-3 fw-bolder">Welcome to SIMS</h1>
                <h3 class="text-white fs-3 fw"> Mr <%=session.getAttribute("HRname")%></h3>
            </div>
        </header>
        <!-- Content section-->
        <section class="py-4">
            <div class="container my-5">
                <div class="row justify-content-center">                                                                             
                    <div class="card">
                        <div class="icon">
                            <svg fill="#000000" width="800px" height="800px" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path d="M15.0778418,12.9406987 L18.5345074,14.5119103 C19.4269931,14.9175857 20,15.8074678 20,16.7878265 L20,17.5 C20,18.8807119 18.8807119,20 17.5,20 L6.5,20 C5.11928813,20 4,18.8807119 4,17.5 L4,16.7878265 C4,15.8074678 4.57300693,14.9175857 5.46549264,14.5119103 L8.92215823,12.9406987 C7.75209123,12.0255364 7,10.6005984 7,9 C7,6.23857625 9.23857625,4 12,4 C14.7614237,4 17,6.23857625 17,9 C17,10.6005984 16.2479088,12.0255364 15.0778418,12.9406987 L15.0778418,12.9406987 Z M9.96126583,13.5668358 L5.87929558,15.4222768 C5.34380416,15.665682 5,16.1996113 5,16.7878265 L5,17.5 C5,18.3284271 5.67157288,19 6.5,19 L17.5,19 C18.3284271,19 19,18.3284271 19,17.5 L19,16.7878265 C19,16.1996113 18.6561958,15.665682 18.1207044,15.4222768 L14.0387342,13.5668358 C13.4161054,13.8452135 12.7261289,14 12,14 C11.2738711,14 10.5838946,13.8452135 9.96126583,13.5668358 L9.96126583,13.5668358 Z M12,13 C14.209139,13 16,11.209139 16,9 C16,6.790861 14.209139,5 12,5 C9.790861,5 8,6.790861 8,9 C8,11.209139 9.790861,13 12,13 Z"/>
                            </svg>
                        </div>
                        <p class="title">Add Admin</p>
                        <p class="text"><a href="addAdmin.jsp"><button type="submit" class="btn3">Click Here</button></a></p>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="card">
                        <div class="icon">
                            <svg width="800px" height="800px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M7 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v2h4a1 1 0 1 1 0 2h-1.069l-.867 12.142A2 2 0 0 1 17.069 22H6.93a2 2 0 0 1-1.995-1.858L4.07 8H3a1 1 0 0 1 0-2h4V4zm2 2h6V4H9v2zM6.074 8l.857 12H17.07l.857-12H6.074zM10 10a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1zm4 0a1 1 0 0 1 1 1v6a1 1 0 1 1-2 0v-6a1 1 0 0 1 1-1z" fill="#0D0D0D"/></svg>  </div>
                        <p class="title">Delete Admin</p>
                        <p class="text"><a href="deleteAdmin.jsp"><button type="submit" class="btn3">Click Here</button></a></p>
                    </div>

                    <!--                     <div class="col-lg-4">
                                          <h3>Add Admin</h3>
                                          <a href="addAdmin.jsp"><button type="submit" class="btn btn-outline-info">Add Admin</button></a>
                                         </div> 
                                        <div class="col-lg-4">
                                            <h3>Delete Admin</h3>
                                            <a href="deleteAdmin.jsp"><button type="submit" class="btn btn-outline-danger">Delete Admin</button></a>
                                        </div>-->
                </div>
            </div>
        </section><br><br><br><br>
        <!-- Footer-->
        <footer class="py-4 bg-dark">
            <div class="container"><h6 class="text-center text-white">Copyright &copy; SIMS 2023</h6></div>
        </footer>        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>           
    </body>
</html>
