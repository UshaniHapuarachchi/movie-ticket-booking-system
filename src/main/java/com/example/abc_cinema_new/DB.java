package com.example.abc_cinema_new;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

public class DB {
    Connection con = null;
    public DB() throws ClassNotFoundException, SQLException {

        Class.forName("com.mysql.cj.jdbc.Driver");
        con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema","root","");
    }
    public void update(String id){

        try{
            String query = "update seats set payment= 'done' where id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString   (1, id);


            // execute the java preparedstatement
            preparedStmt.executeUpdate();
            out.println("updated...........");

            con.close();
        }catch (Exception e)
        {
            System.err.println(e);

        }

    }
}
