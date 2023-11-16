package com.sgusocial;

import jakarta.annotation.Resource;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import java.util.Properties;
import java.util.Random;
import javax.sql.DataSource;

/**
 * Servlet implementation class ValidateServlet
 */
@WebServlet("/ValidateServlet")
public class ValidateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
//    private static String usermail = "********";
//    private static String pass = "********";
    /**
     * @see HttpServlet#HttpServlet()
     */
    @Resource(name = "jdbc/sgusocial")
    private DataSource dataSource;

    public ValidateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        if (request.getParameter("validate").equals("logout")) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        if (request.getParameter("validate").equals("verify")) {
            HttpSession session = request.getSession();
            if (request.getParameter("otp").equals(session.getAttribute("otp"))) {
                session.setAttribute("verification", "y");
                if (!request.getParameter("page").equals("login")) {
                    User user = (User) session.getAttribute("user");
                    ArrayList values = new ArrayList();
                    values.add(user.getEmail());
                    values.add(user.getName());
//                    System.out.println(user.getEmail());
                    values.add(session.getAttribute("pass"));
                    values.add(true);
                    
                    
                    ArrayList values1 = new ArrayList();
                    values1.add(user.getEmail());
                    values1.add(null);
                    values1.add(null);
                    session.removeAttribute("pass");

                    // Add a first post
                    LocalDateTime currentDateTime = LocalDateTime.now();
                    // Định dạng thời gian theo "HH:mm:ss"
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                    // Chuyển đổi thành chuỗi theo định dạng "HH:mm:ss"
                    String formattedTime = currentDateTime.format(formatter);
                    ArrayList postValues = new ArrayList();
                    postValues.add(1);
                    postValues.add(user.getEmail());
                    postValues.add(0);
                    postValues.add("Your first post is here! This post is automatically created when you create your account for the first time.");
                    postValues.add(new java.util.Date());
                    postValues.add(formattedTime);
                    postValues.add(true);

                    if (DBUtil.insertRow(dataSource, "user", values, 0)
                            && DBUtil.insertRow(dataSource, "user_details", values1, 0)
                            && DBUtil.insertRow(dataSource, "post", postValues, 1)) {
                        response.sendRedirect("home.jsp");
                    } else {
                        DBUtil.deleteUser((javax.sql.DataSource) dataSource, request.getParameter("email"));
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect("home.jsp");
                }
            } else {
                request.setAttribute("warning", "Invalid details. Please try again.");
                if (request.getParameter("page").equals("login")) {
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    DBUtil.deleteUser((javax.sql.DataSource) dataSource, request.getParameter("email"));
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            }
        } else if (request.getParameter("validate").equals("login")) {
            User user = DBUtil.getUserLogin((javax.sql.DataSource) dataSource, request.getParameter("email"), request.getParameter("password"));
            if (user != null) {
                String otp = generateOTP();
                System.out.println("OTP: " + otp);
                HttpSession session = request.getSession();
                session.setAttribute("verification", "n");
                session.setAttribute("otp", otp);
                session.setAttribute("user", user);
                request.setAttribute("page", "login");
                request.getRequestDispatcher("verify.jsp").forward(request, response);
//                send(usermail, pass, request.getParameter("email"), "Email verification", "Hi, your OTP is " + otp + ".");
            } else {
                request.setAttribute("warning", "Invalid details. Please try again.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if (request.getParameter("validate").equals("register")) {
            HttpSession session = request.getSession();
            User user = new User();
            user.setEmail(request.getParameter("email"));
            user.setName(request.getParameter("name"));
            user.setActive(true);
            session.setAttribute("user", user);
            session.setAttribute("pass", request.getParameter("password"));
            String otp = generateOTP();
            System.out.println("OTP: " + otp);
            session.setAttribute("verification", "n");
            session.setAttribute("otp", otp);
            request.setAttribute("page", "registration");
            request.getRequestDispatcher("verify.jsp").forward(request, response);
//            send(usermail, pass, request.getParameter("email"), "User Verification for PBook", "Hi, your OTP is " + otp + ".");
        }
    }

    static String generateOTP() {
        // Using numeric values 
        String numbers = "0123456789";

        // Using random method 
        Random rndm_method = new Random();

        char[] otp = new char[6];

        for (int i = 0; i < 6; i++) {
            // Use of charAt() method : to get character value 
            // Use of nextInt() as it is scanning the value as int 
            otp[i]
                    = numbers.charAt(rndm_method.nextInt(numbers.length()));
        }
        return String.valueOf(otp);
    }
//    public static void send(String from, String password, String to, String sub, String msg) {
//        //Get properties object    
//        Properties props = new Properties();
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.socketFactory.port", "465");
//        props.put("mail.smtp.socketFactory.class",
//                "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.port", "587");
//        // get Session   
//        Session session = Session.getDefaultInstance(props,null);  
//        Session session = Session.getDefaultInstance(props,
//                new jakarta.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(from, password);
//            }
//        });
//        // compose message    
//        try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(from));
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//            message.setSubject(sub);
//            message.setText(msg);
//            //send message  
//            Transport.send(message);
//            System.out.println("message sent successfully");
//        } catch (MessagingException e) {
//            throw new RuntimeException(e);
//        }
//
//    }
}
