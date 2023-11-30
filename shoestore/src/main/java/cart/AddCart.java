package cart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ProjectConn;
import dao.AdminDao;
import dao.UserDao;
import pojo.Product;
import pojo.User;

/**
 * Servlet implementation class AddCart
 */
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UserDao udao=new UserDao();
       AdminDao adao=new AdminDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCart() {
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
		Integer uid = Integer.parseInt(request.getParameter("id"));
		String pname = request.getParameter("pname");
		double price = Double.parseDouble(request.getParameter("price"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		int size=Integer.parseInt(request.getParameter("size"));
		
		
		double total = qty * price;
		
		Integer pid=Integer.parseInt(request.getParameter("pid"));
		
		try {
			Connection con=ProjectConn.createConnection();
			PreparedStatement st = con.prepareStatement("select * from cart where pid=? AND uid=?");
			st.setInt(1, pid);
			st.setInt(2, uid);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {

				if (pid.equals(pid)) {

					int existingQty = rs.getInt("qty");
	                int updatedQty = existingQty + qty;

	                PreparedStatement updateStmt = con.prepareStatement("update cart set qty=?, total=? where pid=? AND uid=?");
	                updateStmt.setInt(1, updatedQty);
	                updateStmt.setDouble(2, total * updatedQty);
	                updateStmt.setInt(3, pid);
	                updateStmt.setInt(4, uid);
	                updateStmt.executeUpdate();

	                response.sendRedirect("cart.jsp?msg=add");
				}

			} else {
				
				
				Product productname = adao.getProductByName(pname);
				User u = udao.getUserById(uid);
				Product productid=adao.getProductById(pid);
				pojo.Cart c = new pojo.Cart();

				c.setUser(u);
				c.setProduct(productid);  //product id
				c.setPrice(price);
				c.setProduct(productname);
				c.setQty(qty);
				c.setTotal(total);
				c.setSize(size);

				udao.addCart(c);
				
				response.sendRedirect("cart.jsp?msg=add");
				
				try {
					Connection conn=ProjectConn.createConnection();
					PreparedStatement stmt = conn.prepareStatement("delete from wishlist where pid=? AND uid=?");
					stmt.setInt(1,pid);
					stmt.setInt(2, uid);
					stmt.executeUpdate();
					
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
