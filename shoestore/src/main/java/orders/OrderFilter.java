package orders;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Order;
import dao.UserDao;

public class OrderFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fromDate=request.getParameter("from");
			String toDate=request.getParameter("to");
			 
		    List<Order> order =UserDao.OrderFilter(fromDate, toDate);
		    request.setAttribute("date", order);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("admin-sales.jsp");
		    dispatcher.forward(request, response);
		    
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		 
		
	    }
	}