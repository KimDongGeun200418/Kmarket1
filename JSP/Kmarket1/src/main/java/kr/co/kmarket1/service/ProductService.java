package kr.co.kmarket1.service;

import kr.co.kmarket1.dao.ProductDAO;
import kr.co.kmarket1.vo.ProductVO;

public enum ProductService {
	INSTANCE;
	private ProductDAO dao = ProductDAO.getInstance();
			
		public void insertProduct(ProductVO product) {
			dao.insertProduct(product);
					
		}
	

	
}
