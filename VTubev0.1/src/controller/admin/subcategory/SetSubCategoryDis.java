package controller.admin.subcategory;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.Login;
import model.dto.MainCategory;

/**
 * Servlet implementation class SetSubCategory
 */
@WebServlet("/SetSubCategory")
public class SetSubCategoryDis extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetSubCategoryDis() {
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
			if((((Login) request.getSession().getAttribute("infoAdmin")).getUser_type()==1)){
				//List For ComboBox
				ArrayList<MainCategory> listmain=new model.dao.MainCategory().getListMain();
				request.setAttribute("listMainCateAdmin", listmain);
				request.getRequestDispatcher("addsubcate.jsp").forward(request, response);
			}else{
				response.sendRedirect("listsubcate");
			}
			
		}catch(Exception e){e.printStackTrace();}
	}

}
