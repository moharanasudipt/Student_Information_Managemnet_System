<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.,Model.Student,SIMS." %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8601a8c761.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="admin_main.css">
        <link rel="stylesheet" href="nav.css">
        <link href="HR_btn.css" rel="stylesheet" /> 
        <link rel="icon" href="user.png">
        <title>Add Student</title>
        <style>
             *{
            margin: 0;
            padding: 0;
        }
        .add_student{             
            width: 210%;
            height: 100vh;
            display: flex;
            align-items: center;
           justify-content: center;
        }
        .add_s_body{
            background-color: rgba(152, 128, 104, 0.278);
            height: 75%;
            width: 60%;
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
            flex-direction: row;
        }
        .add_button{
            height: 15%;            
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .add_button button{
            height: 68%;
            width: 20%;
            border-radius: 20px;
        }
        .add_s_left{
            height: 100%;
            width: 50%;            
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            gap: 5px;
        }
        .add_s_name_label{            
            width: 99%;
            height: 15%;
            display: flex;
            align-items: center;          
        }
        .add_s_name_label label{
            font-size: 1.2rem;
            width: 30%;
        }
        .add_s_name_label input{
            width: 65%;
            height: 55%;
            border-radius: 20px;
            padding: 8px;
            display: flex;
            align-items: center;
            justify-content: center;            
        }
        .add_s_right{
            height: 100%;
            width: 50%;            
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            gap: 5px;
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
                    <li id="name"><%=session.getAttribute("AdminName")%></li>
                    <li><a href="logout"><img src="./switch.png" alt="logout"></a></li>
                </ul>
            </div>
        </nav>
        <div class="Std_form_main_admin">
            <form action="addSudentServlet" class="Std_form_main_adminn" method="post" enctype="multipart/form-data">
                <div class="add_student">
                    <div class="add_s_body">
                        <div class="add_position">
                            <div class="add_s_left">
                                <div class="add_s_name_label">
                                    <label for="">Full Name :</label>
                                    <input type="text" name="name">
                                </div>
                                <div class="add_s_name_label">
                                    <label for="">Address :</label>
                                    <input type="text" name="address">
                                </div>
                                <div class="add_s_name_label">
                                    <label for="">Age :</label>
                                    <input type="text" name="age">
                                </div>
                                <div class="add_s_name_label">
                                    <label for="">Date of Birth :</label>
                                    <input type="text" name="dob">
                                </div>
                                <div class="add_s_name_label">
                                    <label for="">Number :</label>
                                    <input type="text" name="contact">
                                </div>
                            </div>
                            <div class="add_s_right">
                                <div class="add_s_name_label">
                                    <label for="">Gender :</label>
                                    <input type="text" name="gender">
                                </div>
                                <div class="add_s_name_label">
                                    <label for="">GuardianName :</label>
                                    <input type="text" name="parent">
                                </div>
                                <div class="add_s_name_label">
                                    <label for="">Email :</label>
                                    <input type="text" name="email">
                                </div>
                                <div class="add_s_name_label">
                                    <label for="">Branch :</label>
                                    <input type="text" name="branch">
                                </div>
                                <div class="add_s_name_label">
                                    <input type="file" name="files" style="display: flex; align-items: center; justify-content: center;">
                                </div>
                            </div>
                        </div>
                        <div class="add_button">
                            <button type="submit" class="btn">Register</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
