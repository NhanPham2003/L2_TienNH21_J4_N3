<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>COFFEE SOUL</title>

    <link rel="icon" href="/img/logo-favicon.png" type="image/x-icon">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-7">
                    <div class="header__top__left">
                        <p>Welcome to the shopping experience</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__hover">
                            <% boolean ifFullnameLogin = (Boolean) request.getAttribute("ifFullnameLogin"); %>
                            <% if ( ifFullnameLogin) { %>
                            <span>${fullnameLogin}<i class="arrow_carrot-down"></i></span>
                            <ul>
                                <li><a href="/settingAccount" >Setting</a></li>
                                <li><a href="/viewsUsers/usersLogout">Log out</a></li>
                            </ul>
                            <% } %>
                        </div>
                        <div class="header__top__links"  >
                            <% boolean messageLoginOrSignin = (Boolean) request.getAttribute("messageLoginOrSignin"); %>
                            <% if ( messageLoginOrSignin) { %>
                            <a href="/viewsUsers/authencation/usersLogin">Login</a>
                            <a href="/viewsUsers/authencation/usersRegister">Register</a>
                            <% } %>
                        </div>
                        <div class="header__top__hover">
                            <span>EN<i class="arrow_carrot-down"></i></span>
                            <ul>
                                <li><a href="?language=vi">VI</a></li>
                                <li><a href="?language=ge">GE</a></li>
                                <li><a href="?language=en">EN</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="header__logo">
                    <a  href="/index2" ><img src="/img/logo.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <nav class="header__menu mobile-menu">
                    <ul>
                        <li><a href="/viewsUsers/usersHome" >Home</a></li>
                        <li class="active"><a href="/viewsUsers/usersShop" >Shop</a></li>
                        <li><a href="/viewsUsers/usersAbout">About Us</a></li>
                        <li><a href="/viewsUsers/usersBlog">Blog</a>
                            <ul class="dropdown">
                                <li><a href="/viewsUsers/authencation/usersBlog-details">Blog Details</a></li>
                            </ul>
                        </li>
                        <li><a href="/viewsUsers/authencation/usersContact">Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
                    <a href="#" class="search-switch"><img src="/img/icon/search.png" alt=""></a>
                    <a href="#"><img src="/img/icon/heart.png" alt=""></a>

                    <a href="/viewsUsers/shopping-cart" style="position: relative; display: inline-block; ">
                        <img src="/img/icon/cart.png" alt="">
                        <span class="cart-count" style="position: absolute; height:20px; width: 25px; top: -10px; right: -15px;  color: rgb(0, 0, 0) ; font-size: 12px; font-weight: bold;  padding: 4px; border-radius: 50%;" >${sumProductInCart}</span>
                    </a>
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
</header>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Shop</h4>
                    <div class="breadcrumb__links">
                        <a href="/viewsUsers/usersHome" >Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shop Section Begin -->
<section class="shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="shop__sidebar">
                    <div class="shop__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Search...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="shop__sidebar__accordion">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__categories">
                                            <ul class="nice-scroll" style="height: 20%">
                                                <li data-filter="*"><a href="#">All Product(20)</a></li>
                                                <li><a href="#">Best Seller (20)</a></li>
                                                <li><a href="#">New Arrivals (20)</a></li>
                                                <li><a href="#">Collections (20)</a></li>
                                                <li><a href="#">Sale off 20%  (20)</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">Branding</a>
                                </div>
                                <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__brand">
                                            <ul>
                                                <li class="active" data-filter="*"><a >All Branding</a></li>
                                                <c:forEach items="${listBrand}" var="br" >
                                                    <li data-filter=".${br.ten}" ><a>${br.ten}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                </div>
                                <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__price">
                                            <ul>
                                                <li><a href="#">$0.00 - $50.00</a></li>
                                                <li><a href="#">$50.00 - $100.00</a></li>
                                                <li><a href="#">$100.00 - $150.00</a></li>
                                                <li><a href="#">$150.00 - $200.00</a></li>
                                                <li><a href="#">$200.00 - $250.00</a></li>
                                                <li><a href="#">250.00+</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                </div>
                                <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__size">

                                            <c:forEach items="${listSize}" var="size" >
                                                <label>
                                                    <li><a href="/ + ${size}" >${size.soSize}</a></li>
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFive">Color</a>
                                </div>
                                <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__color">
                                            <c:forEach items="${listColor}" var="color" >
                                                <label style="background-color: ${color.ten};" >
                                                    <input type="radio" >
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseSix">Tags</a>
                                </div>
                                <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="shop__sidebar__tags">
                                            <a href="#">Product</a>
                                            <a href="#">Bags</a>
                                            <a href="#">Shoes</a>
                                            <a href="#">Fashion</a>
                                            <a href="#">Clothing</a>
                                            <a href="#">Hats</a>
                                            <a href="#">Accessories</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="shop__product__option">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__product__option__left">
                                <p> Showing 1 – 9 of ${sumProduct} Results</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="shop__product__option__right">
                                <p>Sort by Price:</p>
                                <select onchange="window.location.href = this.value;">
                                    <option>${ChooseAnOption}</option>
                                    <option value="/viewsUsers/usersShop/LowToHigh">Low To High</option>
                                    <option value="/viewsUsers/usersShop/HighToLow">High To Low</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row product__filter">

                    <c:forEach  items="${listProducts}" var="product">
                        <div class="col-lg-4 col-md-6 col-sm-6 mix ${product.nameBrand}">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" style="border-radius: 10px;"  data-setbg="/img/imgsProducts/${product.hinhAnh.urlImg0}">
                                    <ul class="product__hover">
                                        <li><a href="#"><img src="/img/icon/heart.png" alt=""></a></li>
                                        <li><a href="#"><img src="/img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6>${product.giay.ten}</h6>
                                    <a href="/viewsUsers/shop-details/${product.giay.id}" class="add-cart">+ Add To Cart</a>
                                    <h5>${product.minPrice}</h5>
                                    <h6 style="text-align: right">${product.remindProducts} sold</h6>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__pagination">
                            <c:forEach var="i" begin="1" end="${totalPage}">
                                <a class="active" href="/viewsUsers/usersShop?pageNum=${i}">${i}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shop Section End -->

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="/img/footer-logo.png" alt=""></a>
                    </div>
                    <p>The customer is at the heart of our unique business model, which includes design.</p>
                    <a href="#"><img src="/img/payment.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Shopping</h6>
                    <ul>
                        <li><a href="#">Clothing Store</a></li>
                        <li><a href="#">Trending Shoes</a></li>
                        <li><a href="#">Accessories</a></li>
                        <li><a href="#">Sale</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Shopping</h6>
                    <ul>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">Payment Methods</a></li>
                        <li><a href="#">Delivary</a></li>
                        <li><a href="#">Return & Exchanges</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>NewLetter</h6>
                    <div class="footer__newslatter">
                        <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                        <form action="#">
                            <input type="text" placeholder="Your email">
                            <button type="submit"><span class="icon_mail_alt"></span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="footer__copyright__text">
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <p>Copyright ©
                        <script>
                            document.write(new Date().getFullYear());
                        </script>2020
                        All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                            aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    </p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search End -->

<!-- Js Plugins -->
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.nice-select.min.js"></script>
<script src="/js/jquery.nicescroll.min.js"></script>
<script src="/js/jquery.magnific-popup.min.js"></script>
<script src="/js/jquery.countdown.min.js"></script>
<script src="/js/jquery.slicknav.js"></script>
<script src="/js/mixitup.min.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/main.js"></script>
</body>

</html>