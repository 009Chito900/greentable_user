package kr.co.greentable.user.domain;

import java.util.List;

/**
 * 장바구니에 담긴 모든 정보를 가진 Domain
 * @author sist27
 *
 */
public class CartListDomain {
	
	private String pro_img_info, porduct_name, product_num;
	private List<OptionDomain> option_list;
	
	
	public CartListDomain(String pro_img_info, String porduct_name,
			String product_num, List<OptionDomain> option_list) {
		this.pro_img_info = pro_img_info;
		this.porduct_name = porduct_name;
		this.product_num = product_num;
		this.option_list = option_list;
	}

	
	public String getPro_img_info() {
		return pro_img_info;
	}

	public void setPro_img_info(String pro_img_info) {
		this.pro_img_info = pro_img_info;
	}

	public String getPorduct_name() {
		return porduct_name;
	}

	public void setPorduct_name(String porduct_name) {
		this.porduct_name = porduct_name;
	}

	public String getProduct_num() {
		return product_num;
	}

	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}

	public List<OptionDomain> getOption_list() {
		return option_list;
	}

	public void setOption_list(List<OptionDomain> option_list) {
		this.option_list = option_list;
	}
	
}
