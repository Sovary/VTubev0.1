package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



import model.dto.Login;
import connection.db.ConnectionDB;

public class Users {
	Connection con=null;
	public Users() {
		con=new ConnectionDB().connected();
	}
	

	
	public String insertUser(Login user, String contentPath) throws Exception{
		UUID code=UUID.randomUUID();
		String action="http://localhost:8080"+contentPath+"/activate?mail="+user.getUser_email()+"&code="+code+"";
		String msg="<h1 style=\" color:blue;\">អ៊ីម៉ែល ការចុះឈ្មោះ</h1>";
		 msg+="<p>សួស្តី! អ្នកបានទទួល នូវអ៊ីម៉ែលមួយនេះ មានន័យថា​ អ្នកបាន​ធ្វើការចុះឈ្មោះ​នៅលើ គេហទំព័រ http://www.vtube.com ហើយ។"
		 		+ " ពួកយើង​ ចង់ធ្វើការ បញ្ជាក់ថា​អ្នក គឺពិតជា អ្នកដែលបាន​ធ្វើការចុះឈ្មោះក្នុង គេហទំព័រខាងលើពិតមែន។ <i>សារមួយនេះមានសុពលភាពរយៈមួយថ្ងៃ គិតចាប់ពីរយៈពេលបានចុះឈ្មោះ</i>។ "
		 		+ "សូមធ្វើការ ចុចលើប៊ូតុង Activate ​ខាងក្រោមដើម្បីបញ្ជាក់៖";
		 msg+="<a href=\" "+action+"\" style=\"color:#ffffff;font-size:18px;font-weight:bold;"
					+ "font-family:Helvetica,Arial,sans-serif;text-decoration:none;line-height:40px;width:100%;"
					+ "display:inline-block; background-color:#43B8B9; border-radius:10px; text-align:center;\">Activation</a>";
		 msg+="<p style=\" color:red;\"> ប្រសិនបើ អ្នកមិនបានធ្វើការស្នើសុំ ការ Activate នេះទេ។ សូមកុំចុច លើប៊ូតុង  Activation នោះ, ហើយទាក់ទងមកកាន់ពួកយើង តាមរយៈ <br> info@vtube.com </p> សូមអរគុណ៕";
		String email=user.getUser_email();
		String [] to={email};
		try{
			if(!new Users().isExistMail(user.getUser_email())){
				
				final String sql="INSERT INTO tblusers (user_name,user_email,user_password,user_gender, user_image, user_type,user_status,user_register,user_confirmcode) VALUES(?,?,?,?,?,?,?,now(),?)";
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setString(1, user.getUser_name());
				pst.setString(2, user.getUser_email());
				pst.setString(3, user.getUser_password());
				pst.setInt(4, user.getUser_gender());
				pst.setString(5, user.getUser_image());
				pst.setInt(6, user.getUser_type());
				pst.setInt(7, user.getUser_status());
				pst.setString(8, code.toString());
				if(pst.executeUpdate()>0){
					if(new Users().sendMail("powerhacker6889@gmail.com", "onuthonuth", msg, to)){
						System.out.println("mail sent");
						return "success";
					}
				}
			}else{
				return "exist";
			}
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return "failed";
	}
	
	public boolean sendMail(String from,String password, String msg, String to[]){
		String host="smtp.gmail.com";
		Properties props=System.getProperties();
		props.put("mail.smtp.starttls.enable", "true");
		//props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.password", password);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");
		Session session=Session.getDefaultInstance(props);
		
		MimeMessage mimemsg=new MimeMessage(session);
		try {
			mimemsg.setFrom(new InternetAddress(from));
			InternetAddress[] toAddress=new InternetAddress[to.length];
			for(int i=0;i<to.length;i++){
				toAddress[i]=new InternetAddress(to[i]);
			}
			for(int i=0;i<toAddress.length;i++){
				mimemsg.setRecipient(RecipientType.TO, toAddress[i]);
			}
			mimemsg.setSubject("VTube Activation Account");
			mimemsg.setText(msg);
			mimemsg.setContent(msg,"text/html; charset=utf-8");
			Transport transport=session.getTransport("smtp");
			transport.connect(host,from,password);
			transport.sendMessage(mimemsg, mimemsg.getAllRecipients());
			transport.close();
			return true;
			
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	/*public String getConfirmCode(String mail) throws Exception{
		try{
			final String sql="SELECT user_confirmcode FROM tblusers WHERE user_email=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, mail);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
			
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return null;
	}*/
	
	public boolean isExistMail(String mail) throws Exception{
		
		try{
			final String sql="SELECT user_email FROM tblusers WHERE user_email=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, mail);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
				return true;
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
				
		return false;
		
	}
	
	public boolean activateAccount(String mail, String code)throws Exception{
		
		try{
			final String sql="UPDATE  tblusers SET user_status=1, user_confirmcode=null WHERE user_email=? AND user_confirmcode=?;";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, mail);
			pst.setString(2, code);
			if(pst.executeUpdate()>0){
				return true;
			}
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return false;
		
	}
	public int getexpiredAcc() throws Exception{
		try{
			final String sql="SELECT user_id FROM tblusers WHERE user_confirmcode NOTNULL AND user_register < CURRENT_DATE";
			PreparedStatement pst=con.prepareStatement(sql);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			return rs.getInt(1);
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return 0;
	}
	public boolean removeExpAcc(int id) throws Exception{
		try{
			final String sql="DELETE FROM tblusers WHERE user_id=?";
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1, id);
			if(pst.executeUpdate()>0)
				return true;
		}catch(Exception e){e.printStackTrace();}
		finally{if(con!=null)con.close();}
		return false;
	}

}
