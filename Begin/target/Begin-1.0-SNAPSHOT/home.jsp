<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.priyam.Comment,com.priyam.User,com.priyam.UserDetails,java.io.File,java.util.Date,java.text.SimpleDateFormat,com.priyam.Post,java.util.ArrayList,com.priyam.DBUtil,jakarta.annotation.Resource,javax.sql.DataSource"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <style>
            .collup {
                margin-top:20px;
            }
            .scrolling {
                height:500px;
                overflow-y: auto;
            }
            body {
                background-image: url("images/bg.jpg");
                background-size: cover;
            }
            nav{
                opacity: 0.85;
            }
            nav:hover{
                opacity: 1.0;
            }
            div.card {
                opacity: 0.85;
            }
            div.card:hover{
                opacity: 1.0;
            }
            /* width */
            ::-webkit-scrollbar {
                width: 10px;
            }
            ::-webkit-scrollbar-track {
                -webkit-box-shadow: inset 0 0 6px grey;
                border-radius: 10px;
            }
            ::-webkit-scrollbar-thumb {
                border-radius: 10px;
                -webkit-box-shadow: inset 0 0 6px grey;
            }
            /* Set a style for all buttons */
            button {
                background-color: #04AA6D;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            button:hover {
                opacity: 0.8;
                border-radius: 50px;
                cursor: pointer;
            }
            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }
            scroll {
                height: 50px;
                overflow: auto;
            }
            li.nav-item {
                padding-right: 30px;
            }
        </style>
        <title>Home</title>
    </head>
    <%!
    @Resource(name="jdbc/sgusocial")
    private DataSource dataSource;
    %>

    <body class="bg-light text-dark" >

        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
        <%
        User user = (User)session.getAttribute("user");
        String ver=(String)session.getAttribute("verification");
        String name=null;
        if(user==null||ver==null|| (ver!=null&&!ver.equals("y"))){
                response.sendRedirect("login.jsp");
        }
        else{
                name=user.getName();	
        %>
    <nav class="navbar navbar-dark navbar-expand-md fixed-top bg-primary">
        <a class="navbar-brand bg-primary text-white" href="home.jsp">SGUSocial</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a style="border-radius: 25px;" class="nav-link fas fa-home btn btn-primary" href=<%= "home.jsp?" %>>Home</a>
                </li>
                <li class="nav-item">
                    <a style="border-radius: 25px;" class="nav-link fas fa-user-circle btn btn-primary" href=<%= "profile.jsp?email="+user.getEmail() %>> Profile</a>
                </li>
                <li class="nav-item">
                    <a style="border-radius: 25px;" class="nav-link fas fa-search btn btn-primary" href="finder.jsp"> Finder</a>
                </li>
                <li class="nav-item">
                    <a style="border-radius: 25px;" class="nav-link fas fa-user-friends btn btn-primary" href="suggestions.jsp"> Suggestions</a>
                </li>    
                <li class="nav-item">
                    <a style="border-radius: 25px;" class="nav-link fas fa-power-off btn btn-primary" data-toggle="modal" data-target="#myModal" href="#">Logout</a>
                </li>
            </ul>
        </div>  
    </nav> 
    <div class="modal fade" id="myModal" style="opacity: 1.0;" >
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Logout</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    Do you want to logout?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <a style="border-radius: 25px;" class="text-white btn btn-danger" href=<%= "ValidateServlet?validate=logout" %>  >Logout</a>
                </div>

            </div>
        </div>
    </div>
    <div class="container-fluid" style="margin-top:80px" >
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6">
                <div class="container-fluid card" style="border-radius: 30px;" >
                    <div class="card-body">
                        <form action="ServicesServlet">
                            <div class="form-group">
                                <h4><label for="message">Post something:</label></h4>
                                <textarea placeholder="How you feel today..." name="message" class="form-control" rows="5" id="comment" required></textarea>
                            </div>
                            <input type="hidden" name="page" value="home" />
                            <button style="border-radius: 50px;" type="submit" name="service" value="Post" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </div>
        </div>

        <div class="container-fluid collup" >
            <h4 class="text-white" >Feeds :</h4>
            <div class="scrolling" >
                <%                
                ArrayList<Post> posts=DBUtil.getAllPosts(dataSource, user.getEmail());
               
//                ArrayList<Post> postid=DBUtil.getAllPostById(dataSource); 
                if(posts!=null){
                for(int i=0;i<posts.size();i++){
                        Post curpost=posts.get(i);
                        System.out.println("Post ID: "+curpost.getId());
                        ArrayList<Comment> commentList = new ArrayList<Comment>();
                        ArrayList<Comment> comments=DBUtil.getAllComments(dataSource, curpost.getId());
                        int totalComments = comments.size();
                        User curuser=DBUtil.getUserDetails(dataSource, curpost.getEmail());
                        boolean isLiked=DBUtil.isLiked(dataSource, curpost.getId(), user.getEmail());
                        String format=new SimpleDateFormat("dd-MM-yyyy").format(curpost.getDate());
                        String liking=(isLiked)?"Unlike":"Like";
                        String time = curpost.getTime();
                        UserDetails details=DBUtil.getUserDetails2(dataSource, curuser.getEmail());
                        if(details!=null){
                                //System.out.println(details.getProf_pic_path());
                                if(details.getProf_pic_path()==null){
                                        details.setProf_pic_path("images/image.png");
                                }
                                else{
                                        String path=details.getProf_pic_path();
                                        path=path.substring(path.lastIndexOf('/')+1);
                                        path = request.getServletContext().getRealPath("")+"images/"+path;
                                        File f=new File(path);
                                        if(!f.exists()){
                                                details.setProf_pic_path("images/image.png");	
                                        }
                                }
                        }
                        ArrayList<String> likers=curpost.getLikers();
                        ArrayList<User> users=new ArrayList<User>();
                        ArrayList<UserDetails> usersdetails=new ArrayList<UserDetails>();
                        for(String u: likers){
                                users.add(DBUtil.getUserDetails(dataSource, u));
                                usersdetails.add(DBUtil.getUserDetails2(dataSource, u));
                        }
                        
                        
                %>
                <div class="card collup" style="border-radius: 30px;">
                    <div class="card-header">
                        <div class="row">
                            <div class="col-sm-1" align="left">
                                <img src= <%= (details!=null)?details.getProf_pic_path():"images/image.png" %> class="rounded-circle" alt="Profile pic" width="25" height="25" >
                            </div>
                            <div class="col-sm-2" align="left">
                                <h6><a href= <%= "profile.jsp?email="+curpost.getEmail() %> > <%= curuser.getName() %></a></h6>
                            </div>
                            <div class="col-sm-9" align="right">
                                <h6>Date: <%= format%></h6>
                                <h6>Time <%= time%></h6>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <i><%= curpost.getMessage() %></i>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm" >
                                <form action="ServicesServlet">
                                    <input type="hidden" name="message" value=<%= curpost.getMessage() %> />
                                    <input type="hidden" name="id" value=<%= curpost.getId() %> />
                                    <input type="hidden" name="page" value="home" />
                                    <input type="hidden" name="email" value=<%= curpost.getEmail() %> />
                                    <input type="hidden" name="likes" value=<%= curpost.getLikes() %> />
                                    <input type="hidden" name="active" value=<%= curpost.isActive() %> />
                                    <h6 style="display:flex"><button style="border-radius: 50px;" type="submit" name="service" value="<%= liking %>" class="btn btn-primary"><%= liking %>  <i class="fas fa-thumbs-up"></i></button>
                                        <span style="border-radius: 50px;line-height: 40px;cursor: pointer;" class="badge badge-dark btn " data-toggle="modal" data-target=<%= "#postLikes"+i %> > <%=curpost.getLikes()%> likes </span></h6>
                                    <div style="display:flex;" class="enterComment">
                                        <input type="hidden" name="dest" value=<%= curpost.getId() %> >
                                        <input  type="text" name="comment" placeholder="Please enter your comments"> 
                                        <button style="flex:1;" type="submit" name="service" value="Comments" class="btn">Submit</button>
                                    </div>
                                    <button style="font-size: 15px;" type="button" class="btn btn-primary badge badge-dark btn" data-toggle="modal" data-target=<%= "#staticBackdrop"+i %>><span style="border-radius: 50px;" class="badge badge-dark btn " data-toggle="modal" data-target=<%= "#totalComments" %> > <%=totalComments%> </span>Comments</button>

                                </form>
                            </div>
                            <%
                            if(user.getEmail().equals(curpost.getEmail())){
                            %>
                            <div class="col-sm" align="right">
                                <form action="ServicesServlet">
                                    <input type="hidden" name="message" value=<%= curpost.getMessage() %> />
                                    <input type="hidden" name="id" value=<%= curpost.getId() %> />
                                    <input type="hidden" name="email" value=<%= curpost.getEmail() %> />
                                    <input type="hidden" name="page" value="home" />
                                    <button style="border-radius: 50px;" type="submit" name="service" value="Remove" class="btn btn-primary">Remove</button>
                                </form>
                            </div>	
                            <%
	}%>

                        </div>
                    </div></div>
                <!-- Modal Comment-->
                <div class="modal fade" id=<%= "staticBackdrop"+i %> style="opacity: 1.0;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Comments</h1>
                                <button style="width: 10%;" type="button" class="close" data-dismiss="modal" >&times;</button>
                            </div>
                            <div class="modal-body">
                                <%
                                       int commentCount = 0;
                                       if (comments != null && !comments.isEmpty()) {
                                           System.out.println("Comments size 286 :   " +comments.size());
                                           for(int c=0;c<comments.size();c++){
                                               Comment cm=comments.get(c);
                                               commentList.add(cm);
                                             }
                                       } else {
                                               Comment emptyComment = new Comment();
   //                                            emptyComment.setPostId("");
                                               emptyComment.setComment("No Comments");
                                               commentList.add(emptyComment);
                                       }
                                %>
                                <div class="formComment" style="background-color: darkgray;width: 29.5em;height:9.5em;overflow: auto;">
                                    <div class="formCm" style="background-color: darkseagreen;border: 2px solid darkslategray;padding: 0.5em;margin-bottom: 5px;">
                                        <%  
                                            System.out.println("Commentlist: "+commentList);
                                                    if(commentList!=null) {
                                                    for (Comment comment : commentList) {
                                                        String commentValue = comment.getComment();
                                                                System.out.println("ToTal Comments " +totalComments);
                                                                System.out.println("CM Email "+comment.getEmail());
                                                                System.out.println("Comment Value "+commentValue);
                                                                System.out.println("Post id of Comments: "+comment.getPostId());
                                                        
                                
                                        %>

                                        <div class="formPicProfile">
                                            <h6 style="color: chocolate;">Email: </h6><i><%= comment.getEmail() %></i>
                                        </div>
                                        <div class="Comments">
                                            <p><%= comment.getComment() %></p>
                                        </div>
                                        <div class="Comments">
                                            <p>Time: <%= comment.getTime() %></p>
                                        </div>

                                        <%
                                            }
                                        }
                                        %>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary close" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id=<%= "postLikes"+i %> style="opacity: 1.0;" >
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title"><%= users.size()+" user(s) liked this post" %></h4>
                                <button style="width: 10%;" type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body scrolling">
                                <%
          for(int index=0;index<users.size();index++){%>
                                <a style="border-radius: 50px;" class="list-group-item list-group-item-action" href= <%= "profile.jsp?email="+users.get(index).getEmail() %> >
                                    <img src= <%= (usersdetails.get(index).getProf_pic_path()!=null)?usersdetails.get(index).getProf_pic_path():"images/image.png" %> class="rounded-circle" alt="Profile pic" width="25" height="25" >
                                    <%=users.get(index).getName() %>
                                </a>
                                <%}
                                %>

                            </div>

                        </div>
                    </div>
                </div>


                <%}}
                %> 
                <%}%>
            </div>
        </div>
    </div>
</body>
</html>