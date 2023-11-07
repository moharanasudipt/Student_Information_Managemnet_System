<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.,Model.Student,SIMS." %>
<!DOCTYPE html>
<html lang="en">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="feesDetails.css">
     <link rel="icon" href="user.png">
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <title>Fees Details</title>
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
               <h2 class="head">Fees Status of <div class="adjust"><c:out value="${viewStudentDetails.name}" /></div>
               </h2>
              <div><a href=Student.jsp?email=<c:out value="${viewStudentDetails.email}" /> class="button"><img src="./back1.png" alt="back" class="image">&emsp14;back to home</a></div>
               <div class="pagecontent">
                    <div class="userimage">
                         <img src='<c:out value="${viewStudentDetails.photo}" />' alt="student photo" class="userimg">
                    </div>
                    <br>
                    <div class="details">
                         <ul class="itemcontains">
                              <li class="items"><b class="key">Name:</b><div class="value"><c:out value="${viewStudentDetails.name}" /></div></li>
                              <li class="items"><b class="key">Email:</b><div class="value"><c:out value="${viewStudentDetails.email}" /></div></li>
                              <li class="items"><b class="key">Branch:</b><div class="value"><c:out value="${viewStudentDetails.branch}" /></div></li>
                         </ul>
                    </div>
                    <br>
                    <table class="content">
                         <tr class="thead">
                              <th class="heading">Fee Type</th>
                              <th class="heading">Value</th>
                         </tr>

                         <tr class="trow">
                              <td class="data">Academic fees:</td>
                              <td class="data">Rs 1,50,000</td>
                         </tr>
                         
                         <tr class="trow">
                              <td class="data">Due Fees:</td>
                              <td class="data">Rs <input type="text" value=<c:out value="${viewStudentDetails.fees}" /> class="input" name="udfee" readonly></td>
                         </tr>
                    </table>
                    </c:forEach>
               </div>
          </div>
     </div>
</body>
</html>
