package Discount;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ProjectConn;
import dao.UserDao;
import pojo.User;
import pojo.Usercoupon;

/**
 * Servlet implementation class applyDiscount
 */
public class applyDiscount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public applyDiscount() {
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

		Integer uid = Integer.parseInt(request.getParameter("id"));
		String coupon = request.getParameter("coupon");

		try {
			Connection con = ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from usercoupon where uid=?");
			st.setInt(1, uid);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {

				if (uid.equals(uid)) {

					request.getRequestDispatcher("checkout.jsp?msg=match").include(request, response);
				}

			} else {

				UserDao udao = new UserDao();
				Usercoupon uc = new Usercoupon();
				User u = udao.getUserById(uid);

				uc.setUser(u);
				uc.setCoupon(coupon);

				boolean couponMatched = udao.checkCouponMatch(uc);

				if (couponMatched) {
					udao.applycoupon(uc);
					HttpSession session = request.getSession();
					session.setAttribute("usercoupon", uc);
					request.getRequestDispatcher("checkout.jsp?msg=apply").forward(request, response);
				} else {
					request.getRequestDispatcher("checkout.jsp?msg=nomatch").include(request, response);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
