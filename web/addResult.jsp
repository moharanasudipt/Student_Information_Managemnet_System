<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,Model.Student,SIMS.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8601a8c761.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assets/css/admin_main.css">
        <link rel="stylesheet" href="assets/css/nav.css">
        <link href="assets/css/HR_btn.css" rel="stylesheet" />  
        <link rel="icon" href="assets/pictures/user.png">
        <title>Add Result</title>
        <style>
            .add_student{
                width: 100%;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .add_s_body{
                background-color: rgba(133, 133, 133, 0.278);
                height: 65%;
                width: 50%;
                padding: 20px;
                border-radius: 20px;
                box-shadow: 3px 5px 7px cornflowerblue;
            }
            .add_position{
                width: 100%;
                height: 85%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                gap: 5px;
            }
            .add_s_name_label{
                height: 25%;
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .add_s_name_label label{
                width: 15%;
                font-size: 1.2rem;
            }
            .add_s_name_label input{
                width: 50%;
                height: 40%;
                border-radius: 20px;
            }
            .add_button{
                height: 15%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .add_button button{
                height: 68%;
                width: 30%;
                border-radius: 20px;
            }
            .btn{
                color: black;
            }
            .btn:hover{
                color:white;
            }
            .link{
                background: none;
                border: none;
                font-size: 18px;
                padding: 10px;
                font-family: 'Black Ops One', fangsong;
                color:cornsilk;
            }
        </style>

    </head>
    <body>
        <nav class="navbar fixed-top">
            <div class="logo">
                <img src='<%=session.getAttribute("AdminPhoto")%>' alt="admin" id="pic">&emsp; <button class="btn1"><strong>Admin Dashboard</strong>
                    <div id="container-stars">
                        <div id="stars"></div>
                    </div>
                    <div id="glow">
                        <div class="circle"></div>
                        <div class="circle"></div>
                    </div></button></div>
            <div class="options">
                <ul>    
                    <li><a href="StudentDetailAdmin"><input type="button" value="Home" class="link"></a></li>
                    <li><a href="addStudent.jsp"><input type="button" value="Add Student" class="link"></a></li>
                    <li><a href="addFees.jsp"><input type="button" value="Add Fees" class="link"></a></li>
                    <li><a href="addResult.jsp"><input type="button" value="Add Result" class="link"></a></li>
                    <li id="name"><button class="btn"><%=session.getAttribute("AdminName")%></button></li>
                    <li><a href="logout"><button class="btn2">LOGOUT</button></a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <form action="addResult" method="post">		        	
                <div class="add_student">
                    <div class="add_s_body">        
                        <div class="add_position">
                            <div class="add_s_name_label">
                                <label for="">Email :</label>
                                <input type="text" name="email" required>
                            </div>
                            <div class="add_s_name_label">
                                <label for="">Branch :</label>
                                <input type="text" name="branch" required>
                            </div>
                            <div class="add_s_name_label">
                                <label for="">CGPA :</label>
                                <input type="text" name="cgpa" required>
                            </div>
                        </div>
                        <div class="add_button">
                            <button type="submit" class="btn">Update</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>