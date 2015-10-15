package controller.users.init;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.Users;

/**
 * Servlet implementation class ActivationUser
 */
@WebServlet("/ActivationUser")
public class ActivationUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivationUser() {
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
			String mail=request.getParameter("mail");
			String code=request.getParameter("code");
			if(new Users().activateAccount(mail, code)){
				request.setAttribute("isActivated", 1);
			}else{
				request.setAttribute("isActivated", 0);
			}
			request.getRequestDispatcher("activate.jsp").forward(request, response);
			
		}catch(Exception e){e.printStackTrace();}
	}

}
