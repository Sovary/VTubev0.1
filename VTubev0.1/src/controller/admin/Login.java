package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doCmd(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doCmd(request, response);
	}
	
	protected void doCmd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		try{
			model.dto.Login admin=new model.dao.Login().login(username.trim(), password);
			
			if(admin.getUser_password()!=null && admin.getUser_name()!=null && admin.getUser_email()!=null){
				
				response.setContentType("text/plain");
				response.setCharacterEncoding("utf-8");
				String dashboard="html/dashboard";
				response.getWriter().write(dashboard);
				HttpSession session=request.getSession();
				session.setAttribute("infoAdmin", admin);
				session.setMaxInactiveInterval(60*60*24);
			/*	Cookie user=new Cookie("username", admin.getUser_name());
				Cookie pw=new Cookie("password", admin.getUser_password());
				user.setMaxAge(30);
				pw.setMaxAge(30);
				response.addCookie(user);
				response.addCookie(pw);*/
			}
			
		}catch(Exception e){e.printStackTrace();}
	}
	

}
