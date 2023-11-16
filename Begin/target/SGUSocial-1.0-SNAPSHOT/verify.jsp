<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.sgusocial.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            .coll{
                margin: 20px;
            }
            body {
                background-image: url("images/background.jpg");
                background-size: cover;
            }
            div form {
                opacity: 1.0;
            }
        </style>
        <title>Verification</title>
    </head>
    <body>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        User user=(User)session.getAttribute("user");
        String ver=(String)session.getAttribute("verification");
                if(user!=null &&ver!=null&&ver.equals("y")){
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                }
                else if(ver!=null&&!ver.equals("n")){
                        response.sendRedirect("login.jsp");
                }
	
        %>
        <div class="container-fluid coll">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <form class="form-inline" action="ValidateServlet" method="post" >
                        <label for="otp" class="mr-sm-2"><h6>Enter the OTP sent to your email :</h6></label>
                        <input type="text" name="otp" class="form-control mb-2 mr-sm-2" id="otp" required >
                        <input type="hidden" name="page" value= <%= request.getAttribute("page") %> >
                        <input type="hidden" name="email" value= <%= user.getEmail() %> >
                        <button type="submit" name="validate" value="verify" class="btn btn-secondary mb-2">Submit</button>
                    </form>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </div>
    </body>
</html>