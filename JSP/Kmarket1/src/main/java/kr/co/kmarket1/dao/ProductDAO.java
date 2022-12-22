package kr.co.kmarket1.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.db.DBHelper;
import kr.co.kmarket1.db.Sql;
import kr.co.kmarket1.vo.CartVO;
import kr.co.kmarket1.vo.NavCateVO;
import kr.co.kmarket1.vo.ProductVO;
import kr.co.kmarket1.vo.ReviewVO;

public class ProductDAO extends DBHelper{
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	
	// insertProduct
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
			psmt.setString(6, product.getSeller());
			psmt.setInt(7, product.getPrice());
			psmt.setInt(8, product.getDiscount());
			psmt.setInt(9, product.getPoint());
			psmt.setInt(10, product.getStock());
			psmt.setInt(11, product.getDelivery());
			psmt.setString(12, product.getIp());
			psmt.setString(13, product.getStatus());
			psmt.setString(14, product.getDuty());
			psmt.setString(15, product.getReceipt());
			psmt.setString(16, product.getBizType());
			psmt.setString(17, product.getOrigin());
			psmt.setString(18, product.getThumb1());
			psmt.setString(19, product.getThumb2());
			psmt.setString(20, product.getThumb3());
			psmt.setString(21, product.getDetail());
			
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	// selectProducts
	public List<ProductVO> selectProducts() {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProducts Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS);
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
												
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;	
	}
	// selectProduct
		public ProductVO selectProduct(String prodNo) {
			ProductVO product = null;
			try {
				logger.debug("selectProduct Start...");
				conn = getConnection();
				psmt = conn.prepareStatement(Sql.SELECT_PRODUCT);
				psmt.setString(1, prodNo);
				rs = psmt.executeQuery();
				if(rs.next()) {
					product = new ProductVO();
					product.setProdNo(rs.getInt(1));
					product.setCate1(rs.getInt(2));
					product.setCate2(rs.getInt(3));
					product.setProdName(rs.getString(4));
					product.setDescript(rs.getString(5));
					product.setCompany(rs.getString(6));
					product.setSeller(rs.getString(7));
					product.setPrice(rs.getInt(8));
					product.setDiscount(rs.getInt(9));
					product.setPoint(rs.getInt(10));
					product.setStock(rs.getInt(11));
					product.setSold(rs.getInt(12));
					product.setDelivery(rs.getInt(13));
					product.setHit(rs.getInt(14));
					product.setScore(rs.getInt(15));
					product.setReview(rs.getInt(16));
					product.setThumb1(rs.getString(17));
					product.setThumb2(rs.getString(18));
					product.setThumb3(rs.getString(19));
					product.setDetail(rs.getString(20));
					product.setStatus(rs.getString(21));
					product.setDuty(rs.getString(22));
					product.setReceipt(rs.getString(23));
					product.setBizType(rs.getString(24));
					product.setOrigin(rs.getString(25));
					product.setIp(rs.getString(26));
					product.setRdate(rs.getString(27));
				}
				close();
			}catch (Exception e) {
				logger.error(e.getMessage());
			}
			return product;	
		}

	//selectProductsByCateSold
	public List<ProductVO> selectProductsByCateSold(String cate1, String cate2, int start) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProductsByCateSold Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_CATE_SOLD);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				product.setLevel(rs.getInt(28));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;	
	}
	//selectProductsByCateLow
	public List<ProductVO> selectProductsByCateLow(String cate1, String cate2, int start) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProductsByCateLow Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_CATE_LOW);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				product.setLevel(rs.getInt(28));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;	
	}
	//selectProductsByCateHigh
	public List<ProductVO> selectProductsByCateHigh(String cate1, String cate2, int start) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProductsByCateHigh Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_CATE_HIGH);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				product.setLevel(rs.getInt(28));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;	
	}
	//selectProductsByCateScore
	public List<ProductVO> selectProductsByCateScore(String cate1, String cate2, int start) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProductsByCateScore Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_CATE_SCORE);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				product.setLevel(rs.getInt(28));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;	
	}
	//selectProductsByCateReview
	public List<ProductVO> selectProductsByCateReview(String cate1, String cate2, int start) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProductsByCateReview Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_CATE_REVIEW);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				product.setLevel(rs.getInt(28));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;	
	}
	//selectProductsByCateLatest
	public List<ProductVO> selectProductsByCateLatest(String cate1, String cate2, int start) {
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectProductsByCateLatest Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_CATE_LATEST);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			psmt.setInt(3, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				product.setLevel(rs.getInt(28));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;	
	}
	
	//selectBestProducts
	public List<ProductVO> selectBestProducts(int amount){
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectBestProducts Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_SOLD);
			psmt.setInt(1, amount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;
	}
	//selectHitProducts
	public List<ProductVO> selectHitProducts(int amount){
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectHitProducts Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_HIT);
			psmt.setInt(1, amount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;
	}
	//selectScoreProducts
	public List<ProductVO> selectScoreProducts(int amount){
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectScoreProducts Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_SCORE);
			psmt.setInt(1, amount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;
	}
	//selectDiscountProducts
	public List<ProductVO> selectDiscountProducts(int amount){
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectDiscountProducts Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_DISCOUNT);
			psmt.setInt(1, amount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;
	}
	//selectLatestProducts
	public List<ProductVO> selectLatestProducts(int amount){
		List<ProductVO> products = new ArrayList<>();
		try {
			logger.debug("selectLatestProducts Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_PRODUCTS_BY_LATEST);
			psmt.setInt(1, amount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setProdNo(rs.getInt(1));
				product.setCate1(rs.getInt(2));
				product.setCate2(rs.getInt(3));
				product.setProdName(rs.getString(4));
				product.setDescript(rs.getString(5));
				product.setCompany(rs.getString(6));
				product.setSeller(rs.getString(7));
				product.setPrice(rs.getInt(8));
				product.setDiscount(rs.getInt(9));
				product.setPoint(rs.getInt(10));
				product.setStock(rs.getInt(11));
				product.setSold(rs.getInt(12));
				product.setDelivery(rs.getInt(13));
				product.setHit(rs.getInt(14));
				product.setScore(rs.getInt(15));
				product.setReview(rs.getInt(16));
				product.setThumb1(rs.getString(17));
				product.setThumb2(rs.getString(18));
				product.setThumb3(rs.getString(19));
				product.setDetail(rs.getString(20));
				product.setStatus(rs.getString(21));
				product.setDuty(rs.getString(22));
				product.setReceipt(rs.getString(23));
				product.setBizType(rs.getString(24));
				product.setOrigin(rs.getString(25));
				product.setIp(rs.getString(26));
				product.setRdate(rs.getString(27));
				
				products.add(product);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return products;
	}
	
	//selectNavCate
	public NavCateVO selectNavCate(String cate1, String cate2) {
		NavCateVO cate = null;
		try {
			logger.debug("selectNavCate Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_NAVCATE);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cate = new NavCateVO();
				cate.setCate1(rs.getString(1));
				cate.setCate2(rs.getString(2));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return cate;
	};
	
	//today's products count
	public int countTodayProducts() {
		int result = 0;
		try {
			logger.debug("countTodayProducts Start...");
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.COUNT_TODAY_PRODUCTS);
			if(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	//update hit
	public void updateHit(String pronNo) {
		try {
			logger.debug("updateHit Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.UPDATE_HIT);
			psmt.setString(1, pronNo);
			psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	//insertCart
	public int insertCart(String uid, ProductVO product, int count, int total) {
		int result= 0;
		try {
			logger.debug("insertCart start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_CART);
			psmt.setString(1, uid);
			psmt.setInt(2, product.getProdNo());
			psmt.setInt(3, count);
			psmt.setInt(4, product.getPrice());
			psmt.setInt(5, product.getDiscount());
			psmt.setInt(6, product.getPoint());
			psmt.setInt(7, product.getDelivery());
			psmt.setInt(8, total);
			result = psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		} 
		return result;
	}
	//selectCartProducts
	public List<CartVO> selectCartProducts(String uid) {
		List<CartVO> cartProducts = new ArrayList<>();
		try {
			logger.debug("selectCartProducts start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_CART_PRODUCTS);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CartVO cartProduct = new CartVO();
				cartProduct.setCartNo(rs.getInt(1));
				cartProduct.setUid(rs.getString(2));
				cartProduct.setProdNo(rs.getInt(3));
				cartProduct.setCount(rs.getInt(4));
				cartProduct.setPrice(rs.getInt(5));
				cartProduct.setDiscount(rs.getInt(6));
				cartProduct.setPoint(rs.getInt(7));
				cartProduct.setDelivery(rs.getInt(8));
				cartProduct.setTotal(rs.getInt(9));
				cartProduct.setRdate(rs.getString(10).substring(2,11));
				cartProduct.setProdName(rs.getString(11));
				cartProduct.setDescript(rs.getString(12));
				cartProduct.setThumb1(rs.getString(13));
				
				cartProducts.add(cartProduct);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		} 
		logger.debug("selectCartProducts start...");
		return cartProducts;
	}
	//deleteCart
	public int deleteCart(String cartNo) {
		int result= 0;
		try {
			logger.debug("deleteCart start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.DELETE_CART);
			psmt.setString(1, cartNo);
			result = psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		} 
		return result;
	}
	
	//countProductTotal
	public int countProductTotal(String cate1, String cate2) {
		int total = 0;
		try{
			logger.info("countProductTotal start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_PRODUCT_TOTAL);
			psmt.setString(1, cate1);
			psmt.setString(2, cate2);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			close();
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return total;
	}
	
	//countReviewTotal
	public int countReviewTotal(String prodNo) {
		int total = 0;
		try{
			logger.info("countReviewTotal start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_REVIEW_TOTAL);
			psmt.setString(1, prodNo);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			close();
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return total;
	}
	//selectReviews
	public List<ReviewVO> selectReviews(String prodNo, int start){
		List<ReviewVO> reviews = new ArrayList<>();
		try {
			logger.debug("selectReviews Start...");
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_REVIEWS);
			psmt.setString(1, prodNo);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ReviewVO review = new ReviewVO();
				review.setRevNo(rs.getInt(1));
				review.setProdNo(rs.getInt(2));
				review.setContent(rs.getString(3));
				review.setUid(rs.getString(4));
				review.setRating(rs.getInt(5));
				review.setRegip(rs.getString(6));
				review.setRdate(rs.getString(7).substring(2,11));
				
				reviews.add(review);
			}
			close();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
		return reviews;
	}
	
}
		

	
	
		