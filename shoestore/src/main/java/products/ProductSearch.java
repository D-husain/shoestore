package products;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.Product;
import dao.AdminDao;


public class ProductSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String keyword = request.getParameter("search");
		    List<Product> products =AdminDao.searchProduct(keyword);
		    HttpSession session=request.getSession();
		    session.setAttribute("products", products);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("product-search.jsp");
		    dispatcher.forward(request, response);
		    
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

}
