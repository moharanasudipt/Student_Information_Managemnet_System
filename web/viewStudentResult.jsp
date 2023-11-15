<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,Model.Student,SIMS.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="assets/css/Result.css">
     <link rel="icon" href="assets/pictures/user.png">
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <title>Result </title>
     <style>         
     .value{
     font-family: 'Lora';
     font-size: larger;
     margin-left: 20px;
     display: inline;
    }
     </style>
</head>

<body>
     <div class="background">
          <div class="page">
              <c:forEach var="viewStudentDetails" items="${allStudentProfile}">
              <h2 class="head">Report card of <div class="adjust"><%=session.getAttribute("StudentName")%></div></h2>
              <div><a href=Student.jsp?email=<c:out value="${viewStudentDetails.email}" /> class="button"><img src="assets/pictures/back1.png" alt="back" class="image">&emsp14;back to home</a></div>
               <div class="pagecontent">
                    <div class="userimage">
                         
                         <img src='<c:out value="${viewStudentDetails.photo}" />' alt="student photo" class="userimg">
                    </div>
                    <br>
                    <div class="details">
                         <ul class="itemcontains">
                              <li class="items"><b class="key">Name:</b>
                                   <div class="value"><c:out value="${viewStudentDetails.name}" /></div>
                              </li>
                              <li class="items"><b class="key">Email:</b>
                                   <div class="value"><c:out value="${viewStudentDetails.email}" /></div>
                              </li>
                              <li class="items"><b class="key">Branch:</b>
                                   <div class="value"><c:out value="${viewStudentDetails.branch}" /></div>
                              </li>
                         </ul>
                    </div>
                    <br>
                    <table class="content">
                         <tr class="thead">
                              <th class="heading">Result</th>
                              <th class="heading">Value</th>
                         </tr>

                         <tr class="trow">
                              <td class="data">CGPA:</td>
                              <td class="data"><input type="text" value='<c:out value="${viewStudentDetails.cgpa}" />' class="input" name="udfee" readonly></td>
                         </tr>
                    </table>
               </c:forEach>
               </div>
          </div>
     </div>
</body>

</html>