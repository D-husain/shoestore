package orders;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import pojo.ShippingAddress;
import pojo.User;

/**
 * Servlet implementation class AddShipping
 */
public class AddShipping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddShipping() {
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
		Integer id = Integer.parseInt(request.getParameter("uid"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String cname=request.getParameter("cname");
		String country =request.getParameter("country");
		String state=request.getParameter("state");
		String add1 = request.getParameter("address1");
		String add2 = request.getParameter("address2");
		String city = request.getParameter("city");
		
		int zip =Integer.parseInt(request.getParameter("zip"));
		double shippingCharge = calculateShippingCharge(zip);
		
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		String onote=request.getParameter("onote");
		
		
		UserDao dao = new UserDao();
		ShippingAddress s = new ShippingAddress();
		
		User u = dao.getUserById(id);
		
		s.setUser(u);
		s.setFname(fname);
		s.setLname(lname);
		s.setCname(cname);
		s.setCountry(country);
		s.setAddress1(add1);
		s.setAddress2(add2);
		s.setCity(city);
		s.setZip(zip);
		s.setContact(contact);
		s.setEmail(email);
		s.setOnote(onote);
		s.setState(state);
		
		dao.AddShipping(s);
		
		HttpSession session=request.getSession();
		session.setAttribute("shipping", s);
		
		session.setAttribute("charge", shippingCharge);
		
		response.sendRedirect("payment.jsp?msg=add");
	}

	private double calculateShippingCharge(int zipCode) {
	    if (zipCode == 385520) {
	        return 25.0;
	    } else if (zipCode == 385210) {
	        return 50.0;
	    } else {
	        return 100.0;
	    }
	}
}
