package FacebookLogin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.User;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;

/**
 * Servlet implementation class FacebookCallbackServlet
 */
public class FacebookCallbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String APP_ID = "1071344487583544";
	private static final String APP_SECRET = "8f7ea577f9ab6721b1995fe0a9ed3217";
	private static final String REDIRECT_URI = "https://www.facebook.com/";
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
        if (code != null) {
            FacebookClient.AccessToken accessToken = new DefaultFacebookClient(Version.LATEST).obtainUserAccessToken(APP_ID, APP_SECRET, REDIRECT_URI, code);
            String accessTokenString = accessToken.getAccessToken();

            // Use the access token to make API requests to Facebook on behalf of the user
            FacebookClient facebookClient = new DefaultFacebookClient(accessTokenString, Version.LATEST);
            User user = facebookClient.fetchObject("me", User.class);

            // Here you can store the user details in your database or session for further processing
            // For example, you can store the user ID and name in the session:
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect to a success page
            response.sendRedirect("index.jsp");
        } else {
            // Handle the case when the user denied access or there was an error
            response.sendRedirect("login.jsp");
        }
    }
}
