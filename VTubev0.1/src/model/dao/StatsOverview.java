package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.dto.Video;
import connection.db.ConnectionDB;

public class StatsOverview {
	Connection con=null;
	
	public StatsOverview() {
		con=new ConnectionDB().connected();
	}
	
	public int getCountUsers() throws SQLException{
		int countusers;
		try{
			final String sql="SELECT COUNT(user_id) FROM tblusers;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			rs.next();
			countusers=rs.getInt(1);
			/*System.out.println("getCountUser AT dao.admin.StatsOverview");*/
			return countusers;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return 0;
	}
	public int getCountVideo() throws SQLException{
		int countvideo;
		try{
			final String sql="SELECT COUNT(video_id) FROM tblvideo;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			rs.next();
			countvideo=rs.getInt(1);
			/*System.out.println("getCountVideo AT dao.admin.StatsOverview");*/
			return countvideo;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null) con.close();}
		
		return 0;
	}
	public int getCountMainCate() throws SQLException{
		int countmaincate;
		
		try{
			final String sql="SELECT COUNT(main_cate_id) FROM tblmain_categories;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			rs.next();
			countmaincate=rs.getInt(1);
			/*System.out.println("getCountMainCate AT dao.admin.StatsOverview");*/
			return countmaincate;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return 0;
	}
	public int getCountSubCate() throws SQLException{
		int countsubcate;
		
		try{
			final String sql="SELECT COUNT(category_id) FROM tblcategories;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			rs.next();
			countsubcate=rs.getInt(1);
			/*System.out.println("getCountSubCate AT dao.admin.StatsOverview");*/
			return countsubcate;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return 0;
	}
	public int getCountView() throws SQLException{
		int countview;
		
		try{
			final String sql="SELECT SUM(video_view) FROM tblvideo;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			rs.next();
			countview=rs.getInt(1);
			/*System.out.println("getCountView AT dao.admin.StatsOverview");*/
			return countview;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return 0;
	}
	public int getCountLike() throws SQLException{
		int countlike;
		
		try{
			final String sql="SELECT SUM(video_up) FROM tblvideo;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			rs.next();
			countlike=rs.getInt(1);
			/*System.out.println("getCountLike AT dao.admin.StatsOverview");*/
			return countlike;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return 0;
	}
	public int getCountUnlike() throws SQLException{
		int countunlike;
		
		try{
			final String sql="SELECT SUM(video_down) FROM tblvideo;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			rs.next();
			countunlike=rs.getInt(1);
			/*System.out.println("getCountUnlike AT dao.admin.StatsOverview");*/
			return countunlike;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		
		return 0;
	}
	
	public ArrayList<Video> getlistvideo() throws SQLException{
		ArrayList<Video> listvdo=new ArrayList<>();
		
		try{
			final String sql="SELECT * FROM v_dashB_videolist;";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				Video vdo=new Video();
				vdo.setVideo_id(rs.getInt(1));
				vdo.setVideo_title(rs.getString(2));
				vdo.setVideo_category_name(rs.getString(3));
				vdo.setVideo_view(rs.getInt(4));
				vdo.setVideo_status(rs.getInt(5));
				vdo.setVideo_date(ConnectionDB.dat.format(rs.getDate(6)));
				listvdo.add(vdo);
				/*System.out.println("getListVideo AT dao.admin.StatsOverview");*/
			}
			
			return listvdo;
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null) con.close();}
		
		return null;
	}
	
	/*public static void main(String[] args) throws SQLException {
		//int cUser,cVdo,cMain,cSub,cLike,cDis,cView;
		ArrayList<Video> vdo=new StatsOverview().getlistvideo();
		System.out.println("Print vdo");
		for(Video obj : vdo){
			System.out.println(obj.getVideo_title());
		}
		System.out.println("==========");
		System.out.println("User="+new StatsOverview().getCountUsers());
		System.out.println("VDO="+new StatsOverview().getCountVideo());
		System.out.println("Main="+new StatsOverview().getCountMainCate());
		System.out.println("Sub="+new StatsOverview().getCountSubCate());
		System.out.println("Like="+new StatsOverview().getCountLike());
		System.out.println("Dis="+new StatsOverview().getCountUnlike());
		System.out.println("View="+new StatsOverview().getCountView());
		
		
	}*/
}
