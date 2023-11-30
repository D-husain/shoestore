package admincontroller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ProjectConn;


/**
 * Servlet implementation class AdminNewPassword
 */
public class AdminNewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNewPassword() {
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

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Connection con=ProjectConn.createConnection();
				PreparedStatement pst = con.prepareStatement("update admin set password = ? where email = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("msg", "Password Change Success");
					RequestDispatcher rd=request.getRequestDispatcher("admin-login.jsp?msg=change");
					rd.forward(request, response);
				} else {
					request.setAttribute("msg", "resetFailed");
					RequestDispatcher rd = request.getRequestDispatcher("admin-newpassword.jsp");
					rd.include(request, response);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else
		{
			response.sendRedirect("admin-newpassword.jsp?msg=notmatch");
		}
	}
}
