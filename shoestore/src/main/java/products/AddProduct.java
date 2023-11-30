package products;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.AdminDao;
import pojo.Category;
import pojo.Product;

/**
 * Servlet implementation class AddProduct
 */
@MultipartConfig
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pname=request.getParameter("pname");
		String cname=request.getParameter("cname");
		int size=Integer.parseInt(request.getParameter("size"));
		String desc=request.getParameter("description");
		String info=request.getParameter("info");
		int qty=Integer.parseInt(request.getParameter("qty"));
		float price=Float.parseFloat(request.getParameter("price"));
		float dprice=Float.parseFloat(request.getParameter("dprice"));
		String availability=request.getParameter("availability");
		Part image1=request.getPart("image1");
		Part image2=request.getPart("image2");
		Part image3=request.getPart("image3");
		Part image4=request.getPart("image4");
		
		Product p=new Product();
		AdminDao adao=new AdminDao();
		Category c=adao.getCategoryByName(cname);
		
		p.setPname(pname);
		p.setCategory(c);
		p.setSize(size);
		p.setDescription(desc);
		p.setInfo(info);
		p.setQty(qty);
		p.setPrice(price);
		p.setDprice(dprice);
		p.setAvailability(availability);
		p.setImage1(image1.getSubmittedFileName());
		p.setImage2(image2.getSubmittedFileName());
		p.setImage3(image3.getSubmittedFileName());
		p.setImage4(image4.getSubmittedFileName());
		
		adao.AddProduct(p);
		
		String path = request.getRealPath("image")+File.separator+"Product"+File.separator+image1.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = image1.getInputStream();
		byte [] data = new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		
		String path1 = request.getRealPath("image")+File.separator+"Product"+File.separator+image2.getSubmittedFileName();
		System.out.println(path1);
		FileOutputStream fos1 = new FileOutputStream(path1);
		InputStream is1 = image2.getInputStream();
		byte [] data2 = new byte[is1.available()];
		is1.read(data2);
		fos1.write(data2);
		fos1.close();
		

		String path2 = request.getRealPath("image")+File.separator+"Product"+File.separator+image3.getSubmittedFileName();
		System.out.println(path2);
		FileOutputStream fos2 = new FileOutputStream(path2);
		InputStream is2 = image3.getInputStream();
		byte [] data3 = new byte[is2.available()];
		is2.read(data3);
		fos2.write(data3);
		fos2.close();
		

		String path3 = request.getRealPath("image")+File.separator+"Product"+File.separator+image4.getSubmittedFileName();
		System.out.println(path3);
		FileOutputStream fos3 = new FileOutputStream(path3);
		InputStream is3 = image4.getInputStream();
		byte [] data4 = new byte[is3.available()];
		is3.read(data4);
		fos3.write(data4);
		fos3.close();
		
	     RequestDispatcher rd=request.getRequestDispatcher("admin-products.jsp");
	     rd.forward(request,response);
		
	}

}
