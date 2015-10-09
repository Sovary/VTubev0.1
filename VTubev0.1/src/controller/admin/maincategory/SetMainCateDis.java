package controller.admin.maincategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.Login;

/**
 * Servlet implementation class SetMainCateDis
 */
@WebServlet("/SetMainCateDis")
public class SetMainCateDis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetMainCateDis() {
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
			if(((Login) request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
				
				request.getRequestDispatcher("addmaincate.jsp").forward(request, response);
				
			}else{
				response.sendRedirect("listmaincate");
			}
			
		}catch(Exception e){response.getWriter().write(e.toString());}
	}

}
