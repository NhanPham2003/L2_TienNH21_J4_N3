<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>COFFEE SOUL</title>
    <link rel="icon" href="img/logo-favicon.png" type="image/x-icon">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            background-image: url('/images/wall2.png');
            background-size: 100% auto;
            background-position: center center;
            background-attachment: fixed;
        }

        .form {
            background-color: whitesmoke;
            display: block;
            margin-left: 63% ;
            margin-top: 13.5%;
            padding: 1rem;
            width: 70%;
            max-width: 350px;
            border-radius: 0.5rem;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        .form-title {
            font-size: 1.25rem;
            line-height: 1.75rem;
            font-weight: 600;
            text-align: center;
            color: #834F36;
        }

        .input-container {
            position: relative;
            display: flex;
            margin-bottom: 8px;
        }

        .input-container input,
        .form button {
            outline: none;
            border: 1px solid #834F36;
        }

        .input-container input {
            background-color: #fff;
            padding: 1rem;
            padding-right: 3rem;
            font-size: 0.875rem;
            line-height: 1.25rem;
            width: 100%;
            height: 10px;
            border-radius: 0.5rem;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }

        .input-container-name input {
            background-color: #fff;
            padding: 1rem;
            padding-right: 3rem;
            font-size: 0.875rem;
            line-height: 1.25rem;
            width: 58%;
            height: 10px;
            border-radius: 0.5rem;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            flex: 1;
        }
        .input-container-surname input {
            background-color: #fff;
            padding: 1rem;
            padding-right: 3rem;
            font-size: 0.875rem;
            line-height: 1.25rem;
            width: 58%;
            height: 10px;
            border-radius: 0.5rem;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            flex: 1;
            margin-left: 10px;
        }

        .input-container span {
            display: grid;
            position: absolute;
            top: 0;
            bottom: 0;
            right: 0;
            padding-left: 1rem;
            padding-right: 1rem;
            place-content: center;
        }

        .input-container span svg {
            color: #9CA3AF;
            width: 1rem;
            height: 1rem;
        }

        .submit {
            display: block;
            padding-top: 0.75rem;
            padding-bottom: 0.75rem;
            padding-left: 1.25rem;
            padding-right: 1.25rem;
            background-color: #834F36;
            color: #ffffff;
            font-size: 0.875rem;
            line-height: 1.25rem;
            font-weight: 500;
            width: 100%;
            border-radius: 0.5rem;
            text-transform: uppercase;
        }

        .signup-link {
            color: #582209;
            font-size: 0.875rem;
            line-height: 1.25rem;
            text-align: center;
        }

        .signup-link a {
            text-decoration: underline;
        }

        .form-otp {
            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: space-around;
            width: 300px;
            background-color: whitesmoke;
            border-radius: 12px;
            padding: 20px;
            margin-top: 13.5%;
            margin-left: 63%;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }


        .title {
            font-size: 20px;
            font-weight: bold;
            color: black
        }

        .message {
            color: #a3a3a3;
            font-size: 14px;
            margin-top: 4px;
            text-align: center
        }

        /* hard reset */
        .form-card-input {
            all: unset;


        }

        .form-card-input-wrapper {
            position: relative;
            width: 100%;
            height: 3rem;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
        }

        .form-card-input {
            margin-left: 10%;
            font-size: 2rem;
            font-weight: bold;
            letter-spacing: 2rem;
            text-align: start;
            -webkit-transform: translateX(36px);
            -ms-transform: translateX(36px);
            transform: translateX(36px);
            position: absolute;
            z-index: 3;
            background-color: transparent;
        }

        .form-card-input-bg {
            content: '';
            width: 240px;
            height: 60px;
            margin: auto;
            inset: 0;
            bottom: 10px;
            position: absolute;
            z-index: 1;
            border-radius: 12px;
            background-color: rgba(180, 180, 180, 0.664);

        }

        .resend a {
            color: black;
            text-decoration: none;
        }

        .action {
            margin-top: 24px;
            padding: 12px 16px;
            border-radius: 8px;
            border: none;
            background-color: royalblue;
            color: white;
            cursor: pointer;
            align-self: end;
            margin-bottom: 4%;
        }

        .countdown {
            font-size: 15px;
            font-weight: bold;
        }

        .disabled-link {
            pointer-events: none;
            opacity: 0.5;
        }

        .link-container a {
            display: inline;
            text-decoration: underline;
            color: rgb(0, 0, 0);
        }
    </style>

</head>
<body>

<% boolean register = (Boolean) request.getAttribute("register"); %>
<% if (register) { %>
<form action="/viewsUsers/authencation/usersRegister"  class="form" method="post" onsubmit="return validatePassword()" >
    <p class="form-title">Register to your account</p>
    <span style="color: red;"> ${error_OTP}</span>
    <div class="input-container">
        <input value="${fullName}"  placeholder="Full name" name="fullname" type="text">
        <span  style="color: red;">
                <small>${messageFullNameErr}</small>
        </span>
    </div>
    <div class="input-container">
        <input value="${email}"  placeholder=" Email" name="email" type="email">
        <span style="color: red;">
			 	<small>${messageEmailErr}</small>
			 </span>
    </div>
    <div class="input-container">
        <input placeholder=" Password" type="password" class="form-control" name="password" id="password">
        <span style="color: red;">
				<small>${messagePassErr}</small>
			</span>
    </div>
    <div class="input-container">
        <input name="confirmPass"  placeholder=" Confirm Password" type="password" class="form-control"  id="passwordConfirm">
        <span style="color: red;">
            <small>${messageCofirmPassErr}</small>
        </span>
    </div>
    <button class="submit" type="submit">
        Register
    </button>
    <p class="signup-link">
        <a href="/viewsUsers/authencation/usersLogin">Login</a>
    </p>
</form>

<% } %>

<% boolean otpVerificationRequired = (Boolean) request.getAttribute("otpVerificationRequired"); %>
<% if (otpVerificationRequired) { %>
    <form method="post" action="/viewsUsers/authencation/verify-otp" class="form-otp">
        <div class="title">OTP</div>
        <div class="title">Verification Code</div>
        <p class="message">We have sent a verification code to your email number</p>

        <span style="color: red;">${messageOTP}</span>
        <br>
        <div class="form-card-input-wrapper">
            <input type="tel" maxlength="4" placeholder="____" class="form-card-input" name="OTPRegister">
            <div class="form-card-input-bg"></div>
        </div>

        <button  id="myButton"  class="action">Verify me</button>

        <div class="resend">
            <a id="countdown-link">Resend</a>
        </div>

        <br>
        <div class="link-container">
            <a href="">Not get OTP ?</a>
        </div>

    </form>

<% } %>


<script>
    function validatePassword() {
        var password = document.getElementById("password").value;
        var passwordConfirm = document.getElementById("passwordConfirm").value;

        if (password !== passwordConfirm) {
            alert("The confirmation password does not match the entered password!");
            return false;
        }
        return true;
    }
</script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var countdownElement = document.getElementById("countdown-link");
        var countdown = 60;
        var countdownInterval;

        function updateCountdown() {
            countdown--;
            countdownElement.textContent = countdown + "s";

            if (countdown === 0) {
                clearInterval(countdownInterval);
                countdownElement.href = "/viewsUsers/authencation/resened-otp";
                countdownElement.textContent = "Resend";
            }
        }

        countdownInterval = setInterval(updateCountdown, 1000);

        countdownElement.addEventListener("click", function() {
            if (countdown === 0) {
                countdown = 60;
                countdownElement.textContent = countdown + "s";
                countdownElement.href = "/viewsUsers/authencation/resened-otp";
                countdownInterval = setInterval(updateCountdown, 1000);
            }
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var button = document.getElementById("myButton");
        var clicked = false;
        var disableTimeout;

        function disableButton() {
            button.disabled = true;
        }

        function resetDisableTimeout() {
            clearTimeout(disableTimeout);
            disableTimeout = setTimeout(disableButton, 30000);
        }

        resetDisableTimeout();

        button.addEventListener("click", function() {
            if (!clicked) {
                clicked = true;
            }
        });

        document.addEventListener("mousemove", resetDisableTimeout);
        document.addEventListener("keydown", resetDisableTimeout);
    });
</script>
</body>
</html>