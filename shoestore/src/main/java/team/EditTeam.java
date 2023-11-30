package team;

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
import pojo.Team;

/**
 * Servlet implementation class EditTeam
 */
public class EditTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Team t=new Team();
       AdminDao adao=new AdminDao();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		
		t=adao.getTeamById(id);
		HttpSession session=request.getSession();
		session.setAttribute("t", t);
		response.sendRedirect("admin-editteam.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String position=request.getParameter("position");
		Part img=request.getPart("img");
		String facebook=request.getParameter("facebook");
		String twitter=request.getParameter("twitter");
		String instagram=request.getParameter("instagram");
		
		t.setId(id);
		t.setName(name);
		t.setPosition(position);
		t.setImg(img.getSubmittedFileName());
		t.setFacebook(facebook);
		t.setTwitter(twitter);
		t.setInstagram(instagram);
		
		AdminDao adao=new AdminDao();
		adao.Addteam(t);
		
		@SuppressWarnings("deprecation")
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
