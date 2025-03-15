import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.*;
import java.nio.file.Paths;
import java.sql.*;

@WebServlet(name = "Add_movie", value = "/Add_movie")
@MultipartConfig
public class Add_movie extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection con = null;
        Statement st = null;
        PrintWriter out = response.getWriter();

        String movie_name = request.getParameter("movie_name");
        String description = request.getParameter("description");
        String short_description = request.getParameter("short_description");
        String time = request.getParameter("time");
        String type = request.getParameter("type");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");
        Part large_banner  = request.getPart("large_banner");
        //Image

            String large_banner_fileName = Paths.get(large_banner .getSubmittedFileName()).getFileName().toString();
            InputStream inputStream = large_banner.getInputStream();
            OutputStream outputStream = new FileOutputStream("E:\\Projects\\Java\\abc_cinema_new\\src\\main\\webapp\\image_data\\"+large_banner_fileName);
            byte[] buffer = new byte[4096];
            int byteRead;
            try{
                while ((byteRead=inputStream.read(buffer)) != -1){
                    outputStream.write(buffer,0,byteRead);
                }
            } catch (IOException e){
                out.println(e);
            } finally {
                inputStream.close();
                outputStream.close();
            }

        Part short_banner  = request.getPart("short_banner");
        String short_banner_fileName = Paths.get(short_banner.getSubmittedFileName()).getFileName().toString();
        InputStream inputStream2 = short_banner.getInputStream();
        OutputStream outputStream2 = new FileOutputStream("E:\\Projects\\Java\\abc_cinema_new\\src\\main\\webapp\\image_data\\"+short_banner_fileName);
        byte[] buffer2 = new byte[4096];
        int byteRead2;

        try{
            while ((byteRead2=inputStream2.read(buffer2)) != -1){
                outputStream2.write(buffer2,0,byteRead2);
            }
        }catch (IOException e){
            out.println(e);
        }

        outputStream2.close();


        out.println(short_banner_fileName);

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
            st = con.createStatement();

            PreparedStatement pstmt = con.prepareStatement("INSERT INTO movies(movie_name, description, short_description, large_banner, small_banner, time, type, duration, price) VALUES (?,?,?,?,?,?,?,?,?)");

            pstmt.setString(1,movie_name);
            pstmt.setString(2,description);
            pstmt.setString(3,short_description);
            pstmt.setString(4,large_banner_fileName);
            pstmt.setString(5,short_banner_fileName);
            pstmt.setString(6,time);
            pstmt.setString(7,type);
            pstmt.setString(8,duration);
            pstmt.setString(9,price);
            pstmt.executeUpdate();

            response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/Admin/admin_index.jsp");

        }catch (Exception e){
            out.println(e);
        }

    }
}
