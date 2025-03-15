<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12/28/2022
  Time: 9:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Movie</title>
    <link rel="stylesheet" href="../css/admin_edit_movie.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined"
          rel="stylesheet">
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = null;
    PreparedStatement st = null;
    ResultSet rs = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
        String sql = "SELECT * FROM movies WHERE id= ?";
        st = con.prepareStatement(sql);
        st.setInt(1,id);
        rs = st.executeQuery();

        if(rs.next()){
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
<div class="grid-container">
    <main class="main-container">
        <header>Update</header>

        <form action="../Edit_movie_admin" method="get" enctype="multipart/form-data">
            <div class="input-fields">
                <input type="hidden" name="id" value="<%=id%>">
                <!-- Movie Name -->
                <div class="input-data">
                    <label for="name">Movie Name</label>
                    <input type="text" name="name" id="name" required placeholder="Movie Name" value="<%=movie_name%>">
                </div>

                <!-- Description -->
                <div class="input-data">
                    <label for="description">Description</label>
                    <input type="text" name="description" id="description" required placeholder="Description" value="<%=description%>">
                </div>

                <!-- short_description -->
                <div class="input-data">
                    <label for="short_description">Short Description</label>
                    <input type="text" name="short_description" id="short_description" required placeholder="Short Description" value="<%=short_description%>">
                </div>

                <!-- Large Banner -->
                <div class="input-data">
                    <label for="larg_baner">Large Banner</label>
                    <input type="file" name="larg_baner" id="larg_baner" accept="image/*">
                </div>

                <!-- Short Banner -->
                <div class="input-data">
                    <label for="short_banner">Short Banner</label>
                    <input type="file" name="short_banner" id="short_banner">
                </div>

                <!-- Time -->
                <div class="input-data">
                    <label for="time">Time</label>
                    <input type="time" name="time" id="time" required placeholder="Time" value="<%=time%>">
                </div>

                <!-- Type -->
                <div class="input-data">
                    <label for="type">Type</label>
                    <input type="text" name="type" id="type" required placeholder="Type" value="<%=type%>">
                </div>

                <!-- Duration -->
                <div class="input-data">
                    <label for="duration">Duration</label>
                    <input type="text" name="duration" id="duration" required placeholder="Duration" value="<%=duration%>">
                </div>

                <!-- Price -->
                <div class="input-data">
                    <label for="price">Price</label>
                    <input type="text" name="price" id="price" required placeholder="Price" value="<%=price%>">
                </div>
                <div class="btn">
                    <button type="submit" class="button">
                        <span class="button-text">Update</span>
                        <span class="button-icon">
                            <span class="material-icons-outlined">upgrade</span>
                        </span>
                    </button>
                </div>
            </div>
        </form>

    </main>

    <aside class="sidebar">


            <div class="input-fields">
                <header>Preview Update</header>
                <!-- Movie Name -->

                <div class="input-data">
                    <label for="name">Movie Name</label>
                    <p id="outputName"><%=movie_name%></p>
                    <input type="hidden" name="servletOutputName" id="servletMovieName" value="<%=id%>">
                </div>

                <!-- Description -->
                <div class="input-data">
                    <label for="description">Description</label>
                    <p id="outputDescription"><%=description%></p>
                </div>

                <!-- short_description -->
                <div class="input-data">
                    <label for="short_description">Short Description</label>
                    <p id="outputShortDescription"><%=short_description%></p>
                </div>

                <!-- Large Banner -->
                <div class="input-data">
                    <label for="outputLargeBanner">Large Banner</label>
                    <video autoplay muted loop id="outputLargeBanner">
                        <source src="../image_data/<%=large%>">
                    </video>
                </div>

                <!-- Short Banner -->
                <div class="input-data">
                    <label for="outputSmallBanner">Short Banner</label>
                    <center>
                        <img class="small-banner" src="../image_data/<%=small%>" id="outputSmallBanner">
                    </center>

                </div>

                <!-- Time -->
                <div class="input-data">
                    <label for="time">Time</label>
                    <p id="outputTime"><%=time%></p>
                </div>

                <!-- Type -->
                <div class="input-data">
                    <label for="type">Type</label>
                    <p id="outputType"><%=type%></p>
                </div>

                <!-- Duration -->
                <div class="input-data">
                    <label for="duration">Duration</label>
                    <p id="outputDuration"><%=duration%></p>
                </div>

                <!-- Price -->
                <div class="input-data">
                    <label for="price">Price</label>
                    <p id="outputPrice"><%=price%></p>
                </div>

            </div>

    </aside>
</div>
<% }
}catch (Exception e){
    out.print(e);
}finally {
    con.close();
}

%>

<script src="../js/admin_edit.js"></script>

</body>
</html>
