package slider;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.AdminDao;
import pojo.Category;
import pojo.Slider;

/**
 * Servlet implementation class EditSlider
 */
public class EditSlider extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Slider s=new Slider();
    AdminDao adao=new AdminDao();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		
		s=adao.getSliderById(id);
		HttpSession session=request.getSession();
		session.setAttribute("s", s);
		response.sendRedirect("admin-editslider.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String cname=request.getParameter("cname");
		String tital=request.getParameter("tital");
		String content=request.getParameter("content");
		Part image=request.getPart("image");
		
		AdminDao adao=new AdminDao();
		Category c=adao.getCategoryByName(cname);
		
		s.setId(id);
		s.setCategory(c);
		s.setTital(tital);
		s.setContent(content);
		s.setImage(image.getSubmittedFileName());
		
		adao.Addslider(s);
		
		@SuppressWarnings("deprecation")
		String path = request.getRealPath("image")+File.separator+"Product"+File.separator+image.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = image.getInputStream();
		byte [] data = new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		response.sendRedirect("admin-sliders.jsp");
	}

}
