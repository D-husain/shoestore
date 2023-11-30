package review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.UserDao;
import pojo.Product;
import pojo.Reviews;
import pojo.User;

/**
 * Servlet implementation class AddReview
 */
public class AddReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReview() {
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
		int uid=Integer.parseInt(request.getParameter("uid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		String rtital=request.getParameter("rtital");
		int rating=Integer.parseInt(request.getParameter("rate"));
		String review=request.getParameter("review");
		String rdate=request.getParameter("rdate");
		
		Reviews r=new Reviews();
		UserDao udao=new UserDao();
		AdminDao adao=new AdminDao();
		
		User u=udao.getUserById(uid);
		Product p=adao.getProductById(pid);
		
		r.setUser(u);
		r.setProduct(p);
		r.setReviewtitle(rtital);
		r.setRating(rating);
		r.setReview(review);
		r.setReviewdate(rdate);
		
		udao.Addrating(r);
		
		response.sendRedirect("shop.jsp");
	}

}
