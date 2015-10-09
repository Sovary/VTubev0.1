package model.dto;

import java.sql.Date;

public class Login {
	
	private int user_id;
	private String user_name;
	private String user_email;
	private String user_password;
	private int user_gender;
	private String user_image;
	private int user_type;
	private int user_status;
	private Date user_registed;
	public int getUser_id() {
		return user_id;
	}
	public String getUser_name() {
		return user_name;
	}   
	public String getUser_email() {
		return user_email;
	}
	public String getUser_password() {
		return user_password;
	}
	public int getUser_gender() {
		return user_gender;
	}
	public String getUser_image() {
		return user_image;
	}
	public int getUser_type() {
		return user_type;
	}
	public int getUser_status() {
		return user_status;
	}
	public Date getUser_registed() {
		return user_registed;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public void setUser_gender(int user_gender) {
		this.user_gender = user_gender;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}
	public void setUser_registed(Date user_registed) {
		this.user_registed = user_registed;
	}
	
}
