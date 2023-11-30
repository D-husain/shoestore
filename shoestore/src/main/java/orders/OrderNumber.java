package orders;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Order;
import dao.UserDao;

public class OrderNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int oid =Integer.parseInt(request.getParameter("orderid"));
		    Order order =UserDao.searchOrderId(oid);
		    request.setAttribute("foundOrder", order);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("ordersearch.jsp");
		    dispatcher.forward(request, response);
		    
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
