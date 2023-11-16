<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.priyam.User,com.priyam.UserDetails,java.io.File,java.util.ArrayList,com.priyam.DBUtil,jakarta.annotation.Resource,javax.sql.DataSource"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <style>
            nav{
                opacity: 0.85;
            }
            nav:hover{
                opacity: 1.0;
            }
            .collup {
                margin-top:20px;
            }
            body {
                background-image: url("images/background.jpg");
                background-size: cover;
            }
            div.card {
                opacity: 0.75;
            }
            div.card:hover{
                opacity: 1.0;
            }
            .scrolling {
                height:500px;
                overflow-y: auto;
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
        </style>
        <title>Suggestions</title>
    </head>
    <%!
    @Resource(name="jdbc/sgusocial")
    private DataSource dataSource;
    %>
    <body>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
        <%
        User user=(User)session.getAttribute("user");
        String ver=(String)session.getAttribute("verification");
                if(user==null||ver==null|| (ver!=null&&!ver.equals("y"))){
                        response.sendRedirect("login.jsp");
                }
                else{%>
    <nav class="navbar navbar-dark navbar-expand-md fixed-top bg-primary">
        <a style="border-radius: 10px;" class="navbar-brand bg-primary text-white" href="home.jsp">SGUSocial</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a style="border-radius: 10px;" class="nav-link btn btn-primary" href=<%= "home.jsp?" %>>
                        <i class="fas fa-home"></i>
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a style="border-radius: 10px;" class="nav-link btn btn-primary" href=<%= "profile.jsp?email="+user.getEmail() %>>
                        <i class="fas fa-user-circle"></i>
                        Profile
                    </a>
                </li>
                <li class="nav-item">
                    <a style="border-radius: 10px;" class="nav-link btn btn-primary" href="finder.jsp">
                        <i class="fas fa-search"></i>
                        Finder
                    </a>
                </li>
                <li class="nav-item">
                    <a style="border-radius: 10px;" class="nav-link btn btn-primary" href="suggestions.jsp">
                        <i class="fas fa-user-friends"></i>
                        Suggestions
                    </a>
                </li>    
                <li class="nav-item">
                    <a style="border-radius: 10px;" class="nav-link btn btn-primary" data-toggle="modal" data-target="#myModal" href="#">
                        <i class="fas fa-power-off"></i>
                        Logout
                    </a>
                </li>
            </ul>
        </div>  
    </nav>

    <div class="modal fade" id="myModal" style="opacity: 1.0;" >
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">SGUSocial</h4>
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

    <div class="row">
        <div class="col-sm-8">
            <div class="container-fluid" style="margin-top:80px">
                <h5>People also follows:</h5>

                <div class="scrolling">
                    <div class="card-columns">
                        <%
                        ArrayList<User> suggs=DBUtil.getSuggestions(dataSource, user.getEmail());
                        for(int i=0;i<suggs.size();i++){
                        User sugg=suggs.get(i);
                        UserDetails details=DBUtil.getUserDetails2(dataSource, sugg.getEmail());
                        if(details!=null){
                                //System.out.println(details.getProf_pic_path());
                                if(details.getProf_pic_path()==null){
                                        details.setProf_pic_path("images/student.png");
                                }
                                else{
                                        String path=details.getProf_pic_path();
                                        path=path.substring(path.lastIndexOf('/')+1);
                                        path=request.getServletContext().getRealPath("")+"images/"+path;
                                        File f=new File(path);
                                        if(!f.exists()){
                                                details.setProf_pic_path("images/student.png");	
                                        }
                                }
                        }
                        %>
                        <a class="card-text text-white" href= <%= "profile.jsp?email="+sugg.getEmail() %> >
                            <div class="card bg-primary" style="width:250px;border-radius: 50px;">
                                <img class="card-img-top" src=<%= (details!=null)?details.getProf_pic_path():"images/student.png" %> alt="Card image" style="width: 250px; height: 250px; object-fit: cover; border-radius: 50px;" >
                                <div class="card-body text-center">
                                    <%= sugg.getName() %> 
                                </div>
                            </div>
                        </a>
                        <%
                        }
                        %>
                        <%
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>