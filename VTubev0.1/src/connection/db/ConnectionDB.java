package connection.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;



public class ConnectionDB {
	public static SimpleDateFormat dat=new SimpleDateFormat("yyyy-MMM-dd");
	private final String URL="jdbc:postgresql://localhost/dbVTube";
	private final String USERNAME="postgres";
	private final String PASSWORD="123";
	private final String DRIVER="org.postgresql.Driver";
	private Connection con=null;
	
	public Connection connected(){
		
		try{
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
}
