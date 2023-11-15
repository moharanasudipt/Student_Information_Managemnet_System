<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,Model.Student,SIMS.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="assets/pictures/user.png">
        <link rel="stylesheet" href="assets/css/EditProfile.css">
        <title>Edit Profile</title> 
    </head>

    <body>
        <div class="page">
            <img src='<%= request.getParameter("photo")%>' alt="userimage" class="userimage" readonly=true />
            <div><img src="assets/pictures/back.jpg" alt="back" class="nav"></div>
            <form action="EditStudentProfile" method="post" enctype="multipart/form-data">
                <div class="table">
                    <div class="pagecontent">
                        <div class="left">
                            <br>
                            <div class="content">

                                <label for="uid" class="valuelabel1">Redg No:</label>
                                <input type="text" value='<%= request.getParameter("id")%>' id="uid" name="uid" class="valueinput" readonly=true>

                                <label for="umail" class="valuelabel1">Email:</label>
                                <input type="text" value='<%= request.getParameter("email")%>' id="umail" name="umail" class="valueinput" readonly=true>                                  

                                <label for="uname" class="valuelabel1">Name:</label>
                                <input type="text"  id="uname" name="uname" class="valueinput" required>  
                                

                                <label for="uAddress" class="valuelabel1">Address:</label>
                                <input type="text"  id="uAddress" name="uaddr" class="valueinput" required>

                                <label for="ubranch" class="valuelabel1 implabel">Branch:</label>
                                <input type="text" value='<%= request.getParameter("branch")%>' id="ubranch" name="ubranch" class="valueinput" readonly=true>

                                <label for="uage" class="valuelabel1">Age:</label>
                                <input type="text"  id="uage" name="uage" class="valueinput" required>

                            </div>
                        </div>

                        <div class="right">
                            <br>
                            <div class="content">
                                <label for="ugender" class="valuelabel2">Gender:</label>
                                <select name="ugender" id="ugender" class="valueinput" required>
                                    <option value></option>
                                    <option value="male">Male</option>
                                    <option value="female">Female</option>
                                    <option value="other">Other</option>
                                </select>

                                <label for="ugardianname" class="valuelabel2">Guardian Name:</label>
                                <input type="text"  id="ugardianname" name="uparent" class="valueinput" required>

                                <label for="ucontacts" class="valuelabel2">Contacts:</label>
                                <input type="text" id="ucontacts" name="ucontact" class="valueinput impvalue" required>


                                <label for="udob" class="valuelabel2">Date of Birth:</label>
                                <input type="date"  id="udob" name="udob" class="valueinput impvalue" required>                                                                      

                                <label for="upass" class="valuelabel2 implabel">Password:</label>
                                <input type="text" id="upass" name="upass" value='<%= request.getParameter("password")%>' class="valueinput impvalue" readonly>                                          

                                <label for="uimgup" class="valuelabel2 implabel">Upload Image:</label>
                                <input type="file" id="uimgup" name="uimg" class="buttonimg" accept=".jpg, .jpeg" required>

                            </div>
                        </div>

                        <div>
                            <button type="submit" class="buttonsubmit">Submit</button>
                        </div>
                                <br><br>
                        <div class="footer">
                            <img src="assets/pictures/logo.png" alt="logo" class="imglogo">
                            <div class="copyright">
                                Copyright &copy; SIMS 2023
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>        

    </body>
</html>