<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,Model.Student,SIMS.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" href="assets/pictures/user.png">
     <link rel="stylesheet" href="assets/css/appinfo.css">
     <title>App Info</title>
</head>

<body>
     <div class="page">
          
               <div class="contents">
                    <div class="header">
                        <img src="assets/pictures/logo.png" alt="logo" class="logo">
                    </div>
                    <%
                    String mail=request.getParameter("email");                                                         
                    %>
                    <div class="info">
                         <div class="infocontent">
                              <label for="year" class="valuelabel">Year Established:</label>
                              <input type="text" value=2023 id="year" class="valueinput" readonly>

                              <label for="office" class="valuelabel">Address:</label>
                             <input type="text" value="Ramchandrapur,Jatni" id="office" class="valueinput" readonly>

                              <label for="state" class="valuelabel">State:</label>
                              <input type="text" value="Odisha" id="state" class="valueinput" readonly>

                              <label for="zipcode" class="valuelabel">Zip Code:</label>
                              <input type="text" value=752050 id="zipcode" class="valueinput" readonly>

                              <label for="phone" class="valuelabel">Phone:</label>
                              <input type="text" value="(0674) 2492496" id="phone" class="valueinput" readonly>

                              <label for="fax" class="valuelabel">Fax:</label>
                              <input type="text" value="(0674) 2490480" id="fax" class="valueinput" readonly>

                              <label for="Email" class="valuelabel">Email:</label>
                              <input type="text" value="info@sims.com" id="Email" class="valueinput" readonly>

                              <label for="website" class="valuelabel">Website:</label>
                              <input type="text" value="https://sims.com" id="website" class="valueinput" readonly>
                         </div>
                    </div>
                    <br>
                    <div class="navigation">
                        <a href=Student.jsp?email=<%= mail %> class="navigate"><input type="button" value="Home" class="button"></a>
                    </div>
               </div>
         
     </div>
</body>

</html>