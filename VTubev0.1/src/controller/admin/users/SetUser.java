package controller.admin.users;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.User;
import model.dto.Login;

/**
 * Servlet implementation class SetUser
 */
@WebServlet("/SetUser")
public class SetUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetUser() {
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
	
	protected void doCmd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try{
			Login user=new Login();
			
			user.setUser_name(request.getParameter("user_name"));
			user.setUser_email(request.getParameter("user_email"));
			user.setUser_password(request.getParameter("user_password"));
			user.setUser_gender(Integer.parseInt(request.getParameter("user_gender")));
			user.setUser_image(request.getParameter("user_image"));
			user.setUser_type(Integer.parseInt(request.getParameter("user_type")));
			user.setUser_status(Integer.parseInt(request.getParameter("user_status")));
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			if(user.getUser_name()!=""){
				
				if(new User().verifyMail(user.getUser_email())==false){
					
					if(new model.dao.User().setUser(user)==true){
						response.getWriter().write("success");
					}else{
						response.getWriter().write("failed");
					}
					
				}else{
					response.getWriter().write("exist");
				}
				
			}else{
				response.getWriter().write("failed");
			}
			
			
		}catch(Exception e){e.printStackTrace();}
	}

}
