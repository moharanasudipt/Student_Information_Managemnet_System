<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,Model.Student,SIMS.*" %>
<% if(session.getAttribute("AdminName")==null) 
{ response.sendRedirect("Login.html"); } 
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="assets/pictures/user.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="assets/css/style.css">
        <script src="https://kit.fontawesome.com/8601a8c761.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="assets/css/admin_main.css">        
        <link rel="stylesheet" href="assets/css/nav.css">               
        <link href="assets/css/HR_btn.css" rel="stylesheet" />   
        <title>Admin Dashboard</title>
        <style>
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
            <nav>
                    <div class="logo">
                        <img src='<%=session.getAttribute("AdminPhoto")%>' alt="admin" id="pic">&emsp; 
                        <button class="btn1"><strong>Admin Dashboard</strong>
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

        <div class="main-top">
            <h1>Departments</h1>            
        </div>
        <div class="container main-skills">
            <div class="card">
                <i class="fas fa-laptop-code"></i>
                <h3>CSE</h3>
                <p>Join Over 1 million Students.</p>
                <a href='showDepartment?branch=CSE'><button class="btn">Show</button></a>
            </div>
            <div class="card">
                <i class="fa-solid fa-wifi"></i>
                <h3>ECE</h3>
                <p>Join Over 3 million Students.</p>
                <a href='showDepartment?branch=ECE'><button class="btn">Show</button></a>
            </div>
            <div class="card">
                <i class="fa-solid fa-network-wired"></i>
                <h3>EEE</h3>
                <p>Join Over 2 million Students.</p>
                <a href='showDepartment?branch=EEE'><button class="btn">Show</button></a>
            </div>
            <div class="card">
                <i class="fa-solid fa-gear"></i>
                <h3>Mechanical</h3>
                <p>Join Over 1 million Students.</p>
                <a href='showDepartment?branch=Mechanical'><button class="btn">Show</button></a>
            </div>
        </div>

        <div class="course-box">
            <h1>All Student</h1>
            <div class="list">
                <table class="table">
                    <tr id="trhead">
                        <th id="tr">Student Regd No.</th>
                        <th id="tr">Student Name</th>
                        <th id="tr">Student Address</th>
                        <th id="tr">Student Age</th>
                        <th id="tr">Student Guardian Name</th>
                        <th id="tr">Student Email</th>
                        <th id="tr">Student Branch</th>
                        <th id="tr">Student Contacts</th>

                    </tr>
                    <c:forEach var="Student" items="${StudentDetails}">
                        <tr>
                            <td><c:out value="${Student.id}" /></td>
                            <td><c:out value="${Student.name}" /></td>
                            <td><c:out value="${Student.address}" /></td>
                            <td><c:out value="${Student.age}" /></td>
                            <td><c:out value="${Student.guardianName}" /></td>
                            <td><c:out value="${Student.email}" /></td>
                            <td><c:out value="${Student.branch}" /></td>
                            <td><c:out value="${Student.contact}" /></td>                        
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
</html>