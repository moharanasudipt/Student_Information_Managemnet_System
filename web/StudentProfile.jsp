<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.,Model.Student,SIMS." %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="user.png">
        <link rel="stylesheet" href="vprofile.css">
        <title>View Profile</title>        
    </head>
    <body>                     
        <form>           
            <div class="body">
                <div class="page">
                    <c:forEach var="viewStudentDetails" items="${allStudentProfile}">
                        
                    <div class="left">
                        <div class="navigation">
                            <a href='Student.jsp?email=<c:out value="${viewStudentDetails.email}" />&name=<c:out value="${viewStudentDetails.name}" />&image=<c:out value="${viewStudentDetails.photo}" />'  class="navigate"><button type="button" class="navbuttons">HOME</button></a>
                            <a href=viewStudentResult?email=<c:out value="${viewStudentDetails.email}" /> class="navigate"><button type="button" class="navbuttons">RESULT</button></a>
                            <a href=viewStudentFees?email=<c:out value="${viewStudentDetails.email}" /> class="navigate"><button type="button" class="navbuttons">FEES DETAILS</button></a>
                            <a href=appinfo.jsp?email=<c:out value="${viewStudentDetails.email}" /> class="navigate"><button type="button" class="navbuttons">COLLEGE INFO</button></a>
                        </div>

                    </div>
                            
                        <div class="center">

                            <div class="image">
                                <img src='<c:out value="${viewStudentDetails.photo}" />' alt="user" class="userimage">
                            </div>

                            <div class="content">

                                <label for="uname" class="valuelabel">Name:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.name}" />' id="uname" name="uname" class="valueinput"
                                       readonly>

                                <label for="umail" class="valuelabel">Email:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.email}" />' id="umail" name="umail" class="valueinput"
                                       readonly>

                                <label for="uAddress" class="valuelabel">Address:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.address}" />' id="uAddress" name="uAddress"
                                       class="valueinput" readonly>

                                <label for="ucontacts" class="valuelabel">Contacts:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.contact}" />' id="ucontacts" name="ucontacts" class="valueinput"
                                       readonly>

                                <label for="udob" class="valuelabel">Date of Birth:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.dob}" />' id="udob" name="udob" class="valueinput" readonly>

                                <label for="uage" class="valuelabel">Age:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.age}" />' id="uage" name="uage" class="valueinput" readonly>

                                <label for="ugender" class="valuelabel">Gender:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.gender}" />' id="ugender" name="ugender" class="valueinput" readonly>

                                <label for="ugardianname" class="valuelabel">Guardian Name:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.guardianName}" />' id="ugardianname" name="ugardianname"
                                       class="valueinput" readonly>
                            </div>
                        </div>

                        <div class="right">
                            <div class="content rcu">

                                <label for="ubranch" class="valuelabel implabel">Branch:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.branch}" />' id="ubranch" name="ubranch" class="valueinput impvalue"
                                       readonly>

                                <label for="uid" class="valuelabel implabel">ID:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.id}" />' id="uid" name="uid" class="valueinput impvalue" readonly>

                                <label for="upass" class="valuelabel implabel">Password:</label>
                                <input type="text" value='<c:out value="${viewStudentDetails.password}" />' id="upass" name="upass" class="valueinput impvalue"
                                       readonly>

                            </div>

                            <div class="button">
<a href=EditStudentProfile.jsp?id=<c:out value="${viewStudentDetails.id}" />&branch=<c:out value="${viewStudentDetails.branch}" />&email=<c:out value="${viewStudentDetails.email}" />&photo=<c:out value="${viewStudentDetails.photo}" />&password=<c:out value="${viewStudentDetails.password}" />  class="navigate"><button type="button" class="navbuttons editb">EDIT</button></a>
                            </div>

                            <div class="logo">
                                <img src="./logo.png" alt="images" class="logoimage">
                            </div>

                            <div class="quote">
                                "Empowering Tomorrow's Leaders with Today's Data: Harnessing the Power of Student
                                Information
                                Management Systems."
                            </div>

                            <div class="footer">
                                Copyright &copy; SIMS 2023
                            </div>

                        </div>

                    </c:forEach>
                </div>
            </div>

        </form>
    </body>

</html>
