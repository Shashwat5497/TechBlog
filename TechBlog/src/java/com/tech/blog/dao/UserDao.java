package com.tech.blog.dao;
import com.tech.blog.entities.User;
import java.sql.*;
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    // to insert user datat to DB
    
    public boolean saveUser(User user)
    {
         boolean flag=false;
        try
        {
            // user ->DB
           
            
            String query="insert into user_(name,email,password,gender,about) value(?,?,?,?,?)";
            PreparedStatement stmt=this.con.prepareStatement(query);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getGender());
            stmt.setString(5, user.getAbout());
            
            stmt.executeUpdate();
            
            flag=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return flag;
    }
    
//    get user by email and password
    
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        
        try{
            String query="select * from user_ where email=? and password=?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1,email);
            stmt.setString(2,password);
            
            ResultSet  set=stmt.executeQuery();
            if(set.next())
            {
                user=new User();
                
                String name=set.getString("name");    // data from DB
                user.setName(name);                   // set to user object
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user;
    }
    
    
    public boolean updateUser(User user)
    {
        boolean flag=false;
        try
        {
            String query="update user_ set name=? , email=? , password=? ,gender=?, about=?, profile=? where id=?";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1,user.getName());
            p.setString(2,user.getEmail());
            p.setString(3,user.getPassword());
            p.setString(4,user.getGender());
            p.setString(5,user.getAbout());
            p.setString(6,user.getProfile());
            p.setInt(7,user.getId());
            
            p.executeUpdate();
            flag=true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return flag;
    }
    public User getUserByUserId(int userId){
        User user=null;
        try
        {
        String q="select * from user_ where id=?";
        PreparedStatement ps=this.con.prepareStatement(q);
        ps.setInt(1,userId);
        ResultSet set=ps.executeQuery();
        if(set.next())
        {
           
                user=new User();
                String name=set.getString("name");    // data from DB
                user.setName(name);                   // set to user object
                
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return user;
    }    
}
