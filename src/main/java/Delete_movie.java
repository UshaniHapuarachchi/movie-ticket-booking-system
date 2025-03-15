import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;
import java.io.PrintWriter;

@WebServlet(name = "Delete_movie", value = "/Delete_movie")
public class Delete_movie extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter();


        try {
            config config = new config();
            config.setConnection();

            String query = "DELETE FROM movies WHERE id = ?";
            config.st = config.con.prepareStatement(query);
            config.st.setInt(1,id);
            config.st.executeUpdate();

            response.sendRedirect("Admin/admin_index.jsp");


        }catch (Exception e){
            out.println(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
