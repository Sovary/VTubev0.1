package controller.admin.maincategory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.MainCategory;

/**
 * Servlet implementation class SetMainCategory
 */
@WebServlet("/SetMainCategory")
public class SetMainCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetMainCategory() {
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
		MainCategory maincate=new MainCategory();
		
		try{
		maincate.setMain_cate_name(request.getParameter("main_cate_name").trim());
		maincate.setMain_cate_status(Integer.parseInt(request.getParameter("main_cate_status").trim()));
		maincate.setMain_cate_image(request.getParameter("main_cate_image").trim());
		maincate.setMain_cate_index(Integer.parseInt(request.getParameter("main_cate_index").trim()));
		
		if(maincate.getMain_cate_name()!=""){
			if(new model.dao.MainCategory().setMainCate(maincate)==true){
				
				
		                response.setContentType("text/plain");
						response.setCharacterEncoding("utf-8");
						response.getWriter().write("success");
						
			}
		}
		
		}catch(Exception e){e.printStackTrace();}
		
	}

}
