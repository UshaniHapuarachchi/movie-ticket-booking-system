import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.*;
import java.nio.file.Paths;
import java.sql.*;

@WebServlet(name = "Edit_movie_admin", value = "/Edit_movie_admin")
@MultipartConfig
public class Edit_movie_admin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String short_description = request.getParameter("short_description");
        String time = request.getParameter("time");
        String type = request.getParameter("type");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");

        PrintWriter out = response.getWriter();
        Connection con = null;
        PreparedStatement statement = null;

        try {
            // Connect to the database
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");

            // Create the UPDATE query string
            String updateSql = "UPDATE movies SET movie_name = ?, description = ?, short_description = ?, time = ?, type = ?, duration = ?, price = ? WHERE id = ?";

            // Create the Prepared Statement object
            statement = con.prepareStatement(updateSql);

            // Set the values of the placeholders
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setString(3, short_description);
            statement.setString(4, time);
            statement.setString(5, type);
            statement.setString(6, duration);
            statement.setString(7, price);
            statement.setInt(8, id);

            // Execute the UPDATE query
            statement.executeUpdate();

            // Handle the file upload
            Part large_banner  = request.getPart("larg_baner");
            String large_banner_fileName = Paths.get(large_banner .getSubmittedFileName()).getFileName().toString();
            InputStream inputStream = large_banner.getInputStream();

            // Check if a file was uploaded
            if (large_banner_fileName != null && !large_banner_fileName.isEmpty()) {
                // Create the file path for the uploaded file
                String filePath = "E:\\Projects\\Java\\abc_cinema_new-1.0-SNAPSHOT\\WebContent\\image_data\\" + large_banner_fileName;

                // Write the input stream to the file
                OutputStream outputStream = new FileOutputStream(filePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }

                // Update the file path in the database
                String updateSql2 = "UPDATE movies SET large_banner = ? WHERE id = ?";
                statement = con.prepareStatement(updateSql2);
                statement.setString(1, filePath);
                statement.setInt(2, id);
                statement.executeUpdate();

                // Close the output stream
                outputStream.close();
            }
            Part small_banner = request.getPart("short_banner");
            String small_banner_fileName = Paths.get(small_banner.getSubmittedFileName()).getFileName().toString();
            InputStream inputStream2 = small_banner.getInputStream();

            // Check if a file was uploaded
            if (small_banner_fileName != null && !small_banner_fileName.isEmpty()) {
                // Create the file path for the uploaded file
                String filePath = "E:\\Projects\\Java\\abc_cinema_new-1.0-SNAPSHOT\\WebContent\\image_data\\" + small_banner_fileName;

                // Write the input stream to the file
                OutputStream outputStream2 = new FileOutputStream(filePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream2.read(bytes)) != -1) {
                    outputStream2.write(bytes, 0, read);
                }

                // Update the file path in the database
                String updateSql3 = "UPDATE movies SET small_banner = ? WHERE id = ?";
                statement = con.prepareStatement(updateSql3);
                statement.setString(1, filePath);
                statement.setInt(2, id);
                statement.executeUpdate();

                // Close the output stream
                outputStream2.close();
            }

            // Redirect to the movie list page
            response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/Admin/admin_index.jsp");
        } catch (SQLException se) {
            // Handle errors for JDBC
            response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/Admin/admin_index.jsp");
        } catch (Exception e) {
            // Handle errors for Class.forName
            response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/Admin/admin_index.jsp");
        } finally {
            // Finally block used to close resources
            try {
                if (statement != null) statement.close();
            } catch (SQLException se2) {
                // Do nothing
            }
            try {
                if (con != null) con.close();
            } catch (SQLException se) {
                response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/Admin/admin_index.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
