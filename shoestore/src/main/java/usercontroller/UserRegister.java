package usercontroller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

import connection.ProjectConn;
import dao.UserDao;
import pojo.User;

/**
 * Servlet implementation class UserRegister
 */
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegister() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		int zip = Integer.parseInt(request.getParameter("zip"));
		String password = request.getParameter("password");

		try {
			Connection con = ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from user where email=?");
			st.setString(1, email);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {

				if (email.equals(email)) {

					request.getRequestDispatcher("login.jsp?msg=sem").forward(request, response);
				}

			} else {

				// Sender's email ID and password
				final String from = "dhusain4.3.2000@gmail.com";
				final String passwords = "ldqdghcizxtuqciy";

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
						return new PasswordAuthentication(from, passwords);
					}
				});

				try {
					// Create a MimeMessage object
					MimeMessage mimeMessage = new MimeMessage(session);

					// Set From: header field
					mimeMessage.setFrom(new InternetAddress(from));

					// Set To: header field
					mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

					// Set Subject: header field
					mimeMessage.setSubject("Register User");

					// Set the actual message
					mimeMessage
							.setContent(
									""
											+ "<table border='0' cellpadding='0' cellspacing='0' width='100%'>"
											+ "<tr>"
											+ "<td bgcolor='#F9FAFC'>"
											+ "<div align='center' style='padding:5px 0;'>"
											+ "<table border='0' cellpadding='0' cellspacing='0' style='font-family:Arial,Helvetica,sans-serif;font-size:16px;line-height:1.5em;max-width: 500px;'>"
											+ "<thead>"
											+ "<tr>"
											+ "<td style='text-align: center;'>"
											+ "<img src='https://i0.wp.com/www.writefromscratch.com/wp-content/uploads/2018/12/demo-logo.png?ssl=1' style='margin-bottom: 1rem; width: 110px;' alt=''>"
											+ "</td>"
											+ "</tr>"
											+ "<tr>"
											+ "<td style='background-color: #1f74ca; color: white; padding: 0 20px; border-radius: 15px 15px 0 0;'>"
											+ "<h2 align='center'>Thank You</h2>"
											+ "</td>"
											+ "</tr>"
											+ "</thead>"
											+ "<tbody style='background-color: white;padding: 40px 20px;border-radius: 0 0 15px 15px;display: block;box-shadow: 0 10px 30px -30px black;'>"
											+ "<tr>"
											+ "<td>"
											+ "<p align='center' style='margin: 0; color: #475467;'>Hey,<strong>User</strong></p>"
											+ "</td>"
											+ "</tr>"
											+ "<tr>"
											+ "<td>"
											+ "<p align='center' style='color: #7a899f;margin-bottom: 0;font-size: 14px;'>Thank you for registered.We're so excited to share the latest news and updates about our product with you.If you'd like to learn more, follow us on social media!</p>"
											+ "</td>"
											+ "</tr>"
											+ "</tbody>"
											+ "<tfoot>"
											+ "<tr>"
											+ "<td>"
											+ "<p align='center'>"
											+ "<small style='color:#7a899f;'>&copy;2023 Copyright <a href='#' target='_blank' style='text-decoration: none; color: #1f74ca;'>Virgin Mobile</a>. All Rights Reserved.</small>"
											+ "</p>" + "</td>" + "</tr>" + "</tfoot>" + "</table>" + "</div>" + "</td>"
											+ "</tr>" + "</table>", "text/html");

					// Send the email
					Transport.send(mimeMessage);

					User u = new User();
					u.setFname(fname);
					u.setLname(lname);
					u.setEmail(email);
					u.setContact(contact);
					u.setAddress(address);
					u.setCity(city);
					u.setState(state);
					u.setCountry(country);
					u.setZip(zip);
					u.setPassword(password);

					UserDao udao = new UserDao();
					udao.RegisterUser(u);

					response.sendRedirect("login.jsp?msg=register");

				} catch (MessagingException e) {
					response.sendRedirect("login.jsp?msg=false");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
