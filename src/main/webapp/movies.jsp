<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/30/2022
  Time: 11:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined">
    <title>Movies</title>
    <link rel="stylesheet" href="css/movie.css">
</head>
<body>
<header>
    <a href="#" class="brand">ABC CINEMA</a>
    <div class="menu-btn"></div>
    <div class="navigation">
        <div class="navigation-items">
            <div class="search">
                <form action="#">
                    <input type="text"placeholder=" Search Movies"name="search">
                    <button type="submit" class="button">
                        <span class="button-text">Search</span>
                        <span class="button-icon">
                      <span class="material-icons-outlined">search</span>
                    </span>

                    </button>
                </form>
            </div>

            <a href="index.jsp">Home</a>
            <a href="#">Movies</a>
            <a href="#">Login</a>

        </div>
    </div>
</header>

<div class="background-image">
    <div class="movie-container">
        <%
            Connection con = null;
            PreparedStatement st = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
                String sql = "SELECT * FROM movies";
                st = con.prepareStatement(sql);
                rs = st.executeQuery();
                while(rs.next()){
                    int id = rs.getInt("id");
                    String movie_name = rs.getString("movie_name");
                    String description = rs.getString("description");
                    String smallBanner = rs.getString("small_banner");
                    String time = rs.getString("time");
                    String price = rs.getString("price");

        %>
        <form method="get" action="booking.jsp">
        <section class="movie" id="movie" >

                <div class="movie-img">
                    <img src="image_data/<%=smallBanner%>">
                </div>

                <div class="movie-text">
                    <h1><%=movie_name%></h1>
                    <div class="movie-price">
                        <div class="m-time">
                            <h2>Time</h2>
                            <p><%=time%></p>
                        </div>
                        <div class="m-time">
                            <h2>Price</h2>
                            <p>Rs. <%=price%></p>
                        </div>
                        <div class="m-time">
                            <h2>Date</h2>
                            <p><input type="date" name="movieDate" required min="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>"></p>
                        </div>
                    </div>

                    <p><%=description%></p>
                        <input type="hidden" name="movie_id" value="<%=id%>">
                        <button type="submit" class="button">
                            <span class="button-text">Book now</span>
                            <span class="button-icon">
                            <span class="material-icons-outlined">bookmark_added</span>
                        </span>
                        </button>
                </div>
        </section>
        </form>
        <%
                }
            } catch (Exception e) {
                out.println(e);
            } %>

    </div>

</div>

</body>
</html>
