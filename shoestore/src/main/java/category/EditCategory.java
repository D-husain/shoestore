package category;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.AdminDao;
import pojo.Category;

/**
 * Servlet implementation class EditCategory
 */
@MultipartConfig
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Category c=new Category();
       AdminDao adao=new AdminDao();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		
		c=adao.getCategoryById(id);
		HttpSession session=request.getSession();
		session.setAttribute("c", c);
		response.sendRedirect("admin-editcategory.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String cname = request.getParameter("cname");
		Part cimage=request.getPart("cimage");
		
		c.setId(id);
		c.setCname(cname);
		c.setCimage(cimage.getSubmittedFileName());
		
		adao.AddCategory(c);
		
		@SuppressWarnings("deprecation")
		String path = request.getRealPath("image")+File.separator+"Product"+File.separator+cimage.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = cimage.getInputStream();
		byte [] data = new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		response.sendRedirect("admin-categories.jsp");
	     
	}

}
