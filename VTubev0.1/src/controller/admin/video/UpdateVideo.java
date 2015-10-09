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
 * Servlet implementation class UpdateVideo
 */
@WebServlet("/UpdateVideo")
public class UpdateVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVideo() {
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
			
			model.dto.Video v=new model.dto.Video();
			
			v.setVideo_title(request.getParameter("video_title"));
			v.setVideo_description(request.getParameter("video_description"));
			v.setVideo_url(request.getParameter("video_url"));
			v.setVideo_status(Integer.parseInt(request.getParameter("video_status")));
			v.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
			v.setVideo_index(Integer.parseInt(request.getParameter("video_index")));
			v.setVideo_id(Integer.parseInt(request.getParameter("video_id")));
			v.setUser_id(((Login)request.getSession().getAttribute("infoAdmin")).getUser_id());
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			if(new Video().verifySubCateID(v.getCategory_id())==true){
				
				if(v.getVideo_title()!="" && v.getVideo_url()!=""){
					
					if(new Video().updateVideo(v)==true){
						
						response.getWriter().write("success");
					}
					
				}
				
			}else{
				response.getWriter().write("failed");
			}
			
		}catch(Exception e){e.printStackTrace();}
		
		
	}

}
