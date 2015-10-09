package controller.admin.subcategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MainCategory;
import model.dao.SubCategory;
import model.dto.Login;

/**
 * Servlet implementation class DeleteSubCategory
 */
@WebServlet("/DeleteSubCategory")
public class DeleteSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSubCategory() {
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
				String check=new SubCategory().deleteSubCate(Integer.parseInt(request.getParameter("category_id")));
				
				if(check=="success"){
					response.getWriter().write("success");
				}else if(check=="failed"){
					response.getWriter().write("failed");
				}else{
					response.getWriter().write("error");
				}
			}else{
				response.getWriter().write("denied");
			}
			
			//request.getRequestDispatcher("listsubcate.jsp").forward(request, response);
		}catch(Exception e){response.getWriter().write(e.toString());}
	}

}
