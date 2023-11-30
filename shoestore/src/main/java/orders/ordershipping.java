package orders;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
import pojo.Order;
import pojo.Sproduct;

public class ordershipping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		UserDao udao = new UserDao();
		
		List<Sproduct> order = udao.getSproductDetailsByOrderId(id);

		if (order == null) {
		    response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
		    out.println("Order not found.");
		    return;
		}

		String htmlContent = generateOrderHtml(order);

		final String from = "dhusain4.3.2000@gmail.com";
		final String password = "ldqdghcizxtuqciy";

		Properties properties = new Properties();
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "465");

		Session session2 = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session2);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(order.get(0).getOrder().getShippingAddress().getEmail()));
			message.setSubject("Shipping Order");
			message.setContent(htmlContent, "text/html; charset=utf-8");

			Transport.send(message);

			Order o=new Order();
			
			o.setId(id);
			o.setStatus(3);
			
			udao.activeShipping(o);
			
			response.sendRedirect("admin-shippingorders.jsp");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
    }

	private String generateOrderHtml(List<Sproduct> order) {
		
		String jspContent = "<html>\n" +
		        "<head>\n" +
		        "<style>"+
		        "body { font-family: Arial, sans-serif; } table { width: 100%; border-collapse: collapse; } th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }.store{color: #445f84; font-family: cursive; text-align: center;}.invoice{ text-align: center; font-family: serif; } th { background-color: #445f84; }"+
		        "</style>"+
		        "</head>\n" +
		        "<body>\n" +
		        "<div class='store'><h1 class='store'> Shoe Store</h1></div>"+
		        "<h2 class='invoice'>Shipping Order</h2>"+
		        "<p>Order Id: " + order.get(0).getOrder().getId()+ "</p>"+
		        "<p>Order Date: " + order.get(0).getOrder().getOdate() + "</p>"+
		        "<p>Customer Name: " + order.get(0).getOrder().getUser().getFname()+
		        " "+ order.get(0).getOrder().getUser().getLname()+ "</p>"+
		        "<p>Email: " + order.get(0).getOrder().getShippingAddress().getEmail() + "</p>"+
		        "<p>Address: " + order.get(0).getOrder().getShippingAddress().getAddress1()+
		        " "+order.get(0).getOrder().getShippingAddress().getCity()+
		        " "+order.get(0).getOrder().getShippingAddress().getZip()+
		        "</p>"+
		        "<p>Phone Number: " + order.get(0).getOrder().getShippingAddress().getContact() + "</p>"+
		        "<table>"+
		        "<tr>"+
		        "<th>ID</th>"+
		        "<th>Product Name</th>"+
		        "<th>Price</th>"+
		        "<th>Qty</th>"+
		        "<th>Total</th>"+
		        "</tr>";
		
		int id=1;
		for (Sproduct product : order) {
		    String productInfo = "<tr>"+
		            "<td>"+id+"</td>"+
		            "<td>"+product.getPname()+"</td>"+
		            "<td>"+product.getPrice()+"</td>"+
		            "<td>"+product.getQty()+"</td>"+
		            "<td>"+product.getTotal()+"</td>"+
		            "</tr>";
		    jspContent += productInfo;
		    id++; 
		}

		Double totalAmount =null;
		Double totalPrice=null;
		Double discount=null;
		for (Sproduct product : order) {
		    totalAmount = product.getOrder().getAmount();
		    totalPrice =product.getOrder().getTotal();
		    discount =product.getOrder().getDiscount();
		}

		String totalInfo = 
				"<tr>"+
				"<td colspan='4' style='text-align: left;'>Total Price</td>"+
				"<td>" +totalPrice+ "</td>"+
				"</tr>"+
				"<tr>"+
		        "<td colspan='4' style='text-align: left;'>Shipping</td>"+
		        "<td>50</td>"+
		        "</tr>"+
		        "<tr>"+
				"<td colspan='4' style='text-align: left;'>Discount Price</td>"+
				"<td>" +discount+ "</td>"+
				"</tr>"+
		        "<tr>"+
		        "<td colspan='4' style='text-align: left;'>Total</td>"+
		        "<td>" +totalAmount+ "</td>"+
		        "</tr>";
		jspContent += totalInfo;

		String fullHTML = "</table>"+
		        "</body>\n" +
		        "</html>";
		jspContent += fullHTML;

		return jspContent;

	}
			
	}