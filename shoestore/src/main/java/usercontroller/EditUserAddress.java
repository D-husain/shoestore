package usercontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import pojo.User;

/**
 * Servlet implementation class EditUserAddress
 */
public class EditUserAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserAddress() {
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
		int id=Integer.parseInt(request.getParameter("id"));
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String contact=request.getParameter("contact");
		String address=request.getParameter("address");
		
		User u=new User();
		u.setId(id);
		u.setFname(fname);
		u.setLname(lname);
		u.setEmail(email);
		u.setContact(contact);
		u.setAddress(address);
		
		UserDao udao=new UserDao();
		udao.edituseraddress(u);
		
		/*response.sendRedirect("dashboard.jsp?msg=updateaddress");*/
		
		 RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp?msg=updateaddress");
		 dispatcher.forward(request, response);
	}

}
