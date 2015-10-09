package model.dto;

public class SubCategory {
	private int category_id;
	private String category_name;
	private String category_description;
	private int main_cate_id;
	private String main_cate_name;
	private int category_status;
	private int category_index;
	private String category_image;
	public int getCategory_id() {
		return category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public String getCategory_description() {
		return category_description;
	}
	public int getMain_cate_id() {
		return main_cate_id;
	}
	public int getCategory_status() {
		return category_status;
	}
	public int getCategory_index() {
		return category_index;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public void setCategory_description(String category_description) {
		this.category_description = category_description;
	}
	public void setMain_cate_id(int main_cate_id) {
		this.main_cate_id = main_cate_id;
	}
	public void setCategory_status(int category_status) {
		this.category_status = category_status;
	}
	public void setCategory_index(int category_index) {
		this.category_index = category_index;
	}
	public String getCategory_image() {
		return category_image;
	}
	public void setCategory_image(String category_image) {
		this.category_image = category_image;
	}
	public String getMain_cate_name() {
		return main_cate_name;
	}
	public void setMain_cate_name(String main_cate_name) {
		this.main_cate_name = main_cate_name;
	}
}
