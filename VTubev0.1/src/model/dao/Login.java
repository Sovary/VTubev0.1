package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;






import connection.db.ConnectionDB;

public class Login {
	 Connection con=null;
	public Login(){
		con=new ConnectionDB().connected();
	}
	
	public  model.dto.Login login(String username,String password) throws SQLException{
		
		try{
			model.dto.Login infoUser=new model.dto.Login();
			final String sql="SELECT * FROM tblusers WHERE (user_name=? OR user_email=?) AND (user_type =1 OR user_type=2) AND user_status=1 AND user_password=?;";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, username);
			pst.setString(3, password);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()){
				
				infoUser.setUser_id(rs.getInt(1));
				infoUser.setUser_name(rs.getString(2));
				infoUser.setUser_email(rs.getString(3));
				infoUser.setUser_password(rs.getString(4));
				infoUser.setUser_gender(rs.getInt(5));
				infoUser.setUser_image(rs.getString(6));
				infoUser.setUser_type(rs.getInt(7));
				infoUser.setUser_status(rs.getInt(8));
				infoUser.setUser_registed(rs.getDate(9));
			
				System.out.println(infoUser.getUser_email()+" AT model.dao.Login");
				
			}
			return infoUser;
		}catch(Exception e){e.printStackTrace();}
		finally{
			if(con!=null){con.close();}
		}
		
		return null;
	}
	
	
}
