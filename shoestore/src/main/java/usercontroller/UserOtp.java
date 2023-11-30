package usercontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserOtp
 */
public class UserOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserOtp() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int value=Integer.parseInt(request.getParameter("otp"));
		HttpSession session=request.getSession();
		int otp=(int)session.getAttribute("otp");
		
		RequestDispatcher dispatcher=null;
		
		if (value==otp) 
		{
			
				request.setAttribute("email", request.getParameter("email"));
			  dispatcher=request.getRequestDispatcher("newpassword.jsp?msg=valid");
			dispatcher.forward(request, response);
			
		}
		else
		{
			response.sendRedirect("otp.jsp?msg=wrong");
		}
		
	}

}
