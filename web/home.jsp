<%--
    Document   : home
    Created on : Feb 26, 2024, 10:20:56 AM
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
        <title>Home | Rent.exe</title>
        <link rel="shortcut icon" href="./img/Untitled.png" type="image/x-icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <link rel="stylesheet" href="./util/stylehome.css">
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




        <!-- Main Banner -->
        <section id="main">
            <div class="cover"></div>
            <div class="text-area" data-aos="fade-up" data-aos-duration="2500">
                <p class="display-6 text-warning">Rent.exe</p>
                <p class="display-3">A service to help you locate affordable resorts at ease</p>
                <p class="h5 text-info">Save up to 40% for reserving a room here</p>
                <a href="#" class="h3 text-warning">Reserve now</a>
            </div>
        </section>




        <!-- New items section -->
        <section id="recent">
            <div class="recent-text">
                <p class="display-3 text-primary" data-aos="zoom-out-down" data-aos-easing="linear" data-aos-duration="500">
                    Newly Added Places</p>
                <p class="h5 text-black" data-aos="zoom-out-up" data-aos-easing="linear" data-aos-duration="500">Check out
                    our latest rooms that will fit your budget</p>
            </div>
            <div class="recent-area" data-aos="fade-left" data-aos-easing="linear" data-aos-duration="500">
                <c:forEach var="p" items="${news}">
                    <c:set var="found" value="false"/>
                    <div class="recent-item">
                        <img src="./img/${p.id}.jpg" alt="" class="image" draggable="false">
                        <hr>
                        <p class="h2 text-primary text-center"><a href="./product?id=${p.id}">${p.name}</a></p>
                        <p class="text-black">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                            Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took
                            a galley of type and scrambled it to make a type specimen book.</p>
                        <p class="h5 text-black"><i class="fa-solid fa-dollar-sign text-primary h4"></i> ${p.price}/day</p>
                        <hr>
                        <c:forEach var="w" items="${wishlist}">
                            <c:if test="${w.userID == u.id && w.productID == p.id}">
                                <div class="text-center">
                                    <button class="btn btn-lg btn-success recent-button" disabled><i class="fa-regular fa-heart"></i> Added</button>
                                </div>
                                <c:set var="found" value="true"></c:set>
                            </c:if>
                        </c:forEach>
                        <c:if test="${found == false}">
                            <button class="btn btn-lg btn-primary recent-button" onclick="addThis('${p.id}')"><i class="fa-regular fa-heart"></i> Add to
                                Wishlist</button>
                            </c:if>
                    </div>
                </c:forEach>
            </div>
        </section>




        <!-- Promotion banner -->
        <section id="promote">
            <div class="promote-text">
                <p class="display-3 text-warning" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="500">The
                    Achievements We Get</p>
                <p class="h5 text-white" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="500">We always
                    try
                    harder every day to give our customers the best experience.</p>
            </div>
            <div class="promote-area container">
                <div class="row">
                    <div class="col-md-4 d-flex" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="500">
                        <div class="promote-icon">
                            <i class="fa-solid fa-trophy text-warning"></i>
                        </div>
                        <div class="promote-small-text">
                            <p class="display-3 text-white">69,420+</p>
                            <p class="h5 text-white">Reservations made</p>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="500"
                         data-aos-offset="200">
                        <div class="promote-icon">
                            <i class="fa-solid fa-circle-user text-warning"></i>
                        </div>
                        <div class="promote-small-text">
                            <p class="display-3 text-white">4,200+</p>
                            <p class="h5 text-white">Customers</p>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="500"
                         data-aos-offset="300">
                        <div class="promote-icon">
                            <i class="fa-solid fa-star text-warning"></i>
                        </div>
                        <div class="promote-small-text">
                            <p class="display-3 text-white">1,100+</p>
                            <p class="h5 text-white">Reviews</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 d-flex" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="500"
                         data-aos-offset="100">
                        <div class="promote-icon">
                            <i class="fa-solid fa-circle-dollar-to-slot text-warning"></i>
                        </div>
                        <div class="promote-small-text">
                            <p class="display-3 text-white">$70.000+</p>
                            <p class="h5 text-white">Monthly Revenue</p>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="500"
                         data-aos-offset="200">
                        <div class="promote-icon">
                            <i class="fa-solid fa-award text-warning"></i>
                        </div>
                        <div class="promote-small-text">
                            <p class="display-3 text-white">20+</p>
                            <p class="h5 text-white">Awards</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <!-- List item by types -->
        <section id="types">
            <div class="types-text">
                <p class="display-3 text-primary" data-aos="flip-up" data-aos-easing="linear" data-aos-duration="500">
                    All of our current services</p>
                <p class="h5 text-black" data-aos="flip-up" data-aos-easing="linear" data-aos-duration="500">Pick a room
                    that meets your expectation here</p>
            </div>
            <ul class="nav nav-pills mb-3 h5" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
                            type="button" role="tab" aria-controls="pills-home" aria-selected="true">All</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile"
                            type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Hotel Rooms</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact"
                            type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Homestay</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-other-tab" data-bs-toggle="pill" data-bs-target="#pills-other"
                            type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Villa</button>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                    <div class="d-flex" data-aos="fade-up" data-aos-easing="linear" data-aos-duration="500">
                        <c:forEach var="p" items="${products}">
                            <c:set var="found" value="false"/>
                            <div class="tab-item" >
                                <div class="tab-image">
                                    <img src="./img/${p.id}.jpg" alt="" draggable="false">
                                </div>
                                <p class="h3 text-primary pe-auto"><a href="./product?id=${p.id}">${p.name}</a></p>
                                    <c:forEach var="w" items="${wishlist}">
                                        <c:if test="${w.userID == u.id && w.productID == p.id}">
                                        <div class="text-center">
                                            <button class="btn btn-lg btn-success tab-button" disabled><i class="fa-regular fa-heart"></i> Added</button>
                                        </div>
                                        <c:set var="found" value="true"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${found == false}">
                                    <button class="btn btn-lg btn-primary tab-button" onclick="addThis('${p.id}')"><i class="fa-regular fa-heart"></i> Add to
                                        Wishlist</button>
                                    </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                    <div class="d-flex">
                        <c:forEach var="p" items="${hotels}">
                            <c:set var="found" value="false"/>
                            <div class="tab-item" >
                                <div class="tab-image">
                                    <img src="./img/${p.id}.jpg" alt="" draggable="false">
                                </div>
                                <p class="h3 text-primary pe-auto"><a href="./product?id=${p.id}">${p.name}</a></p>
                                    <c:forEach var="w" items="${wishlist}">
                                        <c:if test="${w.userID == u.id && w.productID == p.id}">
                                        <div class="text-center">
                                            <button class="btn btn-lg btn-success tab-button" disabled><i class="fa-regular fa-heart"></i> Added</button>
                                        </div>
                                        <c:set var="found" value="true"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${found == false}">
                                    <button class="btn btn-lg btn-primary tab-button" onclick="addThis('${p.id}')"><i class="fa-regular fa-heart"></i> Add to
                                        Wishlist</button>
                                    </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                    <div class="d-flex">
                        <c:forEach var="p" items="${homestays}">
                            <c:set var="found" value="false"/>
                            <div class="tab-item" >
                                <div class="tab-image">
                                    <img src="./img/${p.id}.jpg" alt="" draggable="false">
                                </div>
                                <p class="h3 text-primary pe-auto"><a href="./product?id=${p.id}">${p.name}</a></p>
                                    <c:forEach var="w" items="${wishlist}">
                                        <c:if test="${w.userID == u.id && w.productID == p.id}">
                                        <div class="text-center">
                                            <button class="btn btn-lg btn-success tab-button" disabled><i class="fa-regular fa-heart"></i> Added</button>
                                        </div>
                                        <c:set var="found" value="true"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${found == false}">
                                    <button class="btn btn-lg btn-primary tab-button" onclick="addThis('${p.id}')"><i class="fa-regular fa-heart"></i> Add to
                                        Wishlist</button>
                                    </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="tab-pane fade" id="pills-other" role="tabpanel" aria-labelledby="pills-other-tab">
                    <div class="d-flex">
                        <c:forEach var="p" items="${villa}">
                            <c:set var="found" value="false"/>
                            <div class="tab-item" >
                                <div class="tab-image">
                                    <img src="./img/${p.id}.jpg" alt="" draggable="false">
                                </div>
                                <p class="h3 text-primary pe-auto"><a href="./product?id=${p.id}">${p.name}</a></p>
                                    <c:forEach var="w" items="${wishlist}">
                                        <c:if test="${w.userID == u.id && w.productID == p.id}">
                                        <div class="text-center">
                                            <button class="btn btn-lg btn-success tab-button" disabled><i class="fa-regular fa-heart"></i> Added</button>
                                        </div>
                                        <c:set var="found" value="true"></c:set>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${found == false}">
                                    <button class="btn btn-lg btn-primary tab-button" onclick="addThis('${p.id}')"><i class="fa-regular fa-heart"></i> Add to
                                        Wishlist</button>
                                    </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>




        <!-- Gallery -->
        <section id="gallery">
            <div class="gallery-text">
                <p class="display-3 text-warning">
                    Our Gallery</p>
                <p class="h5 text-white">The
                    finest collection of our pictures</p>
            </div>
            <div id="image-track" data-mouse-down-at="0" data-prev-percentage="0">
                <img src="./img/2.jpg" alt="" class="image" draggable="false">
                <img src="./img/3.jpg" alt="" class="image" draggable="false">
                <img src="./img/4.jpg" alt="" class="image" draggable="false">
                <img src="./img/5.jpg" alt="" class="image" draggable="false">
                <img src="./img/6.jpg" alt="" class="image" draggable="false">
                <img src="./img/7.jpg" alt="" class="image" draggable="false">
                <img src="./img/8.jpg" alt="" class="image" draggable="false">
                <img src="./img/9.jpg" alt="" class="image" draggable="false">
                <img src="./img/10.jpg" alt="" class="image" draggable="false">
                <img src="./img/11.jpg" alt="" class="image" draggable="false">
                <img src="./img/12.jpg" alt="" class="image" draggable="false">
                <img src="./img/13.jpg" alt="" class="image" draggable="false">
                <img src="./img/14.jpg" alt="" class="image" draggable="false">
                <img src="./img/15.jpg" alt="" class="image" draggable="false">
                <img src="./img/16.jpg" alt="" class="image" draggable="false">
            </div>
        </section>




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
                    window.location.href = "addwishlist?site=home&userid=${u.id}&productid=" + id;
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
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="./util/mainhome.js"></script>
        <script src="https://kit.fontawesome.com/a2e765c1c8.js" crossorigin="anonymous"></script>
    </body>

</html>
