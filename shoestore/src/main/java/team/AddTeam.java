package team;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import pojo.Team;
import dao.AdminDao;

/**
 * Servlet implementation class AddTeam
 */
public class AddTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTeam() {
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
		String name=request.getParameter("name");
		String position=request.getParameter("position");
		Part img=request.getPart("img");
		String facebook=request.getParameter("facebook");
		String twitter=request.getParameter("twitter");
		String instagram=request.getParameter("instagram");
		
		Team t=new Team();
		t.setName(name);
		t.setPosition(position);
		t.setImg(img.getSubmittedFileName());
		t.setFacebook(facebook);
		t.setTwitter(twitter);
		t.setInstagram(instagram);
		
		AdminDao adao=new AdminDao();
		adao.Addteam(t);
		
		String path = request.getRealPath("image")+File.separator+"Product"+File.separator+img.getSubmittedFileName();
		System.out.println(path);
		FileOutputStream fos = new FileOutputStream(path);
		InputStream is = img.getInputStream();
		byte [] data = new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		response.sendRedirect("admin-teams.jsp");
	}

}
