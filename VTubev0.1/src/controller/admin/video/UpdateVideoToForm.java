package controller.admin.video;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.dto.Login;
import model.dto.Video;

/**
 * Servlet implementation class UpdateVideoToForm
 */
@WebServlet("/UpdateVideoToForm")
public class UpdateVideoToForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVideoToForm() {
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
			response.setCharacterEncoding("UTF-8");
		//	if(((Login) request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
				Video video=new model.dao.Video().updatePassToForm(Integer.parseInt(request.getParameter("id")));
				if(video!=null){
			
				request.setAttribute("isCreate", 0);
				request.setAttribute("updateVdo", video);
				request.getRequestDispatcher("updatevdolink.jsp").forward(request, response);
				}else{
					response.sendRedirect("listvdo");
				}
			/*}else{
				response.sendRedirect("listvdo");
			}*/
		}catch(Exception e){e.printStackTrace();}
	}

}
