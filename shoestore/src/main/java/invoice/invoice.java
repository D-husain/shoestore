package invoice;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.xhtmlrenderer.pdf.ITextRenderer;
import pojo.Sproduct;
import com.itextpdf.text.DocumentException;
import dao.UserDao;

public class invoice extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));

        UserDao udao = new UserDao();

		List<Sproduct> order = udao.getSproductDetailsByOrderId(orderId);

		if (order == null) {
		    response.setContentType("text/plain");
		    PrintWriter out = response.getWriter();
		    out.println("Order not found.");
		    return;
		}

		String htmlContent = generateOrderHtml(order);

		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=order_" + orderId + ".pdf");

		try {
		    ITextRenderer renderer = new ITextRenderer();
		    renderer.setDocumentFromString(htmlContent);
		    renderer.layout();
		    ByteArrayOutputStream pdfStream = new ByteArrayOutputStream();
		    renderer.createPDF(pdfStream);
		    byte[] pdfBytes = pdfStream.toByteArray();
		    response.getOutputStream().write(pdfBytes);

		} catch (DocumentException | IOException e) {
		    e.printStackTrace();

		    response.setContentType("text/plain");
		    PrintWriter out = response.getWriter();
		    out.println("An error occurred while generating the PDF.");
		}
    }

	private String generateOrderHtml(List<Sproduct> order) {
		
		String jspContent = "<html>\n" +
		        "<head>\n" +
		        "<style>"+
		        "body { font-family: Arial, sans-serif; } table { width: 100%; border-collapse: collapse; } th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }.store{color: #445f84; font-family: cursive; text-align: center; display: flex; justify-content: center; align-items: center;}.invoice{ text-align: center; font-family: serif; } th { background-color: #445f84; }"+
		        "</style>"+
		        "</head>\n" +
		        "<body>\n" +
		        "<div class='store'><img width='100' height='70' src='http://localhost:8080/Shoe_Store/assets/images/demos/demo-10/shoe-logo-footers.png' alt='Shoe Logo'></img><h1 class='store'> Shoe Store</h1></div>"+
		        "<h2 class='invoice'>Order Invoice</h2>"+
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
		Double charge=null;
		for (Sproduct product : order) {
		    totalAmount = product.getOrder().getAmount();
		    totalPrice =product.getOrder().getTotal();
		    discount =product.getOrder().getDiscount();
		    charge=product.getOrder().getCharge();
		}

		String totalInfo = 
				"<tr>"+
				"<td colspan='4' style='text-align: left;'>Total Price</td>"+
				"<td>&#8377; " +totalPrice+ "</td>"+
				"</tr>"+
				"<tr>"+
		        "<td colspan='4' style='text-align: left;'>Shipping</td>"+
		        "<td>&#8377; " +charge+ "</td>"+
		        "</tr>"+
		        "<tr>"+
				"<td colspan='4' style='text-align: left;'>Discount Price</td>"+
				"<td>&#8377; " +discount+ "</td>"+
				"</tr>"+
		        "<tr>"+
		        "<td colspan='4' style='text-align: left;'>Total</td>"+
		        "<td>&#8377; " +totalAmount+ "</td>"+
		        "</tr>";
		jspContent += totalInfo;

		String fullHTML = "</table>"+
		        "</body>\n" +
		        "</html>";
		jspContent += fullHTML;

		return jspContent;

	}



}
