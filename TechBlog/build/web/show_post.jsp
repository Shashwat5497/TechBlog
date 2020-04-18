<%-- 
    Document   : show_post
    Created on : 14 Apr, 2020, 11:12:14 PM
    Author     : shash
--%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%

     User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }


   int post_id=Integer.parseInt(request.getParameter("pid"));
   PostDao dao=new PostDao(ConnectionProvider.getConnection());
    Post post=dao.getPostByPostId(post_id);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v6.0"></script>
         
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=post.getpTitle() %> || TechBlog By Shashwat</title>
         <!--css-->
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
            .post-title{
                font-weight: 100; 
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-code{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
                font-weight: 150;
                font-style: bold;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
            body{
                background: url(img/back.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>

    </head>
    <body> <!--navbar-->
    <head>

        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"><span class="fa fa-bell-o"></span>LearnCode With Shashwat <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span>Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language</a>
                        <a class="dropdown-item" href="#">Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structers</a>
                    </div>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-Modal"><span class="fa fa-asterisk"></span>&nbsp;Do Post</a>
                </li>


                </li>
                <!--      <li class="nav-item">
                        <a class="nav-link disabled" href="#">More</a>
                      </li>-->
            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#"  data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle "></span>&nbsp;<%=user.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogOutServlet"><span class="fa fa-power-off"></span>Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <!--end navbar-->
    
    
    
    
    
    
    <!--main cotent of body-->
    <div class="container">
        
        <div class="row my-4">
        
            <div class="col-md-6 offset-md-2">
            
                <div class="card">
                
                    <div class="card-header primary-background text-white">
                    <h4 class="post-title"><%=post.getpTitle() %></h4>
                </div>
                
                <div class="card-body">
                
                    <img class="card-img-top my-2" src="blog_pics/<%=post.getpPic()%>" alt="Card image cap" style="height: 230px;width: 400px;">
                 
                     <div class="row my-3 row-user">
                         
                         <div class="col-md-7">
                            
                             <%    UserDao userDao=new UserDao(ConnectionProvider.getConnection());   %>
                             
                             <p class="post-user-info">
                                 <a href="#!"><%=userDao.getUserByUserId(post.getUid()).getName() %>
                                 </a> has posted.
                             </p>
                         </div>
                                 
                         <div class="col-md-5">
                             <p class="post-date"><%=DateFormat.getDateTimeInstance().format(post.getpDate()) %></p>
                         </div>
                     </div>
                     
                     
                    <p class="post-content"><%=post.getpContent() %></p>
                    
                    <br><br>
                    
                    <div class="post-code">
                    
                        <pre><%=post.getpCode() %></pre>
                    
                    </div>
                
                </div>
              
                  <div class="card-footer primary-background ">
                  <%
                  LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
                  %>
                     
                  <a onclick="doLike(<%=post.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm" href="#!">
                      <i class="fa fa-thumbs-o-up"></i>
                      <span class="like-counter"><%=ldao.countLikeOnPost(post.getPid()) %></span>
                  </a>  
                   
                    
                     
                </div>
                  <div class="card-footer primary-background ">
                      <div class="fb-comments" data-href="http://localhost:9494/TechBlog/show_post.jsp?pid=<%=post.getPid() %>" data-width="" data-numposts="5"></div>
                  </div>
                </div>
            
            </div>
            
        </div>
        
    </div>
    <!--end of main content of body-->
    
    
    
    
    
    
    
    
     <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white text-center">
                    <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="pics/<%=user.getProfile() %>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                        <br>
                        <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>

                        <!--detailt-->
                        <div id="profile-detail">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%=user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><%=user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <td><%=user.getGender().toUpperCase()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">About</th>
                                        <td><%= user.getAbout()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Registered On</th>
                                        <td><%=user.getDateTime().toString()%></td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!--profile edit-->

                        <div id="profile-edit" style="display: none;">

                            <h3 class ="mt-2">Please Edit Carefully</h3>
                            <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <td>ID:</td>
                                        <td><%=user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="email" name="user_email" value="<%=user.getEmail()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Name:</td>
                                        <td><input type="text" name="user_name" value="<%=user.getName()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Password:</td>
                                        <td><input type="password" name="user_password" value="<%=user.getPassword()%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Gender:</td>
                                        <td><%=user.getGender().toUpperCase()%></td>
                                    </tr>
                                    <tr>
                                        <td>About:</td>
                                        <td>
                                            <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                            </textarea>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>New Profile:</td>
                                        <td><input type="file" name="image" class="form-control"></td>
                                    </tr>


                                </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>
                        </div>



                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-profile-btn"  type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>
    <!--end of profile modal-->        



    <!--add post modal-->




    <!-- Modal -->
    <div class="modal fade" id="add-post-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="add-post-form" action="AddPostServlet" method="POST">
                        <div class="form-group">
                            <select class="form-control" name="cid">
                                <option selected disabled>---Select Category---</option>
                                <%
                                   // PostDao dao = new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = dao.getAllCategories();
                                    for (Category c : list) {

                                %>
                                <option value="<%=c.getCid()%>" name="cid"><%=c.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Enter post title"  class="form-control">
                        </div>
                        <div class="form-group">
                            <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                        </div>
                        <div class="form-group">
                            <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program(if any)"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Select your pic..</label><br>
                            <input type="file" name="pic">
                        </div>
                        <div class="container text-center">
                            <button type="submit">Post</button>
                        </div>
                    </form>


                </div>

            </div>
        </div>
    </div>
    <!--end of post modal-->
    
    
    
    
    
    
    



    <!--javascripts-->
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/myjavascript.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
          $(document).ready(function () {
              
            let editStatus = false;


            $('#edit-profile-btn').click(function () {
                if (editStatus == false)
                {
                    $('#profile-detail').hide();
                    $('#profile-edit').show();

                    editStatus = true;

                    $(this).text("Back");
                } else
                {
                    $('#profile-detail').show();
                    $('#profile-edit').hide();

                    editStatus = false;
                    $(this).text("Edit");
                }
            });
        });
    </script>


    <!--now add post js-->

    <script>

        $(document).ready(function (e) {
            $("#add-post-form").on("submit", function (event) {
                //this code gets called when for is submitted
                event.preventDefault();
                console.log("you submitted");
                let form = new FormData(this);

                // now requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: "POST",
                    data: form,
                    success: function (data, textStatus, jqHXR)
                    {
                        console.log(data);
                        if (data.trim() === "done")
                        {
                            swal("Good Job", "Saved Successfully", "success");
                        }
                    },
                    error: function (jqHXR, textStatus, errorThrown)
                    {
                        swal("Error!!", "Something went wrong", "error");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });

    </script>

    

    </body>
</html>
