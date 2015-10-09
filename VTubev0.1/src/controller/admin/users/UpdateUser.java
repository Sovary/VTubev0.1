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
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		try{
			
			if(((Login)request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
				
				Login u=new Login();
				u.setUser_name(request.getParameter("user_name"));
				u.setUser_password(request.getParameter("user_password"));
				u.setUser_gender(Integer.parseInt(request.getParameter("user_gender")));
				u.setUser_status(Integer.parseInt(request.getParameter("user_status")));
				u.setUser_type(Integer.parseInt(request.getParameter("user_type")));
				u.setUser_id(Integer.parseInt(request.getParameter("user_id")));
			
				if(new User().updateUserByAdmin(u)==true){
					response.getWriter().write("success");
				}else{
					response.getWriter().write("failed");
				}
				
			}else{
				response.getWriter().write("denied");
			}
			
		}catch(Exception e){e.printStackTrace();/*response.getWriter().write(e.toString());*/}
	}

}
