package controller.admin.subcategory;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.SubCategory;
import model.dao.User;
import model.dto.Login;

/**
 * Servlet implementation class ListSubCategory
 */
@WebServlet("/ListSubCategory")
public class ListSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListSubCategory() {
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
			
			ArrayList<model.dto.ListSubCategory> list=new SubCategory().listSubCategory();
			
			request.setAttribute("listSubCategory", list);
			request.getRequestDispatcher("listsubcate.jsp").forward(request, response);
		}catch(Exception e){e.printStackTrace();}

		
	}

}
