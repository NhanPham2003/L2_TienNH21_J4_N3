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

    <!-- Google Font -->
    <link rel="icon" href="/img/logo-favicon.png" type="image/x-icon">
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

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb__text">
                    <h4>Shop</h4>
                    <div class="breadcrumb__links">
                        <a href="/viewsUsers/usersHome">Home</a>
                        <a href="/viewsUsers/usersShop">Shop</a>
                        <span>Shopping Cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">

    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="shopping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th><input  onclick="selectAllRows()"  class="check" type="checkbox"  style="margin-right: 20px"></th>
                            <th>Product</th>
                            <th>Variations</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listCTGH}" var="c" >
                            <tr id="productId" value="${c.chiTietGiay.id}">
                                <form action="/deleteToCartButton/${c.chiTietGiay.id}" method="post" >
                                    <td><input name="${c.id}" type="checkbox"></td>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <a href="/viewsUsers/shop-details/${c.chiTietGiay.giay.id}"> <img style="width:90px; height:90px;" src="/img/imgsProducts/${c.chiTietGiay.hinhAnh.urlImg0}"></a>
                                        </div>
                                        <div class="product__cart__item__text">
                                            <a href="/viewsUsers/shop-details/${c.chiTietGiay.giay.id}">
                                                <h6>${c.chiTietGiay.giay.ten}</h6>
                                            </a>
                                            <h5 class="cart__price">${c.chiTietGiay.giaBan}</h5>
                                        </div>

                                    </td>
                                    <td class="cart__price">
                                        <div  style="position: absolute;padding-top: -30px">
                                            <span id="showButton" style="font-weight: normal; font-size: medium;">Options :</span>
                                            <div id="hiddenDiv" style="display: none; height: 100px; width: 200px; background-color: aquamarine;">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <input  type="text"  id="quantityInput_${product.id}" value="${c.soLuong}">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price" id="totalAmount">$ ${c.chiTietGiay.giaBan * c.soLuong}</td>
                                    <td class="cart__close"><a href="/viewsUsers/shop-details/deleteProduct/${c.chiTietGiay.id}" id="deleteToCartButton" style="border-radius: 20% ; " ><i class="fa fa-close"></i></a></td>

                                </form>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="continue__btn">
                            <a href="/viewsUsers/usersShop">Shop</a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="continue__btn update__btn">
                            <a href="#"><i class="fa fa-spinner"></i>Update Cart</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="cart__discount">
                    <h6>Discount codes</h6>
                    <form action="#">
                        <input type="text" placeholder="Coupon code">
                        <button type="submit">Apply</button>
                    </form>
                </div>
                <div class="cart__total">
                    <form action="/checkout" method="Post">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span>$ 169.50</span></li>
                            <li>Total <span>$ 169.50</span></li>
                        </ul>
                        <button style="margin: auto" type="submit" class="primary-btn">Proceed to checkout</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


</section>
<!-- Shopping Cart Section End -->

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
<%--<div if="${message}" class="alert alert-success" role="alert">--%>
<%--    <span text="${message}"></span>--%>
<%--</div>--%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>




<script>
    const showButton = document.getElementById('showButton');
    const hiddenDiv = document.getElementById('hiddenDiv');

    document.addEventListener('click', function(event) {
        if (!showButton.contains(event.target) && !hiddenDiv.contains(event.target)) {
            hiddenDiv.style.display = 'none';
        }
    });

    showButton.addEventListener('click', function() {
        hiddenDiv.style.display = 'block';
        event.stopPropagation(); // Ngăn chặn sự kiện click lan truyền lên body/document
    });

    hiddenDiv.addEventListener('click', function(event) {
        event.stopPropagation(); // Ngăn chặn sự kiện click lan truyền lên body/document
    });

</script>

<script>
    function selectAllRows() {
        var checkboxes = document.querySelectorAll('tbody input[type="checkbox"]');
        var selectAllCheckbox = document.querySelector('thead input.check');

        checkboxes.forEach(function(checkbox) {
            checkbox.checked = selectAllCheckbox.checked;
        });
    }
</script>

<script>
    $(document).ready(function() {
        $(".deleteToCartButton").click(function(event) {
            event.preventDefault();  // Ngăn chặn hành vi mặc định của button

            var idProduct = $(this).closest("tr").attr("id");  // Lấy ID sản phẩm từ thuộc tính id của phần tử tr

            // Gửi yêu cầu AJAX đến Controller
            $.ajax({
                url: "/deleteToCartButton/" + idProduct,
                type: "POST",
                success: function(response) {
                    // Hiển thị thông báo thành công
                    $("#alertMessage").text(response).show();
                    // Cập nhật danh sách giỏ hàng (nếu cần)
                    // ...
                },
                error: function(xhr, status, error) {
                    // Xử lý lỗi (nếu có)
                    alert("Error occurred while removing the product from cart");
                }
            });
        });
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