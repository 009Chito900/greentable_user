package kr.co.greentable.user.service;

import java.util.List;

import kr.co.greentable.user.dao.ProductDetailDAO;
import kr.co.greentable.user.domain.ProductDetailDomain;
import kr.co.greentable.user.domain.ProductDetailOptionDomain;

public class ProductDetailService {

	public ProductDetailDomain selectProductDetail(String productNum) {
		
		ProductDetailDAO pddDAO = ProductDetailDAO.getInstance();
		ProductDetailDomain pddd = pddDAO.selectProductDetail(productNum);
		List<ProductDetailOptionDomain> pddodList = pddDAO.selectProductOptionDetail(productNum);
		
		pddd.setPodList(pddodList);
		
		return pddd;
	}
}
