package controller.admin.maincategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MainCategory;
import model.dto.Login;

/**
 * Servlet implementation class UpdateMainCateToForm
 */
@WebServlet("/UpdateMainCateToForm")
public class UpdateMainCateToForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMainCateToForm() {
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
		response.setCharacterEncoding("utf-8");
		
		try{
			
		
		if(((Login)request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
			
			model.dto.MainCategory main= new MainCategory().updatePassToForm(Integer.parseInt(request.getParameter("id")));
			if(main!=null){
				
				request.setAttribute("isCreate", 0);//check for update or create
				request.setAttribute("updatePassToFormAdminMainCate", main);
				request.getRequestDispatcher("addmaincate").forward(request, response);
				
			}else{
				response.getWriter().write("failed");
			}
			
		}else{
			response.getWriter().write("denied");
			
			response.sendRedirect("listmaincate");
		}
			
		
			
		}catch(Exception e){response.getWriter().write(e.toString());};
		
	}

}
