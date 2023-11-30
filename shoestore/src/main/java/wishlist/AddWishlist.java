package wishlist;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProjectConn;
import pojo.Product;
import pojo.User;
import pojo.Wishlist;
import dao.AdminDao;
import dao.UserDao;

/**
 * Servlet implementation class AddWishlist
 */
public class AddWishlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UserDao udao=new UserDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddWishlist() {
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
		Integer id = Integer.parseInt(request.getParameter("id"));
		String pname = request.getParameter("pname");
		double price =Double.parseDouble(request.getParameter("price"));

		Integer pid = Integer.parseInt(request.getParameter("pid"));
		try {
			Connection con=ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from wishlist where pid=? AND uid=?");
			st.setInt(1, pid);
			st.setInt(2, id);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {

				if (pid.equals(pid)) {
					response.sendRedirect("wishlist.jsp?msg=match");
				}

			} else {
				AdminDao adao=new AdminDao();
				Product productname = adao.getProductByName(pname);
				Product productId = adao.getProductById(pid);
				User u = udao.getUserById(id);

				Wishlist w = new Wishlist();

				w.setProduct(productId); // product id
				w.setProduct(productname);
				w.setUser(u);
				w.setPrice(price);

				udao.addWishlist(w);
				
				response.sendRedirect("wishlist.jsp?msg=add");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
