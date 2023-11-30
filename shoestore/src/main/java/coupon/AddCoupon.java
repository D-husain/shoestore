package coupon;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.Coupon;
import dao.AdminDao;

/**
 * Servlet implementation class AddCoupon
 */
public class AddCoupon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCoupon() {
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
		String code=request.getParameter("code");
		String type=request.getParameter("type");
		int value=Integer.parseInt(request.getParameter("value"));
		int mvalue=Integer.parseInt(request.getParameter("mvalue"));
		
		Coupon c=new Coupon();
		c.setCode(code);
		c.setType(type);
		c.setValue(value);
		c.setMvalue(mvalue);
		
		AdminDao adao=new AdminDao();
		adao.AddCoupon(c);
		response.sendRedirect("admin-coupons.jsp");
	}

}
