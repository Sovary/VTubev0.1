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
 * Servlet implementation class UpdateUserToForm
 */
@WebServlet("/UpdateUserToForm")
public class UpdateUserToForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserToForm() {
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
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		try{
			if(((Login) request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
				Login user=new User().updateUserToForm(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("updateUserToForm", user);
				request.setAttribute("isCreate", 0);
				request.getRequestDispatcher("adduser.jsp").forward(request, response);
			}else{
				response.sendRedirect("listusers");
			}
		}catch(Exception e){response.getWriter().write(e.toString());}
	}

}
