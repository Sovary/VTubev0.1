package controller.admin.maincategory;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadMainCateImage
 */
@WebServlet("/UploadMainCateImage")
public class UploadMainCateImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadMainCateImage() {
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
			
			
			final String UPLOAD_DIRECTORY = request.getServletContext().getRealPath("images/category_images");
			
	        List<FileItem> multiparts = new ServletFileUpload(
	                                 new DiskFileItemFactory()).parseRequest(request);
	      
	        for(FileItem item : multiparts){
	            if(!item.isFormField()){
	                String name = new File(item.getName()).getName();
	                item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
	                
	            }
	        }
	        response.setContentType("text/plain");
	        response.setCharacterEncoding("utf-8");
	        response.getWriter().write("success");
			
		}catch(Exception e){e.printStackTrace();}
	}

}
