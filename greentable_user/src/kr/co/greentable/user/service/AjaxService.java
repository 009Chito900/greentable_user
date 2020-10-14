package kr.co.greentable.user.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.greentable.admin.dao.AjaxDAO;
import kr.co.greentable.admin.domain.ProductDomain;
import kr.co.greentable.user.domain.ProductDetailDomain;
import kr.co.greentable.user.domain.ProductDetailOptionDomain;

public class AjaxService {

	public int totlaPriceJson(List<ProductDetailOptionDomain> list) {
		int sum = 0;
		JSONObject json= new JSONObject();
		for(ProductDetailOptionDomain pddd : list) {
				sum += pddd.getOption_price();
		}
		json.put("dataCnt",ajDAO.selectSubCtgList(mainCtg).size());
		
		JSONArray ja=new JSONArray();//�����͸� ���� jsonobject�� ������ JSONArray
		JSONObject jsonTemp=null;
		
		for(int i=0; i<ajDAO.selectSubCtgList(mainCtg).size(); i++) {
			jsonTemp = new JSONObject();
			jsonTemp.put("subCtg", ajDAO.selectSubCtgList(mainCtg).get(i).getSub_ctg_name());
			ja.add(jsonTemp);
		}//end for
		//�����͸� ���� JSONarray�� jsonObject�� �߰�
		json.put("subCtgList", ja);
		
		return json.toJSONString();
	}//createJson

	public String listJson(String mainCtg) {
		
		AjaxDAO ajDAO = AjaxDAO.getInstance();
		
		
		JSONObject json= new JSONObject();
		List<ProductDomain> pddList = ajDAO.selectMainProductList(mainCtg);
		json.put("productCnt",pddList.size());
		
		JSONArray ja=new JSONArray();//�����͸� ���� jsonobject�� ������ JSONArray
		JSONObject jsonTemp=null;
		
		for(int i=0; i<pddList.size(); i++) {
			jsonTemp = new JSONObject();
			jsonTemp.put("productNum", pddList.get(i).getProduct_num());
			jsonTemp.put("productName", pddList.get(i).getProduct_name());
			jsonTemp.put("productImgInfo", pddList.get(i).getPro_img_info());
			jsonTemp.put("productImgThumb", pddList.get(i).getPro_img_thumb());
			jsonTemp.put("productTolltip", pddList.get(i).getProduct_tooltip());
			jsonTemp.put("productMainCtg", pddList.get(i).getMain_ctg_name());
			jsonTemp.put("productSubCtg", pddList.get(i).getSub_ctg_name());
			jsonTemp.put("productOnSale", pddList.get(i).getOn_sale());
			jsonTemp.put("productTextInfo", pddList.get(i).getPro_text_info());
			System.out.println("fuckfuckfuck");
			System.out.println(pddList.get(i).getPodList().get(0).getOption_name());
			System.out.println(pddList.get(i).getPodList().get(0).getOption_price());
			jsonTemp.put("productOptionName", pddList.get(i).getPodList().get(0).getOption_name());
			jsonTemp.put("productOptionPrice", pddList.get(i).getPodList().get(0).getOption_price());
			
			ja.add(jsonTemp);
		}//end for
		//�����͸� ���� JSONarray�� jsonObject�� �߰�
		json.put("productList", ja);
		System.out.println(json.toJSONString());
		return json.toJSONString();
	}//createJson
}
