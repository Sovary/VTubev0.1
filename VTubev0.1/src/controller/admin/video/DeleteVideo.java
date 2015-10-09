package controller.admin.video;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.Video;
import model.dto.Login;

/**
 * Servlet implementation class DeleteVide
 */
@WebServlet("/DeleteVide")
public class DeleteVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteVideo() {
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
		try{
			
			if(((Login) request.getSession().getAttribute("infoAdmin")).getUser_type()==1){
				
				if(new Video().deleteVideo(Integer.parseInt(request.getParameter("video_id")))==true){
					
					response.getWriter().write("success");
				}else{
					response.getWriter().write("failed");
				}
				
			}else{
				response.getWriter().write("denied");
			}
			
		}catch(Exception e){response.getWriter().write(e.toString());}
		
	}

}
