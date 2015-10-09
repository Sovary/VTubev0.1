package controller.admin;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.User;
import model.dto.Login;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/AdminFilter")
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try{
			
		((HttpServletResponse) response).setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		((HttpServletResponse) response).setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		((HttpServletResponse) response).setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		((HttpServletResponse) response).setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
		HttpSession session= ((HttpServletRequest)request).getSession();
		
			if(session.getAttribute("infoAdmin")!=null){
				
				model.dto.Login infoAdmin= (model.dto.Login) session.getAttribute("infoAdmin");
			
				if(infoAdmin.getUser_type()==1 || infoAdmin.getUser_type()==2){
					try {
						if(new User().statusCheck(((Login) ((HttpServletRequest) request).getSession().getAttribute("infoAdmin")).getUser_id())==0){
							((HttpServletRequest) request).getSession().removeAttribute("infoAdmin");
							
							((HttpServletResponse) response).sendRedirect("logout");
						}else{
							chain.doFilter(request, response);
							System.out.println("Admin Authentication AT controller.admin.AdminFilter");
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
						
						
					
				}else{
					((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/admin");
				}
			   
			}else{
				((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/admin");
			}
		
		
		}catch(Exception e){e.printStackTrace();}
		finally{
			
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	
}
