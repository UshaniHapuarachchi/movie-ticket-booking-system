import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "Top_movies", value = "/Top_movies")
public class Top_movies extends HttpServlet {
    private static final String QUERY = "SELECT * FROM movies WHERE id = ?";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        ResultSet rs = null;

        int movie_1 = Integer.parseInt(request.getParameter("1_active_movie"));
        int movie_2 = Integer.parseInt(request.getParameter("2_active_movie"));
        int movie_3 = Integer.parseInt(request.getParameter("3_active_movie"));
        int movie_4 = Integer.parseInt(request.getParameter("4_active_movie"));

        out.println(movie_1);
        out.println(movie_2);
        out.println(movie_3);
        out.println(movie_4);

        int[] ids = {movie_1,movie_2,movie_3,movie_4};
        int[] bannerName = {1,2,3,4};
        int[] desName = {1,2,3,4};
        int[] movieName = {1,2,3,4};

        config config = new config();
        config.setConnection();
        try{
            for (int i=0;i<4;i++){
                config.st = config.con.prepareStatement(QUERY);
                config.st.setInt(1,ids[i]);
                rs = config.st.executeQuery();
                while (rs.next()) {
                    String movie_name = rs.getString("movie_name");
                    String largeBanner = rs.getString("large_banner");
                    String shortDescription = rs.getString("short_description");

                    PreparedStatement updateStmt = config.con.prepareStatement("Update top_movie set movie_des_"+desName[i]+" = ?, movie_banner_"+bannerName[i]+"= ?,movie_name_"+movieName[i]+"=? where id = ?");


                    updateStmt.setString(1,shortDescription);
                    updateStmt.setString(2,largeBanner);
                    updateStmt.setString(3,movie_name);
                    updateStmt.setInt(4,1);
                    updateStmt.executeUpdate();
                }

            }
            response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/Admin/admin_index.jsp");

        }catch (Exception e){
            out.println(e);
        }

//        String movie_1_img = "SELECT large_banner,short_description FROM movies WHERE id = ?";
//        config.st = config.con.prepareStatement(movie_1_img);

//        try {
//            String quary = "UPDATE top_movie SET movie_1=?,movie_2=?,movie_3=?,movie_4=? WHERE id=?";
//            config.st = config.con.prepareStatement(quary);
//            config.st.setString(1,movie_1);
//            config.st.setString(2,movie_2);
//            config.st.setString(3,movie_3);
//            config.st.setString(4,movie_4);
//            config.st.setInt(5,1);
//            config.st.executeUpdate();
//
//            out.println("Done");
////            response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/Admin/admin_index.jsp");
//
//        }catch (Exception e){
//            out.println(e);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
