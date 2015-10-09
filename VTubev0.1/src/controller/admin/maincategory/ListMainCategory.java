package controller.admin.maincategory;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.Login;
import model.dto.MainCategory;

/**
 * Servlet implementation class ListMainCategory
 */
@WebServlet("/ListMainCategory")
public class ListMainCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListMainCategory() {
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
		try {
			
				ArrayList<MainCategory> listmain=new model.dao.MainCategory().getListMain();
				
				request.setAttribute("listMainCateAdmin", listmain);
				request.getRequestDispatcher("listmaincate.jsp").forward(request, response);
				
		} catch (SQLException e) {response.getWriter().write(e.toString());}
		
	}

}
