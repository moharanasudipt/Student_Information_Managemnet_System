<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*,Model.Student,SIMS.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="assets/pictures/user.png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <title>Departments</title>
        <style>
            .bod{
                background-color: #9999ff;
                box-shadow: 4px 4px 22px purple;
                border-radius: 20px;
            }
            h1{
                text-rendering: auto;
                text-shadow: 3px 3px 6px violet;                
            }
            th{
                background-color: #ffcc66;
            }            
        </style>
    </head>
    <body>
        <c:set var="dept" value='${requestScope["branch"]}' />
        <section class="py-5">
            <div class="container bod">
                
                <h1>&nbsp;&nbsp;&nbsp;
<a href="StudentDetailAdmin"><button type="button" class="btn btn-warning">HOME</button></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
STUDENT REPOSITORY 
                </h1>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th >Redg No.</th>
                                    <th> Name</th>
                                    <th> Address</th>
                                    <th> Age</th>
                                    <th> GuardianName</th>
                                    <th> Email</th>
                                    <th> CGPA</th>
                                    <th> Contact</th>                                                
                                    <th>ACTION</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="Student" items="${allStudent}">
                                    <tr>
                                        <td>
                                            <c:out value="${Student.id}" />
                                        </td>
                                        <td>
                                            <c:out value="${Student.name}" />
                                        </td>
                                        <td>
                                            <c:out value="${Student.address}" />
                                        </td>
                                        <td>
                                            <c:out value="${Student.age}" />
                                        </td>
                                        <td>
                                            <c:out value="${Student.guardianName}" />
                                        </td>
                                        <td>
                                            <c:out value="${Student.email}" />
                                        </td>
                                        <td>
                                            <c:out value="${Student.cgpa}" />
                                        </td>
                                        <td>
                                            <c:out value="${Student.contact}" />
                                        </td>                        
                                        <td>
                                            <a href=Update.jsp?id=<c:out value='${Student.id}' />&email=<c:out value='${Student.email}' />&branch=${dept} /><button type="button" class="btn btn-primary">EDIT</button></a>
                                            <a href=deleteStudent?del=<c:out value="${Student.id}" />&branch=${dept} /><button type="button" class="btn btn-danger">Delete</button></a>
                                        </td>                                                                             
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
