<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,Model.Student" %>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="icon" href="user.png">
        <link rel="stylesheet" href="style.css">
        <script src="https://kit.fontawesome.com/8601a8c761.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="admin_main.css">
        <link rel="stylesheet" href="nav.css">
        <title>Add Fees</title>
    </head>
    <body>
        <nav class="navbar fixed-top">
            <div class="logo">
                <img src="./software-engineer.png" alt="admin" id="pic">&emsp;<b>Admin Dashboard</b></div>
            <div class="options">
                <ul>
                    <li><a href="StudentDetailAdmin"><input type="button" value="Home" class="link"></a></li>
                    <li><a href="addStudent.html"><input type="button" value="Add Student" class="link"></a></li>
                    <li><a href="addFees.jsp"><input type="button" value="Add Fees" class="link"></a></li>
                    <li><a href="addResult.html"><input type="button" value="Add Result" class="link"></a></li>
                    <li id="name"><b><%=session.getAttribute("AdminName")%></b></li>
                    <li><a href="logout"><img src="./switch.png" alt="logout"></a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="main_fee_header_admin">
                <div class="main_fe_he_header_admin" >


                    <form action="searchStudent" class="search_student_id">
                        <input type="text" name="searchMail" placeholder="Enter Student Email">
                        <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>

                </div>


                <div class="main_fe_he_footer_admin">
                    <c:forEach var="Student1" items="${FeeStudent}">
                        <div class="name_main_fe_he_header_admin">
                            Name:<c:out value="${Student1.name}" /><br>
                            Email:<c:out value="${Student1.email}" /><br>
                            Branch:<c:out value="${Student1.branch}" /><br>
                            
                            <c:set var="mail" value="${Student1.email}" scope="request" />
                            <c:set var="fees" value="${Student1.fees}" scope="request" />
                            
                        </c:forEach>
                    </div>

                    <table class="table table-hover table-bordered table-stripped" style="text-align: center;">
                        <tbody>
                            <tr style="background-color:#3b5998;color:black" class="thead th">
                                <td style="color: white; width: 10vw;">Sr.No.</td>
                                <td style="color: white; width: 40vw;">Head Name</td>
                                <td style="color: white; width: 50%;">Amount</td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td>Academic Fees</td>
                                <td>150000</td>
                            </tr>

                            <tr class="success">
                                <td colspan="2" align="right"><b>Total Applicable Fee :</b></td>
                                <c:set var="fees1" value='${requestScope["StudentFees"]}' />
                                <td><b>${fees} ${fees1}</b></td>
                            </tr>
                            <tr class="info">
                                <td colspan="2" align="right"><b>Amount to Pay : </b></td>
                                <td><b><form action="updateFees">
                                            <input type="text" id="amount" value="" name="amount">
                                            <input type="hidden" id="amount" value="${fees}" name="fee">
                                            <input type="hidden" id="amount" value="${mail}" name="mail">
                                            <button style="padding: 0.5px; width: 65px;" type="submit">Update</button>
                                        </form>
                                    </b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
