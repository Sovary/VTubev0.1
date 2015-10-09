package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.jdbc.proxy.annotation.Pre;
import connection.db.ConnectionDB;

public class MainCategory {
	Connection con=null;
	public MainCategory() {
		con=new ConnectionDB().connected();
	}
	
	public boolean setMainCate(model.dto.MainCategory main) throws SQLException{
		
		
		try{
			final String sql="INSERT INTO tblmain_categories(main_cate_name, main_cate_status, main_cate_image, main_cate_index) VALUES(?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, main.getMain_cate_name());
			pst.setInt(2, main.getMain_cate_status());
			pst.setString(3, main.getMain_cate_image());
			pst.setInt(4, main.getMain_cate_index());
			if(pst.executeUpdate()>0){
				return true;
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return false;
	}
	public boolean updateMainCate(model.dto.MainCategory main) throws SQLException{
		
		try{
			final String sql="UPDATE tblmain_categories SET main_cate_name=?, main_cate_status=?, main_cate_image=?, main_cate_index=? WHERE main_cate_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, main.getMain_cate_name());
			pst.setInt(2, main.getMain_cate_status());
			pst.setString(3, main.getMain_cate_image());
			pst.setInt(4, main.getMain_cate_index());
			pst.setInt(5, main.getMain_cate_id());
			if(pst.executeUpdate()>0){
				return true;
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return false;
	}
	public model.dto.MainCategory updatePassToForm(int main_cate_id) throws SQLException{
		
		model.dto.MainCategory main=new model.dto.MainCategory();
		try{
			final String sql="SELECT * FROM tblmain_categories WHERE main_cate_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, main_cate_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				main.setMain_cate_id(rs.getInt(1));
				main.setMain_cate_name(rs.getString(2));
				main.setMain_cate_status(rs.getInt(3));
				main.setMain_cate_image(rs.getString(4));
				main.setMain_cate_index(rs.getInt(5));
			}
			return main;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return null;
		
	}
	public String deleteMainCate(int maincate_id) throws SQLException{
		
		try{
			final String sql="DELETE FROM tblmain_categories WHERE main_cate_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, maincate_id);
			if(pst.executeUpdate()>0){
				return "success";
			}
			
		}catch(Exception e){e.printStackTrace(); return "error";}
		finally{if(con!=null)con.close();}
		
		return "failed";
	}
	
	
	public ArrayList<model.dto.MainCategory> getListMain() throws SQLException{
		ArrayList<model.dto.MainCategory> listmain=new ArrayList<>();
		
		try{
			final String sql="SELECT * FROM v_listmaincate;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				model.dto.MainCategory main=new model.dto.MainCategory();
				main.setMain_cate_id(rs.getInt(1));
				main.setMain_cate_name(rs.getString(2));
				main.setMain_cate_status(rs.getInt(3));
				main.setMain_cate_image(rs.getString(4));
				main.setMain_cate_index(rs.getInt(5));
				main.setMain_countSub(rs.getInt(6));
				listmain.add(main);
				
			}
			return listmain;
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null) con.close();}
		
		return null;
	}
	public boolean changeStatusMain(int main_cate_id,int main_cate_status) throws SQLException{
		
		try{
			final String sql="UPDATE tblmain_categories SET main_cate_status=? WHERE main_cate_id=?; ";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, main_cate_status);
			pst.setInt(2, main_cate_id);
			if(pst.executeUpdate()>0){
				return true;
			}
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return false;
	}
	
	
}
