package kr.co.greentable.user.domain;

public class OptionDomain {
	
	private String option_num, option_name;
	private int option_price, quantity;
	
	
	public OptionDomain(String option_num, String option_name, int option_price,
			int quantity) {
		this.option_num = option_num;
		this.option_name = option_name;
		this.option_price = option_price;
		this.quantity = quantity;
	}
	

	public String getOption_num() {
		return option_num;
	}
	public void setOption_num(String option_num) {
		this.option_num = option_num;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
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
	
}
