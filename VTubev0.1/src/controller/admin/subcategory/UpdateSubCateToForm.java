package controller.admin.subcategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MainCategory;
import model.dto.Login;
import model.dto.SubCategory;

/**
 * Servlet implementation class UpdateSubCateToForm
 */
@WebServlet("/UpdateSubCateToForm")
public class UpdateSubCateToForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSubCateToForm() {
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
			
		if(((Login) request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
			
			SubCategory sub=new model.dao.SubCategory().updatePassToForm(Integer.parseInt(request.getParameter("id")));
			if(sub!=null){
				
				request.setAttribute("isCreate", 0);//check for update or create
				request.setAttribute("updatePassToFormAdminSubCate", sub);
				request.getRequestDispatcher("addsubcate").forward(request, response);
				
			}
			
		}else{
			response.sendRedirect("listsubcate");
		}
			
		}catch(Exception e){e.printStackTrace();};
		
	}

}
