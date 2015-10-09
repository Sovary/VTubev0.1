package controller.admin.subcategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.MainCategory;
import model.dto.SubCategory;
import controller.admin.maincategory.UploadMainCateImage;

/**
 * Servlet implementation class UpdateSubCategory
 */
@WebServlet("/UpdateSubCategory")
public class UpdateSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSubCategory() {
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
			String cate_name=request.getParameter("category_name").trim();
			
			if(cate_name!=""){
				sub.setCategory_id(Integer.parseInt(request.getParameter("category_id").trim()));
				sub.setCategory_name(cate_name);
				sub.setCategory_description(request.getParameter("category_description").trim());
				sub.setMain_cate_id(Integer.parseInt(request.getParameter("main_cate_id").trim()));
				sub.setCategory_status(Integer.parseInt(request.getParameter("category_status").trim()));
				sub.setCategory_image(request.getParameter("category_image").trim());
				sub.setCategory_index(Integer.parseInt(request.getParameter("category_index").trim()));
				
				if((new model.dao.SubCategory().verifyMainCateID(sub.getMain_cate_id())==true)){
					
					if(new model.dao.SubCategory().updateSubCate(sub)==true){
						
						new UploadSubCateImage().doCmd(request, response);
						response.setCharacterEncoding("utf-8");
						response.setContentType("text/plain");
						response.getWriter().write("success");
							
					}
					
				}
			}
			
			
			

			
		}catch(Exception e){e.printStackTrace();}
	}

}
