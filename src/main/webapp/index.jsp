<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page import="java.io.*" %>
<%@ page import="com.example.abc_cinema_new.SendMail" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/index.css">
    <title>ABC Cinema</title>
</head>
<body>

<%

    Connection con = null;
    PreparedStatement st = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
        String sql = "SELECT * FROM top_movie";
        st = con.prepareStatement(sql);
        rs = st.executeQuery();

        if (rs.next()) {
            String movie_des_1 = rs.getString("movie_des_1");
            String movie_banner_1 = rs.getString("movie_banner_1");
            String movie_des_2 = rs.getString("movie_des_2");
            String movie_banner_2 = rs.getString("movie_banner_2");
            String movie_des_3 = rs.getString("movie_des_3");
            String movie_banner_3 = rs.getString("movie_banner_3");
            String movie_des_4 = rs.getString("movie_des_4");
            String movie_banner_4 = rs.getString("movie_banner_4");
            String movie_name_1 = rs.getString("movie_name_1");
            String movie_name_2 = rs.getString("movie_name_2");
            String movie_name_3 = rs.getString("movie_name_3");
            String movie_name_4 = rs.getString("movie_name_4");

            %>

<%--                Small : <img src="image_data/<%=large%>">--%>
<%--                Large : <img src="image_data/<%=small%>">--%>

<header>
    <a href="#" class="brand">ABC CINEMA</a>
    <div class="menu-btn"></div>
    <div class="navigation">
        <div class="navigation-items">
            <a href="index.jsp">Home</a>
            <a href="movies.jsp">Movies</a>
            <a href="#">Login</a>
        </div>
    </div>
</header>

<section class="home">
    <video class="video-slide active" src="image_data/<%=movie_banner_1%>" autoplay muted loop></video>
    <video class="video-slide" src="image_data/<%=movie_banner_2%>" autoplay muted loop></video>
    <video class="video-slide" src="image_data/<%=movie_banner_3%>" autoplay muted loop></video>
    <video class="video-slide" src="image_data/<%=movie_banner_4%>" autoplay muted loop></video>
    <div class="content active">
        <h1><%=movie_name_1%></h1>
        <p><%=movie_des_1%></p>
        <a href="movies.jsp">Read More</a>
    </div>
    <div class="content">
        <h1><%=movie_name_2%></h1>
        <p><%=movie_des_2%></p>
        <a href="#">Read More</a>
    </div>
    <div class="content">
        <h1><%=movie_name_3%></h1>
        <p><%=movie_des_3%></p>
        <a href="#">Read More</a>
    </div>
    <div class="content">
        <h1><%=movie_name_4%></h1>
        <p><%=movie_des_4%></p>
        <a href="#">Read More</a>
    </div>
    <div class="media-icons">
        <a href="#"><i class="fab fa-facebook-f"></i></a>
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-twitter"></i></a>
    </div>
    <div class="slider-navigation">
        <div class="nav-btn active"></div>
        <div class="nav-btn"></div>
        <div class="nav-btn"></div>
        <div class="nav-btn"></div>
    </div>
</section>
<% }
} catch (Exception e) {
    out.println(e);
}
%>


<section class="about" id="about">
    <div class="about-text">
        <h3>It's more than just a movie..</h3>
        <h2>Welcome to ABC Cinema</h2>
        <p>At ABC, we strive to provide an easy and convenient way for movie-goers to purchase tickets and plan their movie-watching
            experience. Our website offers a user-friendly platform where users can search for movies, view showtimes and
            select seats, and purchase tickets all in one place.We believe in providing the best customer service and ensuring
            that our users have a seamless and enjoyable experience. Our website is regularly updated with the latest movies,
            showtimes, and offers, so that users can stay up to date with what's playing at our theater.</p>
    </div>
    <div class="about-img">
        <img src="img/cinema.jpg" alt="">
    </div>
</section>


<!--------contact---->
<section class="contact" id="contact">

    <div class="center">
        <h3>Any questions?</h3>
        <p>Send us an email.</p>
    </div>
    <div class="action">
        <form action="" method="post">
            <input type="email" placeholder="Email">
            <input type="submit" value="send">
        </form>
    </div>
    <div class="media-icons">
        <h4>Follow us</h4>
        <div class="icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>

    </div>
    <div class="number">
        <h4>Call us</h4>
        <p>+94 123 456 7890</p>
    </div>



</section>


<script type="text/javascript">
    //Javacript for responsive navigation menu
    const menuBtn = document.querySelector(".menu-btn");
    const navigation = document.querySelector(".navigation");

    menuBtn.addEventListener("click", () => {
        menuBtn.classList.toggle("active");
        navigation.classList.toggle("active");
    });

    //Javacript for video slider navigation
    const btns = document.querySelectorAll(".nav-btn");
    const slides = document.querySelectorAll(".video-slide");
    const contents = document.querySelectorAll(".content");

    var sliderNav = function(manual){
        btns.forEach((btn) => {
            btn.classList.remove("active");
        });

        slides.forEach((slide) => {
            slide.classList.remove("active");
        });

        contents.forEach((content) => {
            content.classList.remove("active");
        });

        btns[manual].classList.add("active");
        slides[manual].classList.add("active");
        contents[manual].classList.add("active");
    }

    btns.forEach((btn, i) => {
        btn.addEventListener("click", () => {
            sliderNav(i);
        });
    });
</script>

</body>
</html>