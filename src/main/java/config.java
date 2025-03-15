import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class config {


    Connection con = null;
    PreparedStatement st = null;

    public void setConnection(){

        try{

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = (Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");


            System.out.println("Connection successful");


        }catch (Exception e){
            System.out.println(e);
        }

    }

}
