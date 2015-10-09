package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StatsOverview;
import model.dao.User;
import model.dto.ListAdmin;
import model.dto.Login;
import model.dto.Video;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
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
			ArrayList<ListAdmin> listadmins= new model.dao.ListAdmin().getListAdmin();
			ArrayList<Video> listvideo=new StatsOverview().getlistvideo();
			
				System.out.println("List admin AT controller.admin.Dashboard");
				request.setAttribute("listAdmins", listadmins);
				request.setAttribute("listVideoOverview", listvideo);
				request.setAttribute("countUser", new StatsOverview().getCountUsers());
				request.setAttribute("countVideo", new StatsOverview().getCountVideo());
				request.setAttribute("countMainCate", new StatsOverview().getCountMainCate());
				request.setAttribute("countSubCate", new StatsOverview().getCountSubCate());
				request.setAttribute("countLike", new StatsOverview().getCountLike());
				request.setAttribute("countUnlike", new StatsOverview().getCountUnlike());
				request.setAttribute("countView", new StatsOverview().getCountView());
				
				request.getRequestDispatcher("dashboard.jsp").forward(request, response);
				
				
			
			
			
		}catch(Exception e){e.printStackTrace();}
	}

}
