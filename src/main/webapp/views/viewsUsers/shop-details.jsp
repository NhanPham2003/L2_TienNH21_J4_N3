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
                        <li><a href="/viewsUsers/authencation/usersAbout">About Us</a></li>
                        <li><a href="/viewsUsers/authencation/usersBlog">Blog</a>
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

<!-- Shop Details Section Begin -->
<section class="shop-details">
    <form object="${product}" action="/viewsUsers/shop-details/addToCart"  method="get" >
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="/viewsUsers/usersHome">Home</a>
                            <a href="/viewsUsers/usersShop">Shop</a>
                            <span>Product Details</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <div style="border-radius:10px;" class="product__thumb__pic set-bg" data-setbg="/img/imgsProducts/${product.hinhAnh.urlImg0}"></div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <div style="border-radius:10px;" class="product__thumb__pic set-bg" data-setbg="/img/imgsProducts/${product.hinhAnh.urlImg1}"></div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <div style="border-radius:10px;" class="product__thumb__pic set-bg" data-setbg="/img/imgsProducts/${product.hinhAnh.urlImg2}"></div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                    <div style="border-radius:10px;" class="product__thumb__pic set-bg" data-setbg="/img/imgsProducts/${product.hinhAnh.urlImg3}"></div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="/img/imgsProducts/${product.hinhAnh.urlImg0}"/>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="/img/imgsProducts/${product.hinhAnh.urlImg1}"/>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="/img/imgsProducts/${product.hinhAnh.urlImg2}"/>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div class="product__details__pic__item">
                                    <img src="/img/imgsProducts/${product.hinhAnh.urlImg3}"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4>${product.giay.ten}</h4>
                            <% boolean minMaxPrice = (Boolean) request.getAttribute("minMaxPrice"); %>
                            <% if ( minMaxPrice) { %>
                            <h3 class="price-range">${money} ${product.minPrice} ${space} ${money}${product.maxPrice}</h3>
                            <% } %>
                            <h3 id="price_product"></h3>
                            <p>${product.giay.moTa}</p>
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                    <span>Variation :</span>
                                    <br>
                                    <span>----------------------------------</span>
                                    <div class="label-container" style="display: flex; flex-wrap: wrap; justify-content: center; ">
                                        <c:forEach items="${listProducts}" var="x">
                                            <label class="label" style="width: 200px; margin: 5px; font-weight: unset; font-size: small;">
                                                    ${x.size.soSize} ${x.mauSac.ten} <input data-idProduct="${x.id}" type="radio" data-price="${x.giaBan}" data-remind="${x.soLuongTon}">
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>
                                <br>
                                <input name="idDProduct" id="idDetailProduct" value="" type="hidden">
<%--                                <div class="product__details__option__size" style=" display: flex;padding-left: 30% ">--%>
<%--                                    <select style="margin-right: 100px" onchange="window.location.href = this.value;">--%>
<%--                                        <option value="#">Sole Material</option>--%>
<%--                                        <c:forEach items="${listCLDG}" var="dg" >--%>
<%--                                            <option value="#">${dg.ten}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                    <span></span>--%>
<%--                                    <select style="margin-left: 100px" onchange="window.location.href = this.value;">--%>
<%--                                        <option>Body Material</option>--%>
<%--                                        <c:forEach items="${listCLTG}" var="tg" >--%>
<%--                                            <option value="#">${tg.ten}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
                            </div>
                            <div class="product__details__cart__option">
                                <div class="quantity">
                                    <p style="display: inline-block; margin: 0;">Quantity :</p>
                                    <div  style="display: inline-block; ">
                                        <input name="quantityProduct" style="width: 80px;" type="number" class="form-control" placeholder="Enter quantity" aria-label="Quantity" min="1" value="1">
                                    </div>
                                    <% boolean remindProduct = (Boolean) request.getAttribute("remindProduct"); %>
                                    <% if (remindProduct) { %>
                                    <p class="sum-remind" style="display: inline-block; margin: 0;">${product.remindProducts}</p>
                                    <% } %>
                                    <p style="display: inline-block; margin: 0;"><span id="quantity_remind">${remindProducts}</span></p>
                                    <p style="display: inline-block; margin: 0;">Pieces available</p>
                                </div>
                            </div>
                            <div class="product__details__cart__option">
                                <button  class="primary-btn">buy now</button>
                                <button  style="color: white" id="addToCartButton" class="primary-btn" >add to cart</button>
                            </div>
                            <div class="product__details__btns__option">
                                <a href=""><i class="fa fa-heart"></i>add to wishlist</a>
                            </div>
                            <div class="product__details__last__option">
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="img/shop-details/details-payment.png" alt="">
                                <ul>
                                    <li><span>SKU:</span> 3812912</li>
                                    <li><span>Categories:</span> Clothes</li>
                                    <li><span>Tag:</span> Clothes, Skin, Body</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                       role="tab">Description</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">Customer
                                        Previews(5)</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-7" role="tab">Additional
                                        information</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">Nam tempus turpis at metus scelerisque placerat nulla deumantos
                                            solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis
                                            ut risus. Sedcus faucibus an sullamcorper mattis drostique des commodo
                                            pharetras loremos.</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                                a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                                $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                                worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-6" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                                a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                                $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                                worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tabs-7" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <p class="note">Nam tempus turpis at metus scelerisque placerat nulla deumantos
                                            solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis
                                            ut risus. Sedcus faucibus an sullamcorper mattis drostique des commodo
                                            pharetras loremos.</p>
                                        <div class="product__details__tab__content__item">
                                            <h5>Products Infomation</h5>
                                            <p>A Pocket PC is a handheld computer, which features many of the same
                                                capabilities as a modern PC. These handy little devices allow
                                                individuals to retrieve and store e-mail messages, create a contact
                                                file, coordinate appointments, surf the internet, exchange text messages
                                                and more. Every product that is labeled as a Pocket PC must be
                                                accompanied with specific software to operate the unit and must feature
                                                a touchscreen and touchpad.</p>
                                            <p>As is the case with any new technology product, the cost of a Pocket PC
                                                was substantial during it’s early release. For approximately $700.00,
                                                consumers could purchase one of top-of-the-line Pocket PCs in 2003.
                                                These days, customers are finding that prices have become much more
                                                reasonable now that the newness is wearing off. For approximately
                                                $350.00, a new Pocket PC can now be purchased.</p>
                                        </div>
                                        <div class="product__details__tab__content__item">
                                            <h5>Material used</h5>
                                            <p>Polyester is deemed lower quality due to its none natural quality’s. Made
                                                from synthetic materials, not natural like wool. Polyester suits become
                                                creased easily and are known for not being breathable. Polyester suits
                                                tend to have a shine to them compared to wool and cotton suits, this can
                                                make the suit look cheap. The texture of velvet is luxurious and
                                                breathable. Velvet is a great choice for dinner party jacket and can be
                                                worn all year round.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>
