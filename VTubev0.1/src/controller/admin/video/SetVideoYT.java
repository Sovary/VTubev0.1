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
 * Servlet implementation class SetVideoY
 */
@WebServlet("/SetVideoY")
public class SetVideoYT extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetVideoYT() {
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
			
			/*request.getParameter("video_url").trim()*/
			
			model.dto.Video video=new model.dto.Video();
			video.setVideo_title(request.getParameter("video_title").trim());
			video.setVideo_description(request.getParameter("video_description").trim());
			
			video.setVideo_url(request.getParameter("video_url"));
			video.setVideo_status(Integer.parseInt(request.getParameter("video_status").trim()));
			video.setCategory_id(Integer.parseInt(request.getParameter("category_id").trim()));
			video.setVideo_index(Integer.parseInt(request.getParameter("video_index").trim()));
			video.setUser_id(((Login)request.getSession().getAttribute("infoAdmin")).getUser_id());
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			if(video.getVideo_title()!=""){
				
				if(new Video().verifySubCateID(video.getCategory_id())==true){
					
					if(new Video().setVideoByLink(video)==true){
						
						response.getWriter().write("success");
					}
				}
			}else{
				response.getWriter().write("failed");
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
