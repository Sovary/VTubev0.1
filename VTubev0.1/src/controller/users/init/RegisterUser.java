package controller.users.init;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.Users;
import model.dto.Login;

public class RegisterUser extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doCmd(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doCmd(req, resp);
	}
	protected void doCmd(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try{
			resp.setContentType("text/plain");
			resp.setCharacterEncoding("UTF-8");
			System.out.println("Starting...mail");
			Login user=new Login();
			user.setUser_name(req.getParameter("username"));
			user.setUser_email(req.getParameter("email"));
			user.setUser_password(req.getParameter("pwd"));
			user.setUser_gender(Integer.parseInt(req.getParameter("gender")));
			user.setUser_image("avatar.jpg");
			user.setUser_type(3);
			user.setUser_status(0);
			String rs=new Users().insertUser(user, req.getContextPath());
			System.out.println(rs+" mail");
			if(rs=="success"){
				resp.getWriter().write("success");
			}else if(rs=="exist"){
				resp.getWriter().write("exist");
			}else{
				resp.getWriter().write("failed");
			}
		}catch(Exception e){e.printStackTrace();}
	}
	
}
