package contact;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import pojo.Contact;

public class ReplayMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String to=request.getParameter("email");
		String reply=request.getParameter("reply");
		String message=request.getParameter("message");
		
		// Sender's email ID and password
				final String from = "dhusain4.3.2000@gmail.com";
				final String password = "ldqdghcizxtuqciy";

				// SMTP server configuration
				Properties properties = new Properties();
				properties.put("mail.smtp.host", "smtp.gmail.com");
				properties.put("mail.smtp.socketFactory.port", "465");
				properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				properties.put("mail.smtp.auth", "true");
				properties.put("mail.smtp.port", "465");

				// Create a session with the SMTP server and authenticate
				Session session = Session.getInstance(properties, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(from, password);
					}
				});

				try {
					MimeMessage mimeMessage = new MimeMessage(session);
					mimeMessage.setFrom(new InternetAddress(from));
					mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					mimeMessage.setSubject("Contact Inquiry Reply");
					mimeMessage.setContent(""
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
							+"<h2 align='center'>Contact Inquiry Reply</h2>"
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
							+"<p align='center' style='color: #7a899f;margin-bottom: 0;font-size: 14px;'><strong>Your Message:</strong> "+message+".</p>"
							+"</td>"
							+"</tr>"
							+"<tr>"
							+"<td>"
							+"<p align='center' style='color: #7a899f;margin-bottom: 0;font-size: 14px;'><strong>Reply From The Shoe Store:</strong> "+reply+".</p>"
							+"</td>"
							+"</tr>"
							+"</tbody>"
							+"<tfoot>"
							+"<tr>"
							+"<td>"
							+"<p align='center'>"
							+"<small style='color:#7a899f;'>&copy;2023 Copyright <a href='http://localhost:8080/Shoe_Store/index.jsp' target='_blank' style='text-decoration: none; color: #1f74ca;'> Shoe Store</a>. All Rights Reserved.</small>"
							+"</p>"
							+"</td>"
							+"</tr>"
							+"</tfoot>"
							+"</table>"
							+"</div>"
							+"</td>"
							+"</tr>"
							+"</table>","text/html");
					Transport.send(mimeMessage);
					
					Contact c=new Contact(); 
					c.setId(id);
					c.setReplay(reply);
					
					UserDao udao=new UserDao();
					udao.replay(c);
					
					HttpSession session2=request.getSession();
					session2.setAttribute("reply", c);
					
					
					response.sendRedirect("admin-inquiries.jsp?msg=true");
					
				} catch (MessagingException e) {
					response.sendRedirect("admin-inquiries.jsp?msg=false");
				}
	}
}
