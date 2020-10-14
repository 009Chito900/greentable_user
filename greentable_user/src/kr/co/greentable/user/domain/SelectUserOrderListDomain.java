package kr.co.greentable.user.domain;

public class SelectUserOrderListDomain {
	private int option_price, quantity, total_price;
	private String product_name, order_list_num, pro_img_thumb;
	
	public int getOption_price() {
		return option_price;
	}
	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getOrder_list_num() {
		return order_list_num;
	}
	public void setOrder_list_num(String order_list_num) {
		this.order_list_num = order_list_num;
	}
	public String getPro_img_thumb() {
		return pro_img_thumb;
	}
	public void setPro_img_thumb(String pro_img_thumb) {
		this.pro_img_thumb = pro_img_thumb;
	}
	
	
}//class
