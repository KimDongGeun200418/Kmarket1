package kr.co.kmarket1.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.db.DBHelper;
import kr.co.kmarket1.db.Sql;
import kr.co.kmarket1.vo.MemberVO;
import kr.co.kmarket1.vo.ProductVO;

public class ProductDAO extends DBHelper{
Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	
	public void insertProduct(ProductVO product) {
		
		try {
			logger.debug("insertProduct Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_PRODUCT);
			psmt.setInt(1, product.getCate1());
			psmt.setInt(2, product.getCate2());
			psmt.setString(3, product.getProdName());
			psmt.setString(4, product.getDescript());
			psmt.setString(5, product.getCompany());
			psmt.setInt(6, product.getPrice());
			psmt.setInt(7, product.getDiscount());
			psmt.setInt(8, product.getPoint());
			psmt.setInt(9, product.getStock());
			psmt.setInt(10, product.getDelivery());
			psmt.setString(11, product.getStatus());
			psmt.setString(12, product.getDuty());
			psmt.setString(13, product.getReceipt());
			psmt.setString(14, product.getBizType());
			psmt.setString(15, product.getOrigin());
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
			
	};
	
}
