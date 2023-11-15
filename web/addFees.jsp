<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,Model.Student,SIMS.*" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="assets/pictures/user.png">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="https://kit.fontawesome.com/8601a8c761.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assets/css/admin_main.css">
        <link rel="stylesheet" href="assets/css/nav.css">
        <link href="assets/css/HR_btn.css" rel="stylesheet" />   
        <title>Add Fees</title>
        <style>
            .add_student {
                width: 100%;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 15px;
                flex-direction: column;
            }

            .search {
                width: 20%;
                border-radius: 30px;
                padding: 10px;
                background-color: #b5afaf;
            }

            .search input {
                height: 100%;
                width: 87%;
                border-radius: 30px;
                background-color: #b5afaf;
                outline: none;
                border: 0;
            }

            .search button {
                width: 10%;
                background-color: #b5afaf;
                border: 0;
                outline: none;
                cursor: pointer;
            }

            .add_s_body {
                height: 80%;
                width: 90%;
                padding: 20px;
                border-radius: 20px;
                display: flex;
                align-items: center;
                justify-content: space-around;
                flex-direction: row;
            }
            .update_fee_s {
                width: 55%;
                height: 85%;
                background-color: rgba(180, 168, 166, 0.334);
                border-radius: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 15px;
            }

            .update_fee_top {
                height: 40%;
                width: 90%;
                font-size: 2rem;
                font-family: serif;
                color: #060101;
                gap: 8px;
                display: flex;
                justify-content: left;
                flex-direction: column;
            }

            .update_fee_bottom {
                margin-top: 5px;
                background-color: rgb(140, 180, 188);
                height: 48%;
                width: 88%;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 5px;
            }

            .ub_left {

                box-shadow: 10px 0 5px -2px #dfdbdb;
                width: 40%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                gap: 2px;
            }

            .ub_right {

                width: 60%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                gap: 2px;
            }

            .t_s {

                height: 28%;
                width: 80%;
                display: flex;
                align-items: center;
                padding: 2px;
                padding-left: 10px;
                justify-content: left;
                gap: 5px;
                font-family: Arial, Helvetica, sans-serif;
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
            <div class="add_student">
                <div class="search">
                    <form action="searchStudent" method="post">
                        <input type="text" name="searchMail" placeholder="Search Student Email">
                        <button id="se"><a href=""><i class="fa-solid fa-magnifying-glass"></i></a></button>
                    </form>
                </div>

                <div class="add_s_body">
                    <div class="update_fee_s" id="dat">
                        <c:forEach var="Student1" items="${FeeStudent}">
                            <div class="update_fee_top">
                                <span>Name: <c:out value="${Student1.name}" /></span>                                
                                <span>Email: <c:out value="${Student1.email}" /></span>
                                <span>Branch: <c:out value="${Student1.branch}" /></span>
                            </div>
                            <c:set var="mail" value="${Student1.email}" scope="request" />
                            <c:set var="fees" value="${Student1.fees}" scope="request" />

                        </c:forEach>
                        <div class="update_fee_bottom">
                            <div class="ub_left">
                                <div class="t_s">
                                    Academic Fees :
                                </div>
                                <div class="t_s">
                                    Total Applicable Fee : 
                                </div>                                
                                <div class="t_s">
                                    Amount to Pay 
                                </div>
                            </div>

                            <div class="ub_right">
                                <div class="t_s">150000</div>
                                <div class="t_s">${fees} </div>
                                <div class="t_s">
                                    <form action="updateFees" method="post">
                                        <input type="text" id="amount" value="" name="amount">
                                        <input type="hidden" id="amount" value="${fees}" name="fee">
                                        <input type="hidden" id="amount" value="${mail}" name="mail">
                                        <button type="submit" class="btn">Update</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>