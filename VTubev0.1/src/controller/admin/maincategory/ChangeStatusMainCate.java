package controller.admin.maincategory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.MainCategory;

/**
 * Servlet implementation class ChangeStatusMainCate
 */
@WebServlet("/ChangeStatusMainCate")
public class ChangeStatusMainCate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatusMainCate() {
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
		int main_cate_id=Integer.parseInt(request.getParameter("main_cate_id"));
		int main_cate_status=Integer.parseInt(request.getParameter("main_cate_status"));
		
		try{
			if(new MainCategory().changeStatusMain(main_cate_id, main_cate_status)==true){
				response.setContentType("text/plain");
				response.setCharacterEncoding("utf-8");
				response.getWriter().write("success");
			}
			
			
		}catch(Exception e){e.printStackTrace();}
		
		
		
	}

}
