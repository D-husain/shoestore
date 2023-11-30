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

import dao.UserDao;
import pojo.Contact;

/**
 * Servlet implementation class UserContact
 */
public class UserContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserContact() {
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
		

		// Sender's email ID and password
		final String from = "dhusain4.3.2000@gmail.com";
		final String password = "ldqdghcizxtuqciy";
		
		//dilshadghogha123@gmail.com
		//fmtrzpaxporkvneu

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
			mimeMessage.setFrom(new InternetAddress(email));
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(from));
			mimeMessage.setSubject("Contact Inquiry");
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
					+"<h2 align='center'>Contact Inquiry</h2>"
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
					+"<p align='center' style='color: #7a899f;margin-bottom: 0;font-size: 14px;'><strong>Name:</strong> "+name+".</p>"
					+"</td>"
					+"</tr>"
					+"<tr>"
					+"<td>"
					+"<p align='center' style='color: #7a899f;margin-bottom: 0;font-size: 14px;'><strong>Message:</strong> "+message+".</p>"
					+"</td>"
					+"</tr>"
					+"</tbody>"
					+"<tfoot>"
					+"<tr>"
					+"<td>"
					+"<p align='center'>"
					+"<small style='color:#7a899f;'>&copy;2023 Copyright <a href='#' target='_blank' style='text-decoration: none; color: #1f74ca;'>Virgin Mobile</a>. All Rights Reserved.</small>"
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
		c.setName(name);
		c.setEmail(email);
		c.setContact(contact);
		c.setSubject(subject);
		c.setMessage(message);
		
		UserDao udao=new UserDao();
		udao.addContact(c);
		
			response.sendRedirect("contact.jsp?msg=contact");
		} catch (MessagingException e) {
			response.sendRedirect("contact.jsp?msg=false");
		}
	}

}
