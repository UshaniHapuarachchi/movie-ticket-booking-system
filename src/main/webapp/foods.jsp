<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/2/2023
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
    <link rel="stylesheet" href="css/food_new.css">
    <title>Foods</title>

</head>
<body>
<div class="grid-container">
    <header>
        <ul class="navlist">
            <li><a href="#chooseamoview">STEP 01<br>Choose a Movie</a></li>
            <li><a href="#booktickets">STEP 02<br>Book Tickets</a></li>
            <li><a class="active" href="#purchase">STEP 03<br>Purchase</a></li>
            <li><a href="#done">STEP 04<br>Done</a></li>
        </ul>
    </header>

<aside>
    <form method="post" action="authorize_payment.jsp">
        <div class="sidebar-card">
            <div class="payment">
                <h2>Payment</h2>
                <hr>
                <div class="payment-details">
                    <span>Seats No</span>
                    <input type="text" name="seats" id="setasDataForm">
                    <span id="selectedSeatsData"></span>
                </div>
                <div class="payment-details">
                    <span>Total Price</span>
                    <input type="hidden" name="price" id="priceDataFrom">


                    <span>Rs. <span id="priceData">0</span></span>
                </div>

            </div>
            <div class="payment">
                <h2>Your Details</h2>
                <hr>
                <div class="payment-details-form">
                    <input type="text" class="input" name="name" placeholder="Name: Gotabay Rajapasha">
                    <input type="number" class="input" name="phoneNumber" placeholder="077-123 456 79">
                    <input type="email" class="input" name="email" placeholder="someone@email.com">
                </div>
            </div>


            <div class="payment-btn-float">
                <button type="submit" class="btn-payment" onclick="initiateCheckout()">
                    <span class="button-text">Pay</span>
                    <span class="button-icon">
                        <span class="material-icons-outlined">price_check</span>
                    </span>
                </button>

            </div>

        </div>
    </form>

</aside>
</div>

</body>
<script>

</script>
<script src="js/food.js"></script>


</html>
