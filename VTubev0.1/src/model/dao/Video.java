package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import oracle.jdbc.proxy.annotation.Pre;
import model.dto.MainCategory;
import model.dto.SubCategory;
import connection.db.ConnectionDB;


public class Video {
	Connection con=null;
			
			public Video(){
				con=new ConnectionDB().connected();
			}
	
			public boolean setVideoByLink(model.dto.Video video) throws SQLException{
				
				try{
					final String sql="INSERT INTO tblvideo(category_id,user_id,video_title,video_description,"
							+ "video_url,video_date,video_status,video_index,video_up,video_down,video_view)"
							+ " VALUES (?,?,?,?,?,now(),?,?,0,0,0);";
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setInt(1, video.getCategory_id());
					pst.setInt(2, video.getUser_id());
					pst.setString(3, video.getVideo_title());
					pst.setString(4, video.getVideo_description());
					pst.setString(5, video.getVideo_url());
					pst.setInt(6, video.getVideo_status());
					pst.setInt(7, video.getVideo_index());
					if(pst.executeUpdate()>0){
						return true;
					}
				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				return false;
				
			}
			
			public boolean verifySubCateID(int category_id) throws SQLException{
				
				try{
					final String sql="SELECT category_id FROM tblcategories WHERE category_id=?";
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setInt(1, category_id);
					ResultSet rs=pst.executeQuery();
					while(rs.next()){
						return true;
					}
					
				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				return false;
			}
			public ArrayList<MainCategory> listMainCateInVideo() throws SQLException{
				
				try{
					ArrayList<MainCategory> list=new ArrayList<>();
					final String sql="SELECT main_cate_id, main_cate_name FROM tblmain_categories;";
					PreparedStatement pst=con.prepareStatement(sql);
					ResultSet rs=pst.executeQuery();
					while(rs.next()){
						MainCategory main=new MainCategory();
						main.setMain_cate_id(rs.getInt(1));
						main.setMain_cate_name(rs.getString(2));
						list.add(main);
					}
					return list;
				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				
				return null;
			}
			public ArrayList<SubCategory> listSubCateOfMain(int main_cate_id) throws Exception{
				
				try{
					ArrayList<SubCategory> list=new ArrayList<>();
					final String sql="SELECT category_id, category_name FROM tblcategories WHERE main_cate_id=?";
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setInt(1,main_cate_id);
					ResultSet rs=pst.executeQuery();
					
					while(rs.next()){
						SubCategory sub=new SubCategory();
						sub.setCategory_id(rs.getInt(1));
						sub.setCategory_name(rs.getString(2));
						
						list.add(sub);
					}
					return list;
				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				return null;
			}
			public ArrayList<model.dto.Video> listAllVideo() throws Exception{
				
				
				try{
				
					ArrayList<model.dto.Video> list=new ArrayList<>();
					final String sql="SELECT * FROM v_listallvdo";
					PreparedStatement pst=con.prepareStatement(sql);
					ResultSet rs=pst.executeQuery();
					while(rs.next()){
						model.dto.Video v=new model.dto.Video();
						v.setVideo_id(rs.getInt(1));
						v.setVideo_index(rs.getInt(2));
						v.setVideo_date(ConnectionDB.dat.format(rs.getDate(3)));
						v.setVideo_user_name(rs.getString(4));
						v.setVideo_title(rs.getString(5));
						v.setVideo_url(rs.getString(6));
						v.setVideo_category_name(rs.getString(7));
						v.setVideo_view(rs.getInt(8));
						v.setVideo_up(rs.getInt(9));
						v.setVideo_down(rs.getInt(10));
						v.setVideo_status(rs.getInt(11));
						list.add(v);
					}
					return list;
				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				return null;
			}
			public boolean changeStatusVideo(int video_id, int video_status) throws SQLException{
				
				try{
					final String sql="UPDATE tblvideo SET video_status=? WHERE video_id=?";
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setInt(1, video_status);
					pst.setInt(2, video_id);
					if(pst.executeUpdate()>0){
						return true;
					}

				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				
				
				return false;
				
			}
			public model.dto.Video updatePassToForm(int video_id) throws Exception{
				
				try{
					model.dto.Video video=new model.dto.Video();
					final String sql="SELECT video_id, video_status, video_title,	video_description, video_url, video_index, v.category_id, sub.main_cate_id "
							+ "FROM tblvideo v LEFT JOIN tblcategories sub "
							+ "ON v.category_id = sub.category_id "
							+ "LEFT JOIN tblmain_categories main "
							+ "ON sub.category_id = main.main_cate_id "
							+ "WHERE v.video_id = ?";
					
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setInt(1, video_id);
					ResultSet rs=pst.executeQuery();
					while(rs.next()){
						video.setVideo_id(rs.getInt(1));
						video.setVideo_status(rs.getInt(2));
						video.setVideo_title(rs.getString(3));
						video.setVideo_description(rs.getString(4));
						video.setVideo_url(rs.getString(5));
						video.setVideo_index(rs.getInt(6));
						video.setCategory_id(rs.getInt(7));
						video.setMain_cate_id(rs.getInt(8));
					}
					return video;
					
				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				
				return null;
			}
			public boolean updateVideo(model.dto.Video v) throws Exception{
				
				try{
					
					final String sql="UPDATE tblvideo SET category_id=?,user_id=?,video_title=?,"
							+ "video_description=?, video_url=?, video_date=now(), video_status=?,"
							+ " video_index=? WHERE video_id=?";

					PreparedStatement pst=con.prepareStatement(sql);
					pst.setInt(1, v.getCategory_id());
					pst.setInt(2, v.getUser_id());
					pst.setString(3, v.getVideo_title());
					pst.setString(4, v.getVideo_description());
					pst.setString(5, v.getVideo_url());
					pst.setInt(6, v.getVideo_status());
					pst.setInt(7, v.getVideo_index());
					pst.setInt(8, v.getVideo_id());
					
					if(pst.executeUpdate()>0){
						return true;
					}
				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				
				return false;
				
			}
			public boolean deleteVideo(int video_id) throws Exception{
				
				try{
					final String sql="DELETE FROM tblvideo WHERE video_id=?";
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setInt(1, video_id);
					
					if(pst.executeUpdate()>0){
						return true;
					}
					
				}catch(Exception e){e.printStackTrace();}
				finally{if(con!=null)con.close();}
				return false;
			}
			
			
		
}
