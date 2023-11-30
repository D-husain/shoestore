package orders;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Order;
import pojo.ShippingAddress;
import pojo.User;
import dao.UserDao;

/**
 * Servlet implementation class Orders
 */
public class Orders extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Orders() {
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

		/*---------------Order---------------*/
		Integer id = Integer.parseInt(request.getParameter("uid"));
		Integer sid = Integer.parseInt(request.getParameter("id"));
		String date = request.getParameter("date");
		double amount = Double.parseDouble(request.getParameter("amount"));
		Integer status = Integer.parseInt(request.getParameter("status"));
		double total = Double.parseDouble(request.getParameter("total"));
		double discount = 0;
		String discountParam = request.getParameter("discount");
		if (discountParam != null && !discountParam.isEmpty()) {
		    discount = Double.parseDouble(discountParam);
		}
		double charge=Double.parseDouble(request.getParameter("charge"));

		UserDao udao = new UserDao();
		Order o = new Order();
		User u = udao.getUserById(id);
		ShippingAddress s = udao.getShippingById(sid);

		o.setUser(u);
		o.setShippingAddress(s);
		o.setOdate(date);
		o.setAmount(amount);
		o.setStatus(status);
		o.setTotal(total);
		o.setDiscount(discount);
		o.setCharge(charge);

		udao.saveOrder(o);

		HttpSession session2 = request.getSession();
		session2.setAttribute("Orders", o);
		
		RequestDispatcher rd = request.getRequestDispatcher("confirm-order.jsp?msg=done");
		rd.include(request, response);
	}

}
