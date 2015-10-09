package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.dto.ListSubCategory;
import oracle.jdbc.proxy.annotation.Pre;
import connection.db.ConnectionDB;

public class SubCategory {
 
	Connection con=null;
	public SubCategory() {
		con=new ConnectionDB().connected();
	}
	public boolean setSubCategory(model.dto.SubCategory sub) throws SQLException{
		
		try{
			final String sql="INSERT INTO tblcategories(category_name,category_description,main_cate_id,category_status,category_index,category_image) VALUES(?,?,?,?,?,?);";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, sub.getCategory_name());
			pst.setString(2, sub.getCategory_description());
			pst.setInt(3,sub.getMain_cate_id());
			pst.setInt(4, sub.getCategory_status());
			pst.setInt(5, sub.getCategory_index());
			pst.setString(6, sub.getCategory_image());
			
			if(pst.executeUpdate()>0){
				return true;
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return false;
		
	}
	public boolean verifyMainCateID(int mainID) throws SQLException{
		
		try{
			
			final String sql="SELECT main_cate_id FROM tblmain_categories WHERE main_cate_id=?;";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, mainID);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
			
				return true;
			}
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null){con.close();}}
		
		return false;
	}
	public ArrayList<ListSubCategory> listSubCategory() throws SQLException{
		try{
			ArrayList<ListSubCategory> list=new ArrayList<>();
			final String sql="SELECT * FROM v_listsubcate;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				ListSubCategory listall=new ListSubCategory();
				listall.setCategory_id(rs.getInt(1));
				listall.setCategory_name(rs.getString(2));
				listall.setCategory_description(rs.getString(3));
				listall.setCategory_status(rs.getInt(4));
				listall.setCategory_index(rs.getInt(5));
				listall.setCategory_image(rs.getString(6));
				listall.setMain_cate_name(rs.getString(7));
				listall.setCount_video_each_sub(rs.getInt(8));
				list.add(listall);
				
			}
			return list;
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return null;
		
	}
	public boolean changeStatusSub(int category_id, int category_status) throws SQLException{
		
		try{
			final String sql="UPDATE tblcategories SET category_status=? WHERE category_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, category_status);
			pst.setInt(2, category_id);
			if(pst.executeUpdate()>0){
				return true;
			}

		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		
		return false;
		
	}
	public String deleteSubCate(int category_id) throws SQLException{
		
		try{
			final String sql="DELETE FROM tblcategories WHERE category_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, category_id);
			if(pst.executeUpdate()>0){
				return "success";
			}
			
		}catch(Exception e){ return "error";}
		finally{if(con!=null)con.close();}
		
		return "failed";
	}	
	
	public model.dto.SubCategory updatePassToForm(int category_id) throws SQLException{
		
		model.dto.SubCategory sub=new model.dto.SubCategory();
		try{
			final String sql="SELECT sub.category_id, sub.category_name, sub.category_description, main.main_cate_name, "
					+ "main.main_cate_id,sub.category_status,category_index,sub.category_image "
					+ "FROM tblcategories sub JOIN tblmain_categories main "
					+ "ON sub.main_cate_id=main.main_cate_id WHERE sub.category_id=?;";
			
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, category_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				sub.setCategory_id(rs.getInt(1));
				sub.setCategory_name(rs.getString(2));
				sub.setCategory_description(rs.getString(3));
				sub.setMain_cate_name(rs.getString(4));
				sub.setMain_cate_id(rs.getInt(5));
				sub.setCategory_status(rs.getInt(6));
				sub.setCategory_index(rs.getInt(7));
				sub.setCategory_image(rs.getString(8));
			}
			return sub;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return null;
		
	}
	public boolean updateSubCate(model.dto.SubCategory sub) throws SQLException{
		
		try{
			final String sql="UPDATE tblcategories SET category_name=?, category_description=?, main_cate_id=?, category_status=?,category_index=?,category_image=? WHERE category_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, sub.getCategory_name());
			pst.setString(2, sub.getCategory_description());
			pst.setInt(3, sub.getMain_cate_id());
			pst.setInt(4, sub.getCategory_status());
			pst.setInt(5, sub.getCategory_index());
			pst.setString(6, sub.getCategory_image());
			pst.setInt(7, sub.getCategory_id());
			if(pst.executeUpdate()>0){
				return true;
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return false;
	}
}
