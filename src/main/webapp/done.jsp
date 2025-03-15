<%@ page import="com.paypal.api.payments.Payment" %>
<%@ page import="com.paypal.api.payments.PayerInfo" %>
<%@ page import="com.paypal.api.payments.Transaction" %>
<%@ page import="com.paypal.api.payments.ShippingAddress" %>
<%@ page import="com.example.abc_cinema_new.paymentService" %>
<%@ page import="com.paypal.base.rest.PayPalRESTException" %>
<%@ page import="com.example.abc_cinema_new.SendMail" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.example.abc_cinema_new.DB" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/10/2023
  Time: 7:56 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Done</title>
    <link rel="stylesheet" href="css/done.css">
</head>
%
<body>
<%
    String paymentId = request.getParameter("paymentId");
    String payerId = request.getParameter("PayerID");
    System.out.println(paymentId);
    System.out.println(payerId);

    try {
        paymentService paymentServices = new paymentService();
        Payment payment = paymentServices.getPaymentDetails(paymentId);

        PayerInfo payerInfo = payment.getPayer().getPayerInfo();
        Transaction transaction = payment.getTransactions().get(0);
        ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();


        System.out.println(transaction.getDescription());

        HttpSession session1 = request.getSession();
        String email = session1.getAttribute("email").toString();
        System.out.println(email);


        // load driver and create connection
     //   Class.forName("com.mysql.cj.jdbc.Driver");
      //  con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");

        // Sender's email ID needs to be mentioned



        String time = (String)session1.getAttribute("time");
        String[] seat = (String[]) session1.getAttribute("seats");
        System.out.println(time);
        System.out.println(seat);

   try{
            SendMail sendMail = new SendMail();
            sendMail.send(email);

       DB db = new DB();
       db.update(transaction.getDescription());



        }
        catch (Exception e)
        {
            System.out.println(e);
        }




    } catch (PayPalRESTException ex) {
        request.setAttribute("errorMessage", ex.getMessage());
        ex.printStackTrace();
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }









%>
<div class="container">
    <h3>Thank you!</h3>
    <h1>Payment Successful</h1>
</div>

</body>
</html>
