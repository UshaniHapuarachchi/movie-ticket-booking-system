<%@
     page import="com.example.abc_cinema_new.paymentService"
%>
<%@
        page import="com.example.abc_cinema_new.OrderDetail"
%>



<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.example.abc_cinema_new.paymentService" %>
<%@ page import="com.example.abc_cinema_new.*" %>.
<%@ page import="com.paypal.base.rest.PayPalRESTException" %>
<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 1/12/2023
  Time: 5:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>



<%
    Connection con = null;

  String name = request.getParameter("name").toString();
  int phone_number = Integer.parseInt(request.getParameter("phoneNumber"));
    String  email = request.getParameter("email");
  System.out.print(name);
  HttpSession session1 = request.getSession();
  int id = (Integer) session1.getAttribute("id");
  String time = (String)session1.getAttribute("time");
  String date = (String)session1.getAttribute("mDate");
  String[] values = request.getParameter("seats").split(",");
  int[] seats = new int[values.length];
  System.out.println(seats.toString());
int orderNumber = 0;
  try {
      // load driver and create connection
      Class.forName("com.mysql.cj.jdbc.Driver");
      con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");

      Random rand = new Random();
      int max = 99999999;
      int min = 999999999;
      int random = (int)(Math.random() * 99999999 + 99999);
      int order_id = random;



      HttpSession session2 = request.getSession();
      session2.setAttribute("email",email);



      // create prepared statement
      PreparedStatement pstmt = con.prepareStatement("INSERT INTO seats(userPhoneNumber,seatIndex,movieID,movieTime,movieDate,payment,id) VALUES (?,?,?,?,?,?,?)");

      for (int i = 0; i < values.length; i++) {
          seats[i] = Integer.parseInt(values[i]);
          pstmt.setInt(1,phone_number);
          pstmt.setInt(2,seats[i]);
          pstmt.setInt(3,id);
          pstmt.setString(5,date);
          pstmt.setString(4,time);
          pstmt.setString(6,"pending");
          pstmt.setString(7, String.valueOf(order_id));
          System.out.println(order_id);
          orderNumber = order_id;
          pstmt.executeUpdate();
      }

      // redirect
     // response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/done.jsp");
      pstmt.close(); // close statement
      con.close();  // close connection
  }catch (Exception e) {
      out.println(e);

  }
%>










<%




    try {

        OrderDetail orderDetail = new OrderDetail(1,1,Integer. toString(orderNumber));

        Order order = new Order();
        paymentService payment = new paymentService();
        String approvalLink = payment.authorizePayment(orderDetail);

        response.sendRedirect(approvalLink);

    } catch (PayPalRESTException ex) {
        request.setAttribute("errorMessage", ex.getMessage());
        ex.printStackTrace();
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }








%>
</body>
</html>
