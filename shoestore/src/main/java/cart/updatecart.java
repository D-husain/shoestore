package cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Cart;
import dao.UserDao;

/**
 * Servlet implementation class updatecart
 */
public class updatecart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatecart() {
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

		Integer id=Integer.parseInt(request.getParameter("id"));
		float qty=Float.parseFloat(request.getParameter("qty"));
		
		UserDao udao=new UserDao();
		Cart c=udao.getCartById(id);
		
		double total=c.getPrice()*qty;
		UserDao.updateCart(id, qty, total);
		response.sendRedirect("cart.jsp?msg=update");
		
	}
}