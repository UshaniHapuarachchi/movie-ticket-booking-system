<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/1/2023
  Time: 10:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html>
<head>
    <link rel="stylesheet" href="css/booking_new.css">
    <title>Booking</title>
</head>
<body>
<!--header-->
<header class="header">
    <div class="menu">
        <ul class="navlist">
            <li><a href="movies.jsp">STEP 01<br>Choose a Movie</a></li>
            <li><a href="#">STEP 02<br>Book Tickets</a></li>
            <li><a class="active" href="#purchase">STEP 03<br>Purchase</a></li>
            <li><a href="#">STEP 04<br>Done</a></li>
        </ul>
    </div>
</header>
<!--end header-->
<%
    int id = Integer.parseInt(request.getParameter("movie_id"));
    String movieDate = request.getParameter("movieDate");

    HttpSession session1 = request.getSession();
    session1.setAttribute("mDate",movieDate);

    Connection con = null;
    PreparedStatement st = null;
    ResultSet rs = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
        String sql = "SELECT * FROM movies where id = ?";



        st = con.prepareStatement(sql);
        st.setInt(1,id);
        rs = st.executeQuery();
        while (rs.next()){
            String movie_name = rs.getString("movie_name");
            String short_banner = rs.getString("small_banner");
            String time = rs.getString("time");
            String type = rs.getString("type");
            String duration = rs.getString("duration");
            String price = rs.getString("price");
            String description = rs.getString("description");


            session1.setAttribute("time",time);
            session1.setAttribute("id", id);

%>
<main class="grid-container">
    <!-- Sidebar movie details -->
    <div class="sidebar">
        <div class="vertical-line"></div>
        <div class="movie-img">
            <img src="image_data/<%=short_banner%>" alt="">
            <div class="movie-banner-details">
                <h2><%=movie_name%></h2>
                <table>
                    <tr>
                        <td class="title">Duration</td>
                        <td class="title-detail"><%=duration%></td>
                    </tr>
                    <tr>
                        <td class="title">Type</td>
                        <td class="title-detail"><%=type%></td>
                    </tr>
                </table>
            </div>
            <!-- Payment Details -->
            <div class="payment-details">
                <h2>Payment Details<hr></h2>
                <table>
                    <tr>
                        <td class="title">Date</td>
                        <td class="title-detail"><%=movieDate%></td>
                    </tr>
                    <tr>
                        <td class="title">Time</td>
                        <td class="title-detail"><%=time%></td>
                    </tr>
                </table>
            </div>
            <div class="movie-seats">
                <h2>Seats</h2>
                <form action="foods.jsp" method="get">
                    <table >
                        <tr>
                            <td class="title">Regular</td>
                            <td class="title-detail"><span id="count">0</span></td>
                        </tr>
                    </table>
                    <div class="btn">
                        <button type="submit" class="button clr-taken">
                            <span class="button-text">Pay &nbsp; Rs.<span id="total"><%=price%></span></span>
                        </button>
                    </div>

                </form>

            </div>
        </div>

    </div>

    <div class="booking">
        <div class="booking-details">
            <div class="booking-picker">
                <h2>About Movie</h2>
                <h3><%=description%></h3>
            </div>

        </div>
        <div class="large-banner">
            <img src="img/BG.png" alt="">
        </div>

        <input type="hidden" name="price" id="movie" value="<%=price%>">

        <div class="main-movie">
            <ul class="showcase">
                <li>
                    <div class="seat">
                        <small>N/A</small>
                    </div>
                </li>
                <li>
                    <div class="seat selected">
                        <small>Selected</small>
                    </div>
                </li>
                <li>
                    <div class="seat occupied">
                        <small>Occupied</small>
                    </div>
                </li>
            </ul>

            <div class="container">
                <div class="screen"></div>


                <%
                    // Connect to the database and get the occupied seat indices
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs1 = null;
                    List<Integer> occupiedSeats = new ArrayList<>();
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
                        String sql2 = "SELECT seatIndex FROM seats WHERE movieId = ? AND movieTime = ? AND movieDate = ? AND payment= ?";
                        stmt = conn.prepareStatement(sql2);
                        int movieId = Integer.parseInt(request.getParameter("movie_id"));
                        stmt.setInt(1, id);
                        stmt.setString(2,time);
                        stmt.setString(3,movieDate);
                        stmt.setString(4,"done");
                        rs1 = stmt.executeQuery();
                        while (rs1.next()) {
                            occupiedSeats.add(rs1.getInt("seatIndex"));
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs1 != null) {
                                rs1.close();
                            }
                            if (stmt != null) {
                                stmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    // Generate the seating chart HTML
                    int rows = 6;
                    int seatsPerRow = 8;
                    for (int i = 1; i <= rows; i++) {
                %>
                <div class="row">
                    <%
                        for (int j = 1; j <= seatsPerRow; j++) {
                            char seatLetter = (char)('A' + (i - 1));
                            int seatIndex = (i - 1) * seatsPerRow + j - 1;
                            String seatClass = "seat";
                            if (occupiedSeats.contains(seatIndex)) {
                                seatClass += " occupied";
                            }
                    %>
                    <div class="<%= seatClass %>">
                        <span class="seat-text"><%= seatLetter %><%= j %></span>
                    </div>
                    <%
                        }
                    %>
                </div>
                <%
                    }
                %>


            </div>
        </div>

    </div>

</main>
<script src="js/booking_new.js"></script>
</body>
<%
        }
    }catch (Exception e){
        out.println(e);
    }
%>

</html>