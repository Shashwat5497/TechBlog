<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<!--this is load post page-->
<head>
    <script src="js/myjavascript.js" type="text/javascript"></script>
</head>
    
<div class="row">

    <%
        Thread.sleep(1000);
        
        User uuu=(User)session.getAttribute("currentUser");

        PostDao dao = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));

        List<Post> list = null;
        if (cid == 0) {
            list = dao.getAllPost();
        } else {
            list = dao.getPostByCatId(cid);
        }

        if (list.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category...</h3>");
            return;
        }
        for (Post p : list) {

    %>



    <div class="col-md-6">
        <div class="card">

            <div class="card-body">
                <img class="card-img-top img-fluid" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap" style="height: 230px;width: 400px;">
                <b><%=p.getpTitle()%></b>
                <p> <%=p.getpContent()%></p>


            </div>
            <div class="card-footer primary-background text-center">

                 <%
                  LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
                           
                  
                  %>
                     
                  <a onclick="doLike(<%=p.getPid() %>,<%=uuu.getId() %>)" class="btn btn-outline-light btn-sm" href="#!"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikeOnPost(p.getPid()) %></span></a>  
                    
                <a class="btn btn-outline-light btn-sm" href="show_post.jsp?pid=<%=p.getPid()%>">Read More</a>  
                <a class="btn btn-outline-light btn-sm" href="#!"><i class="fa fa-commenting-o"></i>29</a>  

            </div>
        </div>

    </div>




    <%
        }
    %>
</div>