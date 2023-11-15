<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*,Model.Student,SIMS.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <title>UPDATE</title>
        <link rel="icon" href="assets/pictures/user.png">
        <style>
            body {

                background-color: #ffffff;
            }

            .card {

                background:url(assets/pictures/bg.jpg);
                background-size: cover;

            }
            * {
                color: beige;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-style: oblique;

            }
            .p{
                text-align: center;
                text-shadow: 2px 2px 5px rgb(249, 162, 0);
                text-decoration: wavy;
            }
            .card{
                box-shadow: 6px 3px 42px rgb(104, 79, 5);
            }
            .i{
                font: bold;
            }
            .error {
                color: red;
                font-size: 1rem;
                margin-top: 5px;
                display: block;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header" id="cardHeader">
                            <h3 class="p"> Edit Student Details</h3>
                        </div>
                        <div class="card-body" id="cardBody">
                            <form action="updateStudent" method="post" onsubmit="return validateForm()">
                                <div class="form-group">
                                    <label for="id" class="i">Student Redg No.</label>
                                    <input type="text" class="form-control " id="id" name="id" value='<%= request.getParameter("id")%>' readonly=true />
                                </div>
                                <div class="form-group">
                                    <label for="name" class="i">Enter Name</label>
                                    <input type="text" class="form-control " id="name" name="name"/>
                                    <span id="nameError" class="error"></span>
                                </div>
                                <div class="form-group">
                                    <label for="address" class="i">Enter Address</label>
                                    <input type="text" class="form-control " id="address" name="addr" />
                                    <span id="addressError" class="error"></span>
                                </div>
                                <div class="form-group">
                                    <label for="age" class="i">Enter Age</label>
                                    <input type="text" class="form-control " id="age" name="age" />
                                    <span id="ageError" class="error"></span>
                                </div>
                                <div class="form-group">
                                    <label for="gname" class="i">Enter Guardian Name</label>
                                    <input type="text" class="form-control " id="gname" name="gname" required/>
                                    <span id="gnameError" class="error"></span>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="i">Enter Email</label>
                                    <input type="email" class="form-control " id="email" name="email"  value='<%= request.getParameter("email")%>' readonly />
                                    <span id="emailError" class="error"></span>
                                </div>
                                <div class="form-group">
                                    <label for="contact" class="i">Contact</label>
                                    <input type="text" class="form-control " id="contact" name="contact" />
                                    <span id="contactError" class="error"></span>
                                </div>
                                <input type="hidden" name="branch"  value='<%= request.getParameter("branch")%>'/>
                                <button type="submit" class="btn btn-danger">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <script src="assets/js/update.js"></script>
    </body>

</html>