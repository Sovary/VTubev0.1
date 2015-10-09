package controller.admin.subcategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.SubCategory;

/**
 * Servlet implementation class SetSubCategor
 */
@WebServlet("/SetSubCategor")
public class SetSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetSubCategory() {
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
			SubCategory sub=new SubCategory();
			sub.setCategory_name(request.getParameter("category_name").trim());
			sub.setCategory_description(request.getParameter("category_description").trim());
			sub.setMain_cate_id(Integer.parseInt(request.getParameter("main_cate_id").trim()));
			sub.setCategory_index(Integer.parseInt(request.getParameter("category_index").trim()));
			sub.setCategory_status(Integer.parseInt(request.getParameter("category_status").trim()));
			sub.setCategory_image(request.getParameter("category_image").trim());
			
			if(sub.getCategory_name()!=""){
				
				if(new model.dao.SubCategory().verifyMainCateID(sub.getMain_cate_id())==true){
					System.out.println("verify main id");
					if(new model.dao.SubCategory().setSubCategory(sub)==true){
						System.out.println("set sub");
						response.setContentType("text/plain");
						response.setCharacterEncoding("utf-8");
						response.getWriter().write("success");
					}
				}
				//response.getWriter().write("failed");
			}
			//
			
		}catch(Exception e){e.printStackTrace();}
		
		
		

		
		
	}

}
