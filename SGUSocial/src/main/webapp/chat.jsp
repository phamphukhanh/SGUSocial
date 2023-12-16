<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.sgusocial.User,com.sgusocial.ChatBean,com.sgusocial.UserDetails,java.io.File,java.util.ArrayList,com.sgusocial.DBUtil,jakarta.annotation.Resource,javax.sql.DataSource"%>
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
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
        <title>Chat</title>
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
            .scrolling {
                height:300px;
                overflow-y: auto;
            }
            .coll2 {
                margin-top:20px;
                margin-bottom:20px;
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
    </head>
    <body>
        <%!
        @Resource(name="jdbc/sgusocial")
        private DataSource dataSource;
        %>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        %>
        <%
        User user=(User)session.getAttribute("user");
        String ver=(String)session.getAttribute("verification");
                if(user==null||ver==null|| (ver!=null&&!ver.equals("y"))){
                        response.sendRedirect("login.jsp");
                }
                else { %>
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
                    <h4 class="modal-title">Logout</h4>
                    <button style="border-radius: 25px;" type="button" class="close" data-dismiss="modal">&times;</button>
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
    <% 
    User profile=DBUtil.getUserDetails(dataSource, request.getParameter("email"));
    %>
    <div class="container-fluid" style="margin-top:65.28px;">
        <h5>
            <a class="text-white" href=<%= "profile.jsp?email="+profile.getEmail()%> >
                <i class="fas fa-arrow-left" style="color: #ffffff;"></i>
                Go back to <%= profile.getName() %>'s profile
            </a>
        </h5>
        <div class="card" style="border-radius: 30px; height: 455px;">
            <div class="card-header" style="opacity:0.9;">
                <h5>Chatting with <%= profile.getName() %></h5>
            </div>
            <div class="card-body scrolling">
                <%
                ArrayList<ChatBean> chats=DBUtil.getMessages(dataSource, user.getEmail(), profile.getEmail());
                if(chats!=null){
                for(int i=0;i<chats.size();i++){
                        ChatBean chat=chats.get(i);
                %>

                <div class="row">
                    <%
                    if(chat.getFrom().equals(user.getEmail())){
                    %>
                    <div class="col-8"></div>
                    <div class="col-sm">
                        <div class="card bg-dark text-white" style="margin-bottom:10px;border-radius: 50px;">
                            <div class="card-body">
                                <div class="card-text"><%= chat.getMessage() %></div>
                            </div>
                        </div>
                    </div>
                    <%}
                    else{%>
                    <div class="col-sm">
                        <div class="card bg-dark text-white" style="margin-bottom:10px;border-radius: 50px;">
                            <div class="card-body">
                                <div class="card-text"><%= chat.getMessage() %></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-8"></div>
                    <%}
                    %>
                </div>
                <%
                }
                        }
                %>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col">
                        <form action="ServicesServlet" method="post">
                            <div class="d-flex">
                                <div class="flex-grow-1 mr-2">
                                    <input style="border-radius: 25px;" type="text" name="message" class="form-control" id="comment" placeholder="Type here..." required>
                                </div>
                                <button type="submit" name="service" value="Chat" class="btn"><i class='fas fa-location-arrow text-primary' style='font-size:36px;'></i></button>
                            </div>
                            <input type="hidden" name="dest" value=<%= profile.getEmail() %> >
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
            }
    %>
</body>
</html>