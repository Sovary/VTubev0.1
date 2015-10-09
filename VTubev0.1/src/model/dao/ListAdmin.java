package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;





import connection.db.ConnectionDB;

public class ListAdmin {
	
	Connection con=null;
	
	public ListAdmin() {
		con=new ConnectionDB().connected();
	}
	
	public ArrayList<model.dto.ListAdmin> getListAdmin() throws SQLException{
		ArrayList<model.dto.ListAdmin> listadmins=new ArrayList<>();
		
		try{
			final String sql="SELECT * FROM v_listAdmin";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				model.dto.ListAdmin listadmin=new model.dto.ListAdmin();
				listadmin.setUser_id(rs.getInt(1));
				listadmin.setUser_name(rs.getString(2));
				listadmin.setUser_email(rs.getString(3));
				listadmin.setUser_image(rs.getString(4));
				listadmins.add(listadmin);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{
			if(con!=null){con.close();}
		}
		
		return listadmins;
	}
	

}
