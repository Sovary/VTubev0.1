package model.dto;

public class ListSubCategory extends SubCategory{
	private String main_cate_name;
	private int count_video_each_sub;
	public String getMain_cate_name() {
		return main_cate_name;
	}

	public void setMain_cate_name(String main_cate_name) {
		this.main_cate_name = main_cate_name;
	}

	public int getCount_video_each_sub() {
		return count_video_each_sub;
	}

	public void setCount_video_each_sub(int count_video_each_sub) {
		this.count_video_each_sub = count_video_each_sub;
	}
}
