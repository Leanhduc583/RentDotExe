<%--
    Document   : profile
    Created on : Feb 26, 2024, 10:34:35 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile | Rent.exe</title>
        <link rel="stylesheet" href="./util/styleprofile.css">
        <link rel="shortcut icon" href="./img/Untitled.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body>
        <c:set var="u" value="${sessionScope.account}"/>
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
                    <c:if test="${u != null}">
                        <div class="dropdown">
                            <button class="btn btn-secondary btn-warning dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                Welcome back, ${u.username}!
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="./profile">Profile</a></li>
                                <li><a class="dropdown-item" href="./wishlist">Wishlist</a></li>
                                <li><a class="dropdown-item" href="javascript:void(0)" onclick="usure()" >Logout</a></li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </nav>
        </section>


        <c:if test="${u == null}">
            <section id="notfound">
                <div class="notfound-container text-center">
                    <p class="display-4">
                        You must login to access this feature
                    </p>
                    <button class="btn btn-lg btn-primary" onclick="window.location.href = './login.jsp'">Login</button>
                </div>
            </section>
        </c:if>
        <c:if test="${u != null}">
            <!-- Profile main area -->
            <section id="profile">
                <div class="profile-container">
                    <p class="display-4 text-primary text-center">${u.username}'s profile</p>
                    <hr>
                    <div class="container">
                        <div class="row big-row">
                            <div class="col-md-5">
                                <img src="./img/Untitled.png" alt="">
                                <p class="h1 text-primary text-center">${u.fullname}</p>
                                <c:if test="${u.type != 6}">
                                    <p class="text-center h4">Customer</p>
                                </c:if>
                                <c:if test="${u.type == 6}">
                                    <p class="text-center h4">Admin</p>
                                    <form action="deleteUser" method="post" id="delete-form">
                                        <p class="text-danger h4">Delete User</p>
                                        <select name="erase">
                                            <c:forEach var="user" items="${userlist}">
                                                <c:if test = "${user.type != 6}">
                                                    <option value="${user.username}">${user.fullname}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>
                                        <input type="submit" value="Delete" class="btn btn-danger">
                                    </form>
                                </c:if>
                            </div>
                            <div class="col-md-7">
                                <div class="information">
                                    <div class="h3 text-primary">Information</div>
                                    <hr>
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="infor-small">
                                                    <p class="h4 text-primary">Email</p>
                                                    <p>${u.email}</p>
                                                </div>
                                                <div class="infor-small">
                                                    <p class="h4 text-primary">Address</p>
                                                    <p>${u.address}</p>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="infor-small">
                                                    <p class="h4 text-primary">Phone number</p>
                                                    <p>${u.phone}</p>
                                                </div>
                                                <div class="infor-small">
                                                    <p class="h4 text-primary">Membership</p>
                                                    <c:choose>
                                                        <c:when test="${u.type ==1}">
                                                            <p>Iron</p>
                                                        </c:when>
                                                        <c:when test="${u.type ==2}">
                                                            <p>Bronze</p>
                                                        </c:when>
                                                        <c:when test="${u.type ==3}">
                                                            <p>Silver</p>
                                                        </c:when>
                                                        <c:when test="${u.type ==4}">
                                                            <p>Gold</p>
                                                        </c:when>
                                                        <c:when test="${u.type ==5}">
                                                            <p>Diamond</p>
                                                        </c:when>
                                                        <c:when test="${u.type ==6}">
                                                            <p>Admin</p>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="edit">
                                    <div class="h3 text-primary">Edit profile</div>
                                    <c:if test="${not empty status}">
                                        <div class="h5 text-danger">Error: ${status}</div>
                                        <c:set var="status" value="${null}"></c:set>
                                    </c:if>
                                    <hr>
                                    <form action="updateProfile" method="post" id="edit-form">
                                        <div class="col2">
                                            <div class="form-control">
                                                <label for="email" class="text-primary h6">Email: </label>
                                                <input type="text" name="emails" id="email" class="fill" placeholder="Email" disabled>
                                            </div>
                                            <div class="form-control">
                                                <label for="phone" class="text-primary h6">Phone number: </label>
                                                <input type="text" name="phones" id="phone" class="fill" placeholder="Phone" disabled>
                                            </div>
                                            <div class="form-control">
                                                <label for="address" class="text-primary h6">Address: </label>
                                                <input type="text" name="addresses" id="address" class="fill" placeholder="Address" disabled>
                                            </div>
                                        </div>
                                        <div class="col2">
                                            <div class="form-control">
                                                <label for="fullname" class="text-primary h6">Full name: </label>
                                                <input type="text" name="fullnames" id="fullname" class="fill" placeholder="Full name" disabled>
                                            </div>
                                            <div class="form-control">
                                                <label for="pass" class="text-primary h6">Password: </label>
                                                <input type="password" name="passes" id="pass" class="fill" placeholder="Password" disabled>
                                            </div>
                                            <div class="col-console">
                                                <input class="btn btn-lg btn-success hide" type="submit" value="Save" id="save-button">
                                                <button class="btn btn-lg btn-danger hide" id="cancel-button">Cancel</button>
                                                <button class="btn btn-lg btn-primary" id="edit-button" onclick="refill('${u.email}', '${u.phone}', '${u.address}', '${u.fullname}', '${u.password}')">Click here to start edit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Footer -->
            <section id="footer" class="bg-primary">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3 col1">
                            <p class="h2 text-white">Rent.exe</p>
                        </div>
                        <div class="col-md-3">
                            <p class="h4 text-white">About Us</p>
                            <ul class="text-white ul1">
                                <li>Customer Service</li>
                                <li>Reward Program</li>
                                <li>Shipping & Returns</li>
                                <li>Privacy Policy</li>
                                <li>Terms & Conditions</li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <p class="h4 text-white">Contact Us</p>
                            <ul class="text-white d-flex">
                                <li><i class="fa-brands fa-facebook" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Facebook"></i></li>
                                <li><i class="fa-brands fa-youtube" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Youtube"></i></li>
                                <li><i class="fa-brands fa-instagram" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Instagram"></i></li>
                                <li><i class="fa-brands fa-tiktok" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="TikTok"></i></li>
                                <li><i class="fa-brands fa-discord" data-bs-toggle="tooltip" data-bs-placement="bottom"
                                       title="Discord"></i></li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <p class="h4 text-white">Newsletter Signup</p>
                            <p class="text-white">Receive our latest updates about our products & promotions.</p>
                            <form class="d-flex">
                                <input class="form-control" type="search" placeholder="Email Address">
                                <button class="btn btn-outline-light" type="submit">Subscribe</button>
                            </form>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Script -->
            <script>
                function usure() {
                    let confirmed;
                    confirmed = confirm("Do you want to log out?");
                    if (confirmed) {
                        window.location.href = "./logout";
                    }
                }
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
            <script src="./util/mainprofile.js"></script>
            <script src="https://kit.fontawesome.com/a2e765c1c8.js" crossorigin="anonymous"></script>
    </body>

</html>
