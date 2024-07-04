<%--
    Document   : wishlist
    Created on : Feb 26, 2024, 10:35:03 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Wishlist | Rent.exe</title>
        <link rel="shortcut icon" href="./img/Untitled.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="./util/stylewishlist.css">
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
            <!-- Wishlist main area -->
            <section id="wishlist">
                <div class="wishlist-container text-center">
                    <div class="wishlist-table">
                        <p class="display-4 text-center text-primary">${u.fullname}'s wishlist</p>
                        <hr>
                        <table class="table table-striped table-hover table-bordered table-responsive-md h5">
                            <thead>
                                <tr class="table-primary">
                                    <th scope="col">Product</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Day</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="tt" value="0"/>
                                <c:forEach var="w" items="${wishlist}">
                                    <c:if test="${u.id == w.userID}">
                                        <tr>
                                            <th class="image-box"><img src="./img/${w.productID}.jpg" alt=""></th>
                                            <td>${w.productName}</td>
                                            <td>$${w.productPrice}</td>
                                            <td class="input-box">
                                                <button class="btn btn-primary btn-sm" onclick="checkValid('${w.day}', '${w.productID}')">-</button>
                                                <div class="d-inline">${w.day}</div>
                                                <button class="btn btn-primary btn-sm" onclick="window.location.href = './editWishlist?id=${w.productID}&change=1'">+</button>
                                            </td>
                                            <td>$<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${w.productPrice*w.day}" /></td>
                                            <td><button class="btn btn-danger btn-lg" onclick="window.location.href = './deleteWishlist?productid=${w.productID}'">Delete</button></td>
                                        </tr>
                                        <c:set var="tt" value="${tt+w.productPrice*w.day}"/>
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="wishlist-total container-fluid">
                        <div class="row">
                            <div class="col-md-5 coupon">
                                <form id="coupon-form">
                                    <input type="text" name="coupon" id="coupon-input" placeholder="Enter coupon code here">
                                    <input type="submit" value="Submit" class="btn btn-lg btn-primary">
                                </form>
                            </div>
                            <div class="col-md-6 bill d-flex">
                                <div class="col2">
                                    <p class="h5 left">Total price of your bill: </p>
                                    <c:choose>
                                        <c:when test="${u.type == 1}">
                                            <p class="h5 left">Iron member sale(0%): </p>
                                        </c:when>
                                        <c:when test="${u.type == 1}">
                                            <p class="h5 left">Bronze member sale(5%): </p>
                                        </c:when>
                                        <c:when test="${u.type == 1}">
                                            <p class="h5 left">Silver member sale(10%): </p>
                                        </c:when>
                                        <c:when test="${u.type == 1}">
                                            <p class="h5 left">Gold member sale(15%): </p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="h5 left">Diamond member sale(20%): </p>
                                        </c:otherwise>
                                    </c:choose>
                                    <p class="h5 left">Discount with coupon: </p>
                                    <p class="h5 left">Final total price: </p>
                                </div>
                                <div class="col2 text-center h5 text-primary">
                                    <p class="h5 text-primary">$<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${tt}" /></p>
                                    <c:choose>
                                        <c:when test="${u.type == 1}">
                                            <c:set var="memdis"  value="${tt*0}"/>
                                        </c:when>
                                        <c:when test="${u.type == 1}">
                                            <c:set var="memdis"  value="${tt*0.05}"/>
                                        </c:when>
                                        <c:when test="${u.type == 1}">
                                            <c:set var="memdis"  value="${tt*0.1}"/>
                                        </c:when>
                                        <c:when test="${u.type == 1}">
                                            <c:set var="memdis"  value="${tt*0.15}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="memdis"  value="${tt*0.2}"/>
                                        </c:otherwise>
                                    </c:choose>
                                    <p class="h5 text-primary">$<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${memdis}" /></p>
                                    <c:if test="${empty coudis}">
                                        <c:set var="coudis" value="0"/>
                                    </c:if>
                                    <p class="h5 text-primary" id="coupon-result">$${coudis}</p>
                                    <p class="h5 text-primary">$<fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${tt-memdis-coudis}" /></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-primary btn-lg order-button">Order</button>
                </div>
            </section>
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
            function checkValid(day, id) {
                if (day == 1) {
                    alert("Number of day must be at least 1");
                } else {
                    window.location.href = "./editWishlist?id=" + id + "&change=-1";
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="./util/mainwishlist.js"></script>
        <script src="https://kit.fontawesome.com/a2e765c1c8.js" crossorigin="anonymous"></script>
    </body>

</html>
