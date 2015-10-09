package model.dto;

import java.sql.Date;





public class Video {
	private int video_id;
	private int category_id;
	private String video_category_name; 
	private int user_id;
	private String video_user_name;
	private String video_title;
	private String video_description;
	private String video_url;
	private int video_up;
	private int video_down;
	private int video_view;
	private String video_date;
	private int video_status;
	private int video_index;
	private int main_cate_id;
	
	
	public Video() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getCategory_id() {
		return category_id;
	}
	public String getVideo_category_name() {
		return video_category_name;
	}
	public int getUser_id() {
		return user_id;
	}
	public String getVideo_user_name() {
		return video_user_name;
	}
	public String getVideo_title() {
		return video_title;
	}
	public String getVideo_description() {
		return video_description;
	}
	public String getVideo_url() {
		return video_url;
	}
	public int getVideo_up() {
		return video_up;
	}
	public int getVideo_down() {
		return video_down;
	}
	public int getVideo_view() {
		return video_view;
	}
	
	public int getVideo_status() {
		return video_status;
	}
	public int getVideo_index() {
		return video_index;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public void setVideo_category_name(String video_category_name) {
		this.video_category_name = video_category_name;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public void setVideo_user_name(String video_user_name) {
		this.video_user_name = video_user_name;
	}
	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}
	public void setVideo_description(String video_description) {
		this.video_description = video_description;
	}
	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}
	public void setVideo_up(int video_up) {
		this.video_up = video_up;
	}
	public void setVideo_down(int video_down) {
		this.video_down = video_down;
	}
	public void setVideo_view(int video_view) {
		this.video_view = video_view;
	}
	public void setVideo_status(int video_status) {
		this.video_status = video_status;
	}
	public void setVideo_index(int video_index) {
		this.video_index = video_index;
	}


	public int getVideo_id() {
		return video_id;
	}


	public String getVideo_date() {
		return video_date;
	}


	public void setVideo_id(int video_id) {
		this.video_id = video_id;
	}


	public void setVideo_date(String video_date) {
		this.video_date = video_date;
	}


	public int getMain_cate_id() {
		return main_cate_id;
	}


	public void setMain_cate_id(int main_cate_id) {
		this.main_cate_id = main_cate_id;
	}
	
	
}
