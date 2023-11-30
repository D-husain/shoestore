package admincontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminValidateOtp
 */
public class AdminValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int value=Integer.parseInt(request.getParameter("otp"));
		HttpSession session=request.getSession();
		int otp=(int)session.getAttribute("otp");
		
		RequestDispatcher dispatcher=null;
		
		if (value==otp) 
		{
			
				request.setAttribute("email", request.getParameter("email"));
				request.setAttribute("message", "success");
			  dispatcher=request.getRequestDispatcher("admin-newpassword.jsp?msg=success");
			dispatcher.forward(request, response);
			
		}
		else
		{
			response.sendRedirect("admin-otp.jsp?msg=wrong");
		}
		
	}

}
