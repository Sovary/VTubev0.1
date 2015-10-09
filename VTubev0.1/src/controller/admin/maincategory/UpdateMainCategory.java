package controller.admin.maincategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dto.Login;
import model.dto.MainCategory;

/**
 * Servlet implementation class UpdateMainCategory
 */
@WebServlet("/UpdateMainCategory")
public class UpdateMainCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMainCategory() {
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		
		try{
			if(((Login) request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
				
				MainCategory main=new MainCategory();
				String cate_name=request.getParameter("main_cate_name").trim();
				
				if(cate_name!=""){
					main.setMain_cate_id(Integer.parseInt(request.getParameter("main_cate_id").trim()));
					main.setMain_cate_name(cate_name);
					main.setMain_cate_status(Integer.parseInt(request.getParameter("main_cate_status").trim()));
					main.setMain_cate_image(request.getParameter("main_cate_image").trim());
					main.setMain_cate_index(Integer.parseInt(request.getParameter("main_cate_index").trim()));
					if(new model.dao.MainCategory().updateMainCate(main)==true){
						
						new UploadMainCateImage().doCmd(request, response);
						
						response.getWriter().write("success");
							
					}
				}
				
			}else{
				response.getWriter().write("denied");
			}
			
		}catch(Exception e){response.getWriter().write(e.toString());}
	}

}
