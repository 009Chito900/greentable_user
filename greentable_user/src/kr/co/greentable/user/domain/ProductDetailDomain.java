package kr.co.greentable.user.domain;

import java.util.List;

public class ProductDetailDomain {

	String product_num, product_name, pro_img_info, pro_img_thumb, product_tooltip, sub_ctg_name, on_sale, pro_text_info;
	List<ProductDetailOptionDomain> podList;
	
	public String getProduct_num() {
		return product_num;
	}
	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getPro_img_info() {
		return pro_img_info;
	}
	public void setPro_img_info(String pro_img_info) {
		this.pro_img_info = pro_img_info;
	}
	public String getPro_img_thumb() {
		return pro_img_thumb;
	}
	public void setPro_img_thumb(String pro_img_thumb) {
		this.pro_img_thumb = pro_img_thumb;
	}
	public String getProduct_tooltip() {
		return product_tooltip;
	}
	public void setProduct_tooltip(String product_tooltip) {
		this.product_tooltip = product_tooltip;
	}
	public String getSub_ctg_name() {
		return sub_ctg_name;
	}
	public void setSub_ctg_name(String sub_ctg_name) {
		this.sub_ctg_name = sub_ctg_name;
	}
	public String getOn_sale() {
		return on_sale;
	}
	public void setOn_sale(String on_sale) {
		this.on_sale = on_sale;
	}
	public String getPro_text_info() {
		return pro_text_info;
	}
	public void setPro_text_info(String pro_text_info) {
		this.pro_text_info = pro_text_info;
	}
	public List<ProductDetailOptionDomain> getPodList() {
		return podList;
	}
	public void setPodList(List<ProductDetailOptionDomain> podList) {
		this.podList = podList;
	}
	@Override
	public String toString() {
		return "ProductDetailDomain [product_num=" + product_num + ", product_name=" + product_name + ", pro_img_info="
				+ pro_img_info + ", pro_img_thumb=" + pro_img_thumb + ", product_tooltip=" + product_tooltip
				+ ", sub_ctg_name=" + sub_ctg_name + ", on_sale=" + on_sale
				+ ", pro_text_info=" + pro_text_info + ", podList=" + podList + "]";
	}

}
