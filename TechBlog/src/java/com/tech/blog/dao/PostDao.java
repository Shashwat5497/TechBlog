/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author shash
 */
public class PostDao {
    
   Connection con;    

    public PostDao(Connection con) {
        this.con = con;
    }

   public ArrayList<Category> getAllCategories()
   {
       ArrayList<Category> list=new ArrayList<>();
       try
       {
           String q="select * from categories";
           Statement s=con.createStatement();
           ResultSet set=s.executeQuery(q);
           while(set.next())
           {
               int cid=set.getInt("cid");
               String name=set.getString("name");
               String description=set.getString("description");
               Category c=new Category(cid,name,description);
               list.add(c);
           }
                   
                   
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return list;
   }
   
   public boolean savePost(Post p)
   {
      boolean flag=false;
      try {
          String q="insert into post(pTitle,pContent,pCode,pPic,cid,uid) values(?,?,?,?,?,?)";
          PreparedStatement pstmt=con.prepareStatement(q);
          pstmt.setString(1, p.getpTitle());
          pstmt.setString(2, p.getpContent());
          pstmt.setString(3, p.getpCode());
          pstmt.setString(4, p.getpPic());
          pstmt.setInt(5, p.getCid());
          pstmt.setInt(6, p.getUid());
          
          pstmt.executeUpdate();
          flag=true;
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      return flag;
   }
   
//   getPostAll
   public List<Post> getAllPost()
   {
       List<Post> list=new ArrayList<>();
       
       //fetch aal post
       
       try
       {
           String q="select * from post order by pid desc";
             PreparedStatement s=con.prepareStatement(q);
           
           ResultSet set=s.executeQuery(q);
           while(set.next())
           {
               int pid=set.getInt("pid");
               String pTitle=set.getString("pTitle");
               String pContent=set.getString("pContent");
               String pCode=set.getString("pCode");
               String pPic=set.getString("pPic");
               Timestamp date=set.getTimestamp("pDate");
               int catid=set.getInt("cid");
               int uid=set.getInt("uid");
               Post p=new Post(pid, uid, catid, pTitle, pContent, pCode, pPic, date);
               list.add(p);
           }
           
           
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       
       return list;
   }
   
   public List<Post> getPostByCatId(int catId)
   {
       List<Post> list=new ArrayList<>();
       
       //       get all post by id
       
         try
       {
           PreparedStatement p = con.prepareStatement("select * from post where cid=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
          
           while(set.next())
           {
               int pid=set.getInt("pid");
               String pTitle=set.getString("pTitle");
               String pContent=set.getString("pContent");
               String pCode=set.getString("pCode");
               String pPic=set.getString("pPic");
               Timestamp date=set.getTimestamp("pDate");
              
               int uid=set.getInt("uid");
               Post pp=new Post(pid, uid, catId, pTitle, pContent, pCode, pPic, date);
               list.add(pp);
           }
           
           
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       
       return list;
       
   }
   
   public Post getPostByPostId(int pid)
   {
       Post post=null;
       String q="select * from post where pid='"+pid+"'";
       try
       {
           PreparedStatement p=this.con.prepareStatement(q);
           ResultSet set=p.executeQuery();
           if(set.next())
           {
               int postId=set.getInt("pid");
               String pTitle=set.getString("pTitle");
               String pContent=set.getString("pContent");
               String pCode=set.getString("pCode");
               String pPic=set.getString("pPic");
               Timestamp date=set.getTimestamp("pDate");
                int cid=set.getInt("cid");
               int uid=set.getInt("uid");
               post=new Post(postId, uid, cid, pTitle, pContent, pCode, pPic, date);
               
           }
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
       return post;
   }
    
}
