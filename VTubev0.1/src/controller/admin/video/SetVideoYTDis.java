package controller.admin.video;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.Login;

/**
 * Servlet implementation class SetVideoYTDis
 */
@WebServlet("/SetVideoYTDis")
public class SetVideoYTDis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetVideoYTDis() {
        super();
        
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
				
				request.getRequestDispatcher("addvdoyt.jsp").forward(request, response);
				
			}else{
				response.sendRedirect("listvdo");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
