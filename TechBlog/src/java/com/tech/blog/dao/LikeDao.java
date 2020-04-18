/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import java.sql.*;

/**
 *
 * @author shash
 */
public class LikeDao {
   Connection con;    

    public LikeDao(Connection con) {
        this.con = con;
    }
    public boolean insertLike(int pid,int uid){
        boolean flag=false;
        try{
            String q="insert into postlike(pid,uid) values(?,?)";
            PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1,pid);
            ps.setInt(2,uid);
            ps.executeUpdate();
            flag=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return flag;
        
    }
    
    public int countLikeOnPost(int pid)
    {
        int count=0;
        try
        {
        String q="select count(*) from postlike where pid=?";
        PreparedStatement ps=this.con.prepareStatement(q);
            ps.setInt(1,pid);
            ResultSet set=ps.executeQuery();
            if(set.next())
            {
                count=set.getInt(1);
            }
         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return count;
    }
    public boolean isLikedByUser(int pid,int uid)
    {
        boolean flag=false;
        try
        {
            PreparedStatement ps=con.prepareStatement("select * from postlike where pid=? and uid=?");
            ps.setInt(1,pid);
            ps.setInt(2,uid);
            ResultSet set=ps.executeQuery();
            if(set.next())
            {
                flag=true;
            }
        }
         catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return flag;
    }
    public boolean deleteLike(int pid,int uid)
    {
        boolean flag=false;
        try
        {
            PreparedStatement ps=con.prepareStatement("delete from postlike where pid=? and uid=?");
            ps.setInt(1,pid);
            ps.setInt(2,uid);
            ps.executeUpdate();
            flag=true;
            
        }
         catch(Exception e)
        {
            e.printStackTrace();
        }
        return flag;
    }
}

























