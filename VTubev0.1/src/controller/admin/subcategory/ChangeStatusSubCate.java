package controller.admin.subcategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MainCategory;
import model.dao.SubCategory;

/**
 * Servlet implementation class ChangeStatusSubCate
 */
@WebServlet("/ChangeStatusSubCate")
public class ChangeStatusSubCate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatusSubCate() {
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
		int category_id=Integer.parseInt(request.getParameter("category_id"));
		int category_status=Integer.parseInt(request.getParameter("category_status"));
		
		try{
			if(new SubCategory().changeStatusSub(category_id, category_status)==true){
				response.setContentType("text/plain");
				response.setCharacterEncoding("utf-8");
				response.getWriter().write("success");
			}
			
			
		}catch(Exception e){e.printStackTrace();}
	}

}
