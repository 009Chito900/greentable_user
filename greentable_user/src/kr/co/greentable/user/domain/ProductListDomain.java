package kr.co.greentable.user.domain;

public class ProductListDomain {
	private String pro_img_thumb,product_name,pro_text_info;
	private int option_price;
	
	public String getPro_img_thumb() {
		return pro_img_thumb;
	}
	public void setPro_img_thumb(String pro_img_thumb) {
		this.pro_img_thumb = pro_img_thumb;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getPro_text_info() {
		return pro_text_info;
	}
	public void setPro_text_info(String pro_text_info) {
		this.pro_text_info = pro_text_info;
	}
	public int getOption_price() {
		return option_price;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	
}
