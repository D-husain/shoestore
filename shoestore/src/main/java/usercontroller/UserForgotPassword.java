package usercontroller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ProjectConn;


/**
 * Servlet implementation class UserForgotPassword
 */
public class UserForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserForgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		int otpvalue = 0;
		HttpSession mySession = request.getSession();
		
		try {
			Connection con=ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from user where email=?");
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
		
			if(email.equals(email)) {
			Random rand = new Random();
			otpvalue = rand.nextInt(99999);

			String to = email;// change accordingly
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("dhusain4.3.2000@gmail.com", "ldqdghcizxtuqciy");
														// Put your email           // password here
				}
			});
			// compose message
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));// change accordingly
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Reset password");
				message.setContent(""
						+"<table border='0' cellpadding='0' cellspacing='0' width='100%'>"
						+"<tr>"
						+"<td bgcolor='#F9FAFC'>"
						+"<div align='center' style='padding: 45px 0;'>"
						+"<table border='0' cellpadding='0' cellspacing='0' style='font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.5em;max-width: 500px;'>"
						+"<thead>"
						+"<tr>"
						+"<td style='text-align: center;'>"
						+"<img src='https://i0.wp.com/www.writefromscratch.com/wp-content/uploads/2018/12/demo-logo.png?ssl=1' style='margin-bottom: 1rem; width: 110px;' alt=''>"
						+"</td>"
						+"</tr>"
						+"<tr>"
						+"<td style='background-color: #1f74ca; color: white; padding: 0 20px; border-radius: 15px 15px 0 0;'>"
						+"<h2 align='center'>Reset Password</h2>"
						+"</td>"
						+"</tr>"
						+"</thead>"
						+"<tbody style='background-color: white;padding: 40px 20px;border-radius: 0 0 15px 15px;display: block;box-shadow: 0 10px 30px -30px black;'>"
						+"<tr>"
						+"<td>"
						+"<p align='center' style='margin: 0; color: #475467;'>Hi,<strong>User</strong></p>"
						+"</td>"
						+"</tr>"
						+"<tr>"
						+"<td>"
						+"<p align='center' style='color: #7a899f;margin-bottom: 0;font-size: 14px;'>We're sending you this email because you requested a password reset.</p>"
						+"</td>"
						+"</tr>"
						+"<tr>"
						+"<td align='center'>"
						+"<a href='javascript:void(0)' style='text-decoration: none;display: inline-block;min-width: 100px;text-align: center;padding: 10px 30px;margin: 30px auto;background-color: #1f74ca; color: white; border-radius: 10px; transition: all 0.3s ease;'>"+otpvalue+"</a>"    
						+"</td>"
						+"</tr>"
						+"<tr>"
						+"<td>"
						+"<p align='center' style='color: #7a899f;margin-bottom: 0;font-size: 14px;'>If you didn't request a password reset, you can ignore this email. Your password will not be changed.</p>"
						+"</td>"
						+"</tr>"
						+"</tbody>"
						+"<tfoot>"
						+"<tr>"
						+"<td>"
						+"<p align='center'>"
						+"<small style='color:#7a899f;'>&copy;2023 Copyright <a href='#' target='_blank' style='text-decoration: none; color: #1f74ca;'>Shoe Store</a>. All Rights Reserved.</small>"
						+"</p>"
						+"</td>"
						+"</tr>"
						+"</tfoot>"
						+"</table>"
						+"</div>"
						+"</td>"
						+"</tr>"
						+"</table>",
						"text/html");
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			dispatcher = request.getRequestDispatcher("otp.jsp?msg=match");
			mySession.setAttribute("otp",otpvalue); 
			mySession.setAttribute("email",email); 
			dispatcher.forward(request, response);
		}
		
		}
			else
		{
			response.sendRedirect("forgotpassword.jsp?msg=notmatch");
		}
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}