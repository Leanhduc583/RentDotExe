<%--
    Document   : product
    Created on : Feb 26, 2024, 10:34:25 AM
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
        <title>Product | Rent.exe</title>
        <link rel="shortcut icon" href="./img/Untitled.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <link rel="stylesheet" href="./util/styleproduct.css">
    </head>

    <body>
        <c:set var="u" value="${sessionScope.account}"/>
        <c:set  var = "x" value="${product}"/>
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
                        <c:if test="${u == null}">
                            <button class="btn btn-warning btn-lg"><a href="./login.jsp">Log In</a></button>
                        </c:if>
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

        <c:if test="${error != null}">
            <section id="notfound">
                <div class="notfound-container text-center">
                    <p class="display-4">
                        ${error}
                    </p>
                    <button class="btn btn-lg btn-primary" onclick="window.location.href = './home'">Back to home</button>
                </div>
            </section>
        </c:if>

        <c:if test="${error == null}" >
            <!-- Item main area -->
            <section id="product">
                <div class="product-container">
                    <div class="container-fluid">
                        <div class="row infor">
                            <div class="col-md-5">
                                <div id="carouselExampleIndicators" class="carousel carousel-dark slide"
                                     data-bs-ride="carousel">
                                    <div class="carousel-indicators">
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                                class="active" aria-current="true" aria-label="Slide 1"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                                aria-label="Slide 2"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                                aria-label="Slide 3"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                                                aria-label="Slide 4"></button>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"
                                                aria-label="Slide 5"></button>
                                    </div>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                            <img src="./img/${x.id}.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./img/${x.id}.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./img/${x.id}.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./img/${x.id}.jpg" class="d-block w-100" alt="...">
                                        </div>
                                        <div class="carousel-item">
                                            <img src="./img/${x.id}.jpg" class="d-block w-100" alt="...">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="product-text">
                                    <p class="text-primary h1 text-center"> ${x.name}</p>
                                    <hr>
                                    <p class="h5">It is a long established fact that a reader will be distracted by the readable
                                        content of a page when looking at its layout. The point of using Lorem Ipsum is that it
                                        has a more-or-less normal distribution of letters</p>
                                    <ul class="h5">
                                        <li>2 Bedrooms</li>
                                        <li>2 Bathrooms</li>
                                        <li>2 Balcony</li>
                                        <li>Awesome view</li>
                                        <li>Near Airport</li>
                                    </ul>
                                    <div class="stars">
                                        <p class="h5">Overall Rating: </p>
                                        <i class="fa-solid fa-star text-warning h3"></i>
                                        <i class="fa-solid fa-star text-warning h3"></i>
                                        <i class="fa-solid fa-star text-warning h3"></i>
                                        <i class="fa-solid fa-star text-warning h3"></i>
                                        <i class="fa-regular fa-star-half-stroke text-warning h3"></i>
                                    </div>
                                    <div class="price h3">
                                        <p class="h3 text-primary d-inline">$${x.price}</p>
                                        <p class="h3 d-inline">/day</p>
                                    </div>
                                    <c:set var="founditem" value="false"></c:set>
                                    <c:forEach var="w" items="${wishlist}">
                                        <c:if test="${w.productID == x.id && w.userID == u.id}">
                                            <c:set var="founditem" value="true"></c:set>
                                                <button class="btn btn-lg btn-success wishlist-button" disabled><i class="fa-regular fa-heart"></i> Added</button>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${founditem == false}">
                                        <button class="btn btn-lg btn-primary wishlist-button" onclick="addThis('${x.id}')"><i class="fa-regular fa-heart"></i> Add
                                            to Wishlist</button>
                                        </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="row extra">
                            <p class="extra-title text-center h1 text-primary">
                                You may also like
                            </p>
                            <hr>
                            <div class="extra-queue">
                                <c:forEach var="p" items="${list}">
                                    <c:set var="found" value="false"/>
                                    <c:if test="${p.id != x.id}">
                                        <div class="queue-item">
                                            <img src="./img/${p.id}.jpg" alt="" class="image" draggable="false">
                                            <p class="h2 text-primary text-center"><a href="./product?id=${p.id}">${p.name}</a></p>
                                            <div class="stars">
                                                <i class="fa-solid fa-star text-warning h3"></i>
                                                <i class="fa-solid fa-star text-warning h3"></i>
                                                <i class="fa-solid fa-star text-warning h3"></i>
                                                <i class="fa-solid fa-star text-warning h3"></i>
                                                <i class="fa-regular fa-star-half-stroke text-warning h3"></i>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
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
        <c:if test="${not empty u}">
            <script>
                function addThis(id) {
                    window.location.href = "addwishlist?site=product&userid=${u.id}&productid=" + id;
                }
            </script>
        </c:if>
        <c:if test="${empty u}">
            <script>
                function addThis(id) {
                    alert('You must login to use this feature!');
                    window.location.href = "./login.jsp";
                }
            </script>
        </c:if>
        <script>
            function usure() {
                let confirmed;
                confirmed = confirm("Do you want to log out?");
                if (confirmed) {
                    window.location.href = "./logout";
                }
            }
        </script>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="./util/mainproduct.js"></script>
        <script src="https://kit.fontawesome.com/a2e765c1c8.js" crossorigin="anonymous"></script>
    </body>

</html>
