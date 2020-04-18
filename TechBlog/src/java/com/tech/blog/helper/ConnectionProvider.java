

package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
            if(con == null)
            {
            // driver class
            Class.forName("com.mysql.jdbc.Driver");
            //create a connection 
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/TechBlog","root","");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
}
