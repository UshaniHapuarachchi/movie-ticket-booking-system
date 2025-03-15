<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/23/2022
  Time: 11:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../css/admin_css.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/f9662ce49b.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
          rel="stylesheet">
    <title>Admin Home</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if(!username.equals("admin") || !password.equals("admin")) {
        response.sendRedirect("../webapp/Admin/admin_login.jsp");
        return;
    }

    session.setAttribute("username", username);
    session.setAttribute("password", password);
%>
<div class="grid-container">

    <!-- Header -->
    <header class="header">
        <div class="menu-icon" onclick="openSidebar()">
            <span class="material-icons-outlined">menu</span>
        </div>

        <div class="header-left">
            <div class="input-text">
                <input type="text" name="user_search">
                <label placeholder="Search"></label>
            </div>
            <div class="btn">
                <button type="submit" class="button-update btn-update">
                    <span class="button-text">Search</span>
                    <span class="button-icon">
                            <span class="material-icons-outlined">search</span>
                        </span>
                </button>
            </div>


        </div>
        <div class="header-right">
            <span class="material-icons-outlined">notifications</span>
            <span class="material-icons-outlined">mail</span>
            <span class="material-icons-outlined">account_circle</span>
        </div>


    </header>

    <!-- Sidebar -->
    <aside id="sidebar">
        <div class="sidebar-title">
            <div class="sidebar-brand">
                <span class="material-icons-outlined">movie</span> ABC Cinema
            </div>
            <span class="material-icons-outlined" onclick="closeSidebar()">close</span>
        </div>
        <ul class="sidebar-list">
            <li class="sidebar-list-item">
                <span class="material-icons-outlined">dashboard</span> <a href="#dashbord_section">Dashboard</a>
            </li>
            <li class="sidebar-list-item">
                <span class="material-icons-outlined">hd</span> <a href="#movie_section">Movies</a>
            </li>
            <li class="sidebar-list-item">
                <span class="material-icons-outlined">payments</span> <a href="#payments_section">Payments</a>
            </li>
        </ul>
    </aside>

    <!-- main container -->
    <main class="main-container" >
        <!-- Dashboard Section-->
        <section id="dashbord_section">
            <div class="main-title">
                <p class="font-weight-bold">DASHBOARD</p>
            </div>

            <div class="charts">
                <div class="charts-card">
                    <div class="chart-title">Top 5 Movies</div>
                    <form method="get" action="../Top_movies">
                        <div class="select-container">
                            <%-- Top 1 movie--%>
                            <%
                                // Set up the database connection and create a Prepared Statement
                                Connection conn = null;
                                PreparedStatement pstmt1 = null;
                                ResultSet rs1 = null;

                                try {
                                    // Load the JDBC driver and establish a connection to the database
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conn = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");

                                    // Create a Prepared Statement to execute the SELECT query
                                    String sql = "SELECT * FROM movies";
                                    pstmt1 = conn.prepareStatement(sql);

                                    // Execute the query and store the result set
                                    rs1 = pstmt1.executeQuery();
                                } catch (SQLException se) {
                                    // Handle JDBC errors
                                    se.printStackTrace();
                                } catch (ClassNotFoundException cnfe) {
                                    // Handle ClassNotFoundException
                                    cnfe.printStackTrace();
                                }
                            %>
                            <label for="top_1">Select Top 1 Movie</label>
                            <select name="1_active_movie" id="top_1" class="select">
                                <%
                                    // Iterate through the result set and add the values as option elements to the select tag
                                    while (rs1.next()) {
                                        int id = rs1.getInt("id");
                                        String name = rs1.getString("movie_name");
                                %>
                                <option value="<%= id %>"><%= name %></option>
                                <%
                                    }
                                %>
                            </select><br>
                            <%-- Top 2 movie--%>
                            <%
                                // Set up the database connection and create a Prepared Statement
                                Connection conn2 = null;
                                PreparedStatement pstmt2 = null;
                                ResultSet rs2 = null;

                                try {
                                    // Load the JDBC driver and establish a connection to the database
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conn2 = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");

                                    // Create a Prepared Statement to execute the SELECT query
                                    String sql = "SELECT * FROM movies";
                                    pstmt2 = conn2.prepareStatement(sql);

                                    // Execute the query and store the result set
                                    rs2 = pstmt2.executeQuery();
                                } catch (SQLException se) {
                                    // Handle JDBC errors
                                    se.printStackTrace();
                                } catch (ClassNotFoundException cnfe) {
                                    // Handle ClassNotFoundException
                                    cnfe.printStackTrace();
                                }
                            %>
                            <label for="top_1">Select Top 1 Movie</label>
                            <select name="2_active_movie" id="top_1" class="select">
                                <%
                                    // Iterate through the result set and add the values as option elements to the select tag
                                    while (rs2.next()) {
                                        int id = rs2.getInt("id");
                                        String name = rs2.getString("movie_name");
                                        String des = rs2.getString("short_description");
                                %>
                                <option value="<%= id %>"><%= name %></option>
                                <%
                                    }
                                %>
                            </select><br>

                            <%-- Top 3 movie--%>
                            <%
                                // Set up the database connection and create a Prepared Statement
                                Connection conn3 = null;
                                PreparedStatement pstmt3 = null;
                                ResultSet rs3 = null;

                                try {
                                    // Load the JDBC driver and establish a connection to the database
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conn3 = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");

                                    // Create a Prepared Statement to execute the SELECT query
                                    String sql = "SELECT * FROM movies";
                                    pstmt3 = conn3.prepareStatement(sql);

                                    // Execute the query and store the result set
                                    rs3 = pstmt3.executeQuery();
                                } catch (SQLException se) {
                                    // Handle JDBC errors
                                    se.printStackTrace();
                                } catch (ClassNotFoundException cnfe) {
                                    // Handle ClassNotFoundException
                                    cnfe.printStackTrace();
                                }
                            %>
                            <label for="top_1">Select Top 1 Movie</label>
                            <select name="3_active_movie" id="top_1" class="select">
                                <%
                                    // Iterate through the result set and add the values as option elements to the select tag
                                    while (rs3.next()) {
                                        int id = rs3.getInt("id");
                                        String name = rs3.getString("movie_name");
                                %>
                                <option value="<%= id %>"><%= name %></option>
                                <%
                                    }
                                %>
                            </select><br>
                            <%-- Top 4 movie--%>
                            <%
                                // Set up the database connection and create a Prepared Statement
                                Connection conn4 = null;
                                PreparedStatement pstmt4 = null;
                                ResultSet rs4 = null;

                                try {
                                    // Load the JDBC driver and establish a connection to the database
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    conn4 = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");

                                    // Create a Prepared Statement to execute the SELECT query
                                    String sql = "SELECT * FROM movies";
                                    pstmt4= conn4.prepareStatement(sql);

                                    // Execute the query and store the result set
                                    rs4 = pstmt4.executeQuery();
                                } catch (SQLException se) {
                                    // Handle JDBC errors
                                    se.printStackTrace();
                                } catch (ClassNotFoundException cnfe) {
                                    // Handle ClassNotFoundException
                                    cnfe.printStackTrace();
                                }
                            %>
                            <label for="top_1">Select Top 1 Movie</label>
                            <select name="4_active_movie" id="top_1" class="select">
                                <%
                                    // Iterate through the result set and add the values as option elements to the select tag
                                    while (rs4.next()) {
                                        int id = rs4.getInt("id");
                                        String name = rs4.getString("movie_name");
                                %>
                                <option value="<%= id %>"><%= name %></option>
                                <%
                                    }
                                %>
                            </select><br>
                            <div class="btn">
                                <button type="submit" class="button btn-primary">
                                    <span class="button-text">Set Movies</span>
                                    <span class="button-icon">
                                            <span class="material-icons-outlined">upgrade</span>
                                        </span>
                                </button>
                            </div>
                        </div>
                    </form>

                </div>


            </div>
        </section>

        <!-- Table  Section-->
        <section id="movie_section">
            <div class="main-title">
                <p class="font-weight-bold">Movies</p>
            </div>
            <div class="tble-card">

                <div class="tble-input-text">
                    <h4> Search Movie Using Name :</h4>
                    <div class="input-text">
                        <input type="text" name="user_search">
                        <label placeholder="Search"></label>
                    </div>
                    <div class="table-input-btn">
                        <button type="submit" class="button-update btn-update">
                            <span class="button-text">Search</span>
                            <span class="button-icon">
                                    <span class="material-icons-outlined">search</span>
                                </span>
                        </button>
                    </div>
                    <div class="table-input-btn">
                        <input type="checkbox" class="form-check" id="show">
                        <label for="show" class="button btn-primary">
                            <span class="button-text">Add Movie</span>
                            <span class="button-icon">
                                        <span class="material-icons-outlined">add</span>
                                    </span>

                        </label>
                        <!-- Popup Container -->
                        <div class="popup-container">
                            <form action="../Add_movie" method="post" enctype="multipart/form-data">
                                <label for="show" class="form-close-btn">
                                    <span class="material-icons-outlined ">close</span>
                                </label>
                                <h2 class="text">Add Movie</h2>

                                <div class="data">
                                    <!-- Movie Name -->
                                    <label for="movie_name">Name</label>
                                    <input type="text" name="movie_name" id="movie_name" placeholder="Movie Name">
                                </div>

                                <div class="data">
                                    <!-- Description -->
                                    <label for="description">Description</label>
                                    <input type="text" name="description" id="description" placeholder="Description">
                                </div>

                                <div class="data">
                                    <!-- Short Description -->
                                    <label for="short_description">Short Description</label>
                                    <input type="text" name="short_description" id="short_description" placeholder="Short Description">
                                </div>

                                <div class="data">
                                    <!-- Large banner -->
                                    <label for="large_banner">Large Banner</label> <br>
                                    <input type="file" name="large_banner" id="large_banner">
                                </div>

                                <div class="data">
                                    <!-- Short banner -->
                                    <label for="short_banner">Short Banner</label> <br>
                                    <input type="file" name="short_banner" id="short_banner">
                                </div>

                                <div class="data">
                                    <!-- time -->
                                    <label for="time">Time</label> <br>
                                    <input type="time" name="time" id="time" >
                                </div>

                                <div class="data">
                                    <!-- Type -->
                                    <label for="type">Type</label>
                                    <input type="text" name="type" id="type" placeholder="Type">
                                </div>

                                <div class="data">
                                    <!-- Duration -->
                                    <label for="duration">Duration</label>
                                    <input type="text" name="duration" id="duration"  placeholder="Duration">
                                </div>

                                <div class="data">
                                    <!-- Price -->
                                    <label for="price">Price</label>
                                    <input type="text" name="price" id="price"  placeholder="Price">
                                </div>
                                <center>
                                    <div class="form-btn">
                                        <button type="submit"  class="button btn-primary">
                                            <span class="button-text">Add Movie</span>
                                            <span class="button-icon">
                                                    <span class="material-icons-outlined">file_upload</span>
                                                </span>
                                        </button>
                                    </div>
                                </center>
                            </form>
                        </div>
                    </div>
                </div>


                <div class="inside-table-card">
                    <table class="content-table">
                        <thead>
                        <tr>
                            <th> </th>
                            <th>ID</th>
                            <th>Movie name</th>
                            <th>Description</th>
                            <th>Short Description</th>
                            <th>Large Banner</th>
                            <th>Small Banner</th>
                            <th>Time</th>
                            <th>Type</th>
                            <th>Duration</th>
                            <th>Price</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>

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

                                while (rs.next()) {
                                    int id = rs.getInt("id");
                                    String movie_name = rs.getString("movie_name");
                                    String description = rs.getString("description");
                                    String short_description = rs.getString("short_description");
                                    String large = rs.getString("large_banner");
                                    String small = rs.getString("small_banner");
                                    String time = rs.getString("time");
                                    String type = rs.getString("type");
                                    String duration = rs.getString("duration");
                                    String price = rs.getString("price");
                        %>
                        <tr>
                            <td>
                                <form action="edit_movie.jsp" method="get">
                                    <input type="hidden" name="id" value="<%=id%>">
                                    <button type="submit" class="button-update btn-update">
                                            <span class="button-icon">
                                                <span class="material-icons-outlined">edit</span>
                                            </span>
                                    </button>
                                </form>
                            </td>
                            <td><%=id%></td>
                            <td><%=movie_name%></td>
                            <td><%=description%></td>
                            <td><%=short_description%></td>
                            <td><img src="../image_data/<%=large%>" class="larg-banner">
                                <video class="larg-banner" autoplay muted loop>
                                    <source src=image_data/<%=large%>" type="video/mp4">
                                </video></td>
                            <td><img src="../image_data/<%=small%>" class="small-banner"></td>
                            <td><%=time%></td>
                            <td><%=type%></td>
                            <td><%=duration%></td>
                            <td><%=price%></td>
                            <td><form action="../Delete_movie" method="get">
                                <input type="hidden" name="id" value="<%=id%>">
                                <button type="submit" class="button-delete btn-delete" onclick="checker()">
                                        <span class="button-icon">
                                            <span class="material-icons-outlined">delete</span>
                                        </span>
                                </button>
                            </form></td>
                            <% }
                            } catch (Exception e) {
                                out.println(e);
                            }
                            %>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
        <!-- Payment Section -->
        <section id="payments_section">

            <div class="main-title">
                <p class="font-weight-bold">Payment</p>
            </div>
            <div class="tble-card">

                <div class="tble-input-text">
                    <h4> Search Customer Using Phone Number :</h4>

                    <div class="input-text">
                        <input type="text" name="user_search">
                        <label placeholder="Search"></label>
                    </div>

                    <div class="table-input-btn">
                        <button type="submit" class="button-update btn-update">
                            <span class="button-text">Search</span>
                            <span class="button-icon">
                                        <span class="material-icons-outlined">search</span>
                                    </span>
                        </button>
                    </div>
                </div>


                <div class="inside-table-card">
                    <table class="content-table-payment">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>User Phone Number</th>
                            <th>Seat Index</th>
                            <th>Movie ID</th>
                            <th>Movie Time</th>
                            <th>Movie Date</th>
                            <th>Payment</th>
                            <th>Name</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            Connection con5 = null;
                            PreparedStatement st5 = null;
                            ResultSet rs5 = null;
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con5 = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
                                String sql = "SELECT * FROM seats";
                                st5 = con5.prepareStatement(sql);
                                rs5 = st5.executeQuery();

                                while (rs5.next()) {
                                    int id = rs5.getInt("id");
                                    String userPhoneNumber = rs5.getString("userPhoneNumber");
                                    String seatIndex = rs5.getString("seatIndex");
                                    String movieID = rs5.getString("movieID");
                                    String movieTime = rs5.getString("movieTime");
                                    String movieDate = rs5.getString("movieDate");
                                    String payment = rs5.getString("payment");
                                    String name = rs5.getString("name");
                        %>
                        <tr>
                            <td><%=id%></td>
                            <td><%=userPhoneNumber%></td>
                            <td><%=seatIndex%></td>
                            <td><%=movieID%></td>
                            <td><%=movieTime%></td>
                            <td><%=movieDate%></td>
                            <td><%=payment%></td>
                            <td><%=name%></td>
                        </tr>

                        <% }
                        } catch (Exception e) {
                            out.println(e);
                        }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>

        </section>
    </main>
</div>
<script src="../js/admin_script.js"></script>

</body>
</html>
