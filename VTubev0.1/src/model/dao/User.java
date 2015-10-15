package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.dto.Login;
import connection.db.ConnectionDB;

public class User {
	Connection con=null;
	
	public User() {
		con=new ConnectionDB().connected();
	}
	
	public boolean setUser(Login user) throws Exception{
		try{
			final String sql="INSERT INTO tblusers(user_name,user_email,user_password,user_gender,user_image,user_type,user_status,user_register) "
					+ "VALUES(?,?,?,?,?,?,?,now())";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, user.getUser_name());
			pst.setString(2, user.getUser_email());
			pst.setString(3, user.getUser_password());
			pst.setInt(4, user.getUser_gender());
			pst.setString(5, user.getUser_image());
			pst.setInt(6, user.getUser_type());
			pst.setInt(7, user.getUser_status());
			if(pst.executeUpdate()>0){
				return true;
			}
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return false;
	}
	public boolean verifyMail(String mail)throws Exception{
		try{
			final String sql="SELECT user_email FROM tblusers WHERE user_email=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, mail);
			ResultSet rs =pst.executeQuery();
			while(rs.next()){
				return true;
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return false;
		
	}
	public ArrayList<Login> listUsers() throws Exception{
		try{
			ArrayList<Login> users=new ArrayList<>();
			final String sql="SELECT user_id,user_name,user_email,user_password,user_gender,user_image,user_type,user_status FROM tblusers;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				Login user=new Login();
				user.setUser_id(rs.getInt(1));
				user.setUser_name(rs.getString(2));
				user.setUser_email(rs.getString(3));
				user.setUser_password(rs.getString(4));
				user.setUser_gender(rs.getInt(5));
				user.setUser_image(rs.getString(6));
				user.setUser_type(rs.getInt(7));
				user.setUser_status(rs.getInt(8));
				users.add(user);
			}
			return users;
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return null;
	}
	
	public boolean changeUserStatus(int user_id ,int user_status)throws Exception{
		try{
			final String sql="UPDATE tblusers SET user_status=? WHERE user_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, user_status);
			pst.setInt(2, user_id);
			if(pst.executeUpdate()>0){
				return true;
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return false;
	}
	public int statusCheck(int user_id) throws Exception{
		
		try{
			final String sql="SELECT user_status FROM tblusers WHERE user_id=? AND user_status=1";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, user_id);
			ResultSet rs =pst.executeQuery();
			while(rs.next()){
				return 1;
			}
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null) con.close();}
		
		return 0;
	}
	public Login updateUserToForm(int user_id)throws Exception{
		
		try{
			Login user=new Login();
			final String sql="SELECT user_name, user_email ,user_gender, user_status, user_type, user_password FROM tblusers WHERE user_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, user_id);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				
				user.setUser_name(rs.getString(1));
				user.setUser_email(rs.getString(2));
				user.setUser_gender(rs.getInt(3));
				user.setUser_status(rs.getInt(4));
				user.setUser_type(rs.getInt(5));
				user.setUser_password(rs.getString(6));
				user.setUser_id(user_id);
			}
			return user;
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return null;
	}
	public boolean updateUserByAdmin(Login user)throws Exception{
		try{
			final String sql="UPDATE tblusers SET user_name=?, user_password=?, user_gender=?, user_status=?, user_type=? WHERE user_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, user.getUser_name());
			
			pst.setString(2, user.getUser_password());
			pst.setInt(3, user.getUser_gender());
			pst.setInt(4, user.getUser_status());
			pst.setInt(5, user.getUser_type());
			pst.setInt(6, user.getUser_id());
			if(pst.executeUpdate()>0){
				return true;
			}
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return false;
	}

}
