package controller.users.init;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.Users;

/**
 * Servlet implementation class ExpiredUsers
 */
@WebServlet("/expired")
public class ExpiredUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpiredUsers() {
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
			System.out.println("Thread Starting..");;
			while(true){
				System.out.println("Sleeping..!");
				Thread.sleep(15*1000);
				int id=new Users().getexpiredAcc();
				if(id!=0){
					new Users().removeExpAcc(id);
					System.out.println("Users confirmcode expired!");
				}
			}
		}catch(Exception e){e.printStackTrace();}
	}

}
