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
 * Servlet implementation class DeleteMainCategory
 */
@WebServlet("/DeleteMainCategory")
public class DeleteMainCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMainCategory() {
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
			//System.out.println(new MainCategory().deleteMainCate(Integer.parseInt(request.getParameter("main_cate_id"))));
			response.setContentType("text/plain");
			response.setCharacterEncoding("utf-8");
			if(((Login)request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
				String check=new MainCategory().deleteMainCate(Integer.parseInt(request.getParameter("main_cate_id")));
				if(check=="success"){
					/*final String DIRECTORY = request.getServletContext().getRealPath("images/category_images/");
					String pathname=request.getParameter("main_cate_image");
					java.io.File img=new java.io.File(DIRECTORY+"/"+pathname);
					System.out.println("controller.admin.maincategory.DeleteMainCategory "+img);
					img.delete();*/
					
					response.getWriter().write("success");
					
				}else if(check=="failed"){
					response.getWriter().write("failed");
				}else{
					response.getWriter().write("error");
				}
			}else{
				response.getWriter().write("denied");
			}
					
					

					
			
			/*request.getRequestDispatcher("listmaincate.jsp").forward(request, response);*/
		}catch(Exception e){response.getWriter().write(e.toString());}
	}

}
