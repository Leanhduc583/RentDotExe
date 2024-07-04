<%--
    Document   : login
    Created on : Feb 26, 2024, 10:34:45 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="Model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | Rent.exe</title>
        <link rel="shortcut icon" href="./img/Untitled.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./util/stylelogin.css">
    </head>

    <body>
        <!-- Navbar -->
        <section id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="./home">Rent.exe</a>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="./home">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="./home">About Us</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="./home">Rooms</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>




        <!-- login -->
        <section id="login-form">
            <div class="login-container" id="login-container">
                <div class="form-container sign-up">
                    <form id="mainForm">
                        <h1>Create an Account</h1>
                        <div class="form-control">
                            <input name="fullname" type="text" id="fullname" placeholder="Enter your full name" autocomplete="off">
                        </div>
                        <div class="form-control">
                            <input name="username" type="text" id="username" placeholder="Enter your username" autocomplete="off">
                        </div>
                        <div class="form-control">
                            <input name="password" type="password" id="password" placeholder="Enter your password" autocomplete="off">
                        </div>
                        <div class="form-control">
                            <input type="password" id="cpassword" placeholder="Confirm your password" autocomplete="off">
                        </div>
                        <button>Sign Up</button>
                    </form>
                </div>

                <div class="form-container sign-in">
                    <form action="login" method="post">
                        <h1>Sign In</h1>
                        <div class="social-icons">
                            <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                            <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                            <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                            <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                        </div>
                        <span>or use your email password</span>
                        <input name="usernamelogin" type="username" placeholder="Username">
                        <input name="passwordlogin" type="password" placeholder="Password">
                        <a href="#">Forget Your Password?</a>
                        <%
           if(request.getAttribute("Mes") != null){
           String error = (String) request.getAttribute("Mes");%>
                        <p class="report-error text-danger h6">
                            <%out.println(error);%>
                        </p>
                        <%}%>
                        <button>Sign In</button>
                    </form>
                </div>

                <div class="toggle-container">
                    <div class="toggle">
                        <div class="toggle-panel toggle-left">
                            <h1>Already have an account?</h1>
                            <p>Enter your personal details to use all of site features</p>
                            <button class="hidden" id="login">Sign In</button>
                        </div>
                        <div class="toggle-panel toggle-right">
                            <h1>New to us?</h1>
                            <p>Register with your personal details to use all of site features</p>
                            <button class="hidden" id="register">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <!-- Script -->
        <c:if test="${not empty status}">
            <script>
                window.addEventListener("load", function () {
                    alert("${status}");
                });
            </script>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="./util/mainlogin.js"></script>
        <script src="https://kit.fontawesome.com/a2e765c1c8.js" crossorigin="anonymous"></script>
    </body>

</html>
