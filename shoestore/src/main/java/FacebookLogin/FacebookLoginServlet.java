package FacebookLogin;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FacebookLoginServlet
 */
public class FacebookLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String APP_ID = "1071344487583544";
	@SuppressWarnings("unused")
	private static final String APP_SECRET = "8f7ea577f9ab6721b1995fe0a9ed3217";
	private static final String REDIRECT_URI = "https://www.facebook.com/";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String loginUrl = "https://www.facebook.com/v12.0/dialog/oauth?client_id=" + APP_ID + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8");
        response.sendRedirect(loginUrl);
	}

}