<!-- Shop Details Section End -->

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <a href="#"><img src="img/footer-logo.png" alt=""></a>
                    </div>
                    <p>The customer is at the heart of our unique business model, which includes design.</p>
                    <a href="#"><img src="img/payment.png" alt=""></a>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--<script>--%>
<%--     alert("Please login to add the product to cart");--%>
<%--</script>--%>


<script>
    const addToCartButton = document.getElementById('addToCartButton');
    const idDetailProduct = document.getElementById('idDetailProduct');

    addToCartButton.addEventListener('click', () => {
        const productId = idDetailProduct.value;

        if (productId) {
            // Thêm sản phẩm vào giỏ hàng
            alert('Sản phẩm đã được thêm vào giỏ hàng.');
        } else {
            event.preventDefault();
            alert('Chưa chọn sản phẩm.');
        }
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const labels = document.querySelectorAll(".label");
        const priceElement = document.querySelector("#price_product");
        const priceRange = document.querySelector(".price-range");
        const sumRemind = document.querySelector(".sum-remind");
        const quantityRemindElement = document.querySelector("#quantity_remind");
        const idDetailProduct = document.querySelector("#idDetailProduct");

        labels.forEach(label => {
            label.addEventListener("click", function() {
                const selectedInput = label.querySelector("input[type='radio']");
                const price = selectedInput.getAttribute("data-price");
                const remind = selectedInput.getAttribute("data-remind");
                const idDP = selectedInput.getAttribute("data-idProduct");

                priceElement.innerHTML = "$"+price;
                quantityRemindElement.innerHTML = remind;
                idDetailProduct.value = idDP;

                // Kiểm tra và ẩn/hiển thị khoảng giá
                const minMaxPrice = <%=(Boolean) request.getAttribute("minMaxPrice")%>;
                if (minMaxPrice) {
                    priceRange.style.display = "none"; // Ẩn khoảng giá
                } else {
                    priceRange.style.display = "block"; // Hiển thị khoảng giá
                }

                // Kiểm tra và ẩn/hiển thị sản phẩmt còn lại
                const remindPrtoduct = <%=(Boolean) request.getAttribute("remindProduct")%>;
                if (remindPrtoduct) {
                    sumRemind.style.display = "none"; // Ẩn khoảng giá
                } else {
                    sumRemind.style.display = "block"; // Hiển thị khoảng giá
                }
            });
        });
    });
</script>
<script>
    var quantityInput = document.getElementById("quantityInput");
    var maxQuantity = quantityInput.getAttribute("data-max-quantity");

    quantityInput.addEventListener("input", function() {
        var enteredValue = Number(quantityInput.value);

        if (isNaN(enteredValue)) {
            alert("Quantity must is number");
        } else if (enteredValue > maxQuantity) {
            quantityInput.value = maxQuantity;
            alert("You have reached the maximum quantity available for this item");
        }
    });
</script>

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