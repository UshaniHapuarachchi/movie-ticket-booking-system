import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "authorize_payment", value = "/authorize_payment")
public class authorize_payment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("hello");
        PrintWriter out = response.getWriter();
        Connection con = null;

        String name = request.getParameter("name");
        int phone_number = Integer.parseInt(request.getParameter("phoneNumber"));

        HttpSession session1 = request.getSession();
        int id = (Integer) session1.getAttribute("id");
        String time = (String)session1.getAttribute("time");
        String date = (String)session1.getAttribute("mDate");
        String[] values = request.getParameter("seats").split(",");
        int[] seats = new int[values.length];
        System.out.println(seats.toString());

        try {
            // load driver and create connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");

            // create prepared statement
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO seats(userPhoneNumber,seatIndex,movieID,movieTime,movieDate,payment,name) VALUES (?,?,?,?,?,?,?)");

            for (int i = 0; i < values.length; i++) {
                seats[i] = Integer.parseInt(values[i]);
                pstmt.setInt(1,phone_number);
                pstmt.setInt(2,seats[i]);
                pstmt.setInt(3,id);
                pstmt.setString(5,date);
                pstmt.setString(4,time);
                pstmt.setString(6,"done");
                pstmt.setString(7,name);
                pstmt.executeUpdate();
            }

            // redirect
            response.sendRedirect("http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/done.jsp");
            pstmt.close(); // close statement
            con.close();  // close connection
        }catch (Exception e){
            out.println(e);
        }



//        try {
//            GMailer.sendMail("supun2001hasanka@gmail.com");
//            out.println("Sent");
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }

//        String price = request.getParameter("price");
//        float priceFloat = Float.parseFloat(price);
//        HttpSession session1 = request.getSession();
//
//        Integer id = (Integer) session1.getAttribute("id");
//        String details = "Buy a seats";
//
//        com.example.abc_cinema_new.OrderDetail orderDetail = new com.example.abc_cinema_new.OrderDetail(id,priceFloat,details);
//
//        try{
//            com.example.abc_cinema_new.paymentService com.example.abc_cinema_new.paymentService = new com.example.abc_cinema_new.paymentService();
//            String apporovalLink = com.example.abc_cinema_new.paymentService.authorizePayment(orderDetail);
//
//            response.sendRedirect(apporovalLink);
//        }catch (PayPalRESTException ex){
//            ex.printStackTrace();
//            request.setAttribute("errorMessage",ex.getMessage());
//            request.getRequestDispatcher("error.jsp").forward(request,response);
//        }

    }
}
