package kr.co.kmarket1.service;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.kmarket1.dao.ProductDAO;
import kr.co.kmarket1.vo.CartVO;
import kr.co.kmarket1.vo.MemberVO;
import kr.co.kmarket1.vo.NavCateVO;
import kr.co.kmarket1.vo.ProductVO;
import kr.co.kmarket1.vo.ReviewVO;

public enum ProductService {
	INSTANCE;
	private ProductDAO dao = ProductDAO.getInstance();
			
		public void insertProduct(ProductVO product) {
			dao.insertProduct(product);
		}

		public List<ProductVO> selectProducts() {
			 return dao.selectProducts();
		}

		public ProductVO selectProduct(String prodNo) {
			dao.updateHit(prodNo);
			return dao.selectProduct(prodNo);
		}


		
		//write
		public MultipartRequest uploadFile(HttpServletRequest req, String path) throws IOException {
			int maxSize = 1024 * 1024 * 1; // 최대 파일 업로드 허용량 1MB
			return new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		}
		public String renameFile(String oriName, String path, String alt) {
			// 확장자 따오기
			int idx = oriName.lastIndexOf(".");
			String ext = oriName.substring(idx);
			// 오늘 등록된 제품 개수 세기
			int count = dao.countTodayProducts();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd-");
			String now = sdf.format(new Date());
			String newName = now+count+alt+UUID.randomUUID().toString()+ext; // 221215sfdhwweew.jpg 
			
			File oriFile = new File(path+"/"+oriName);
			File newFile = new File(path+"/"+newName);
			
			oriFile.renameTo(newFile);
			return newName;
		}
		
		//list
		public List<ProductVO> selectProductsByCateSold(String cate1, String cate2, int start){
			return dao.selectProductsByCateSold(cate1, cate2, start);
		}
		public List<ProductVO> selectProductsByCateLow(String cate1, String cate2, int start){
			return dao.selectProductsByCateLow(cate1, cate2, start);
		}
		public List<ProductVO> selectProductsByCateHigh(String cate1, String cate2, int start){
			return dao.selectProductsByCateHigh(cate1, cate2, start);
		}
		public List<ProductVO> selectProductsByCateScore(String cate1, String cate2, int start){
			return dao.selectProductsByCateScore(cate1, cate2, start);
		}
		public List<ProductVO> selectProductsByCateReview(String cate1, String cate2, int start){
			return dao.selectProductsByCateReview(cate1, cate2, start);
		}
		public List<ProductVO> selectProductsByCateLatest(String cate1, String cate2, int start){
			return dao.selectProductsByCateLatest(cate1, cate2, start);
		}
		
		public NavCateVO selectNavCate(String cate1, String cate2) {
			return dao.selectNavCate(cate1, cate2);
		}
		
		
		//index
		public List<ProductVO> selectBestProducts(int amount){
			return dao.selectBestProducts(amount);
		}
		public List<ProductVO> selectHitProducts(int amount){
			return dao.selectHitProducts(amount);
		}
		public List<ProductVO> selectScoreProducts(int amount){
			return dao.selectScoreProducts(amount);
		}
		public List<ProductVO> selectDiscountProducts(int amount){
			return dao.selectDiscountProducts(amount);
		}
		public List<ProductVO> selectLatestProducts(int amount){
			return dao.selectLatestProducts(amount);
		}
		
		//cart
		public String insertCart(String uid, ProductVO product, int count, int total) {
			JsonObject json = new JsonObject();
			json.addProperty("result", dao.insertCart(uid, product, count, total));
			return json.toString();
		}
		public List<CartVO> selectCartProducts(String uid){
			return dao.selectCartProducts(uid);
		}
		public String deleteCart(String cartNo) {
			JsonObject json = new JsonObject();
			json.addProperty("result", dao.deleteCart(cartNo));
			return json.toString();
		};
		public int checkCartProduct(String uid, String prodNo) {
			return dao.checkCartProduct(uid, prodNo);
		};
		
		//order
		public void insertOrderItem(int ordNo, String[] items) {
			dao.insertOrderItem(ordNo, items);
		}
		public List<CartVO> cleanOrderListFromCart(String[] items) {
			return dao.cleanOrderList(items);
		}
		public List<CartVO> cleanOrderListFromView(String[] items) {
			return dao.cleanOrderListForOrder(items);
		}
		public List<CartVO> cleanOrderListForOrder(String[] items) {
			return dao.cleanOrderListForOrder(items);
		}
		public int insertOrder(MemberVO user, List<String> totalInfo, List<String> deliveryInfo) {
			return dao.insertOrder(user.getUid(), totalInfo, deliveryInfo);
		}
		public void deleteCartForOrder(MemberVO user, int prodNo) {
			dao.deleteCartForOrder(user.getUid(), prodNo);
		};
		public String selectPayment(String paymentNo) {
			String payment = null;
			if(paymentNo.equals("1")) { payment = "신용카드"; }
			else if(paymentNo.equals("2")) { payment = "체크카드"; }
			else if(paymentNo.equals("3")) { payment = "실시간 계좌이체"; }
			else if(paymentNo.equals("4")) { payment = "무통장입금"; }
			else if(paymentNo.equals("5")) { payment = "휴대폰결제"; }
			else if(paymentNo.equals("6")) { payment = "카카오페이"; }
			
			return payment;
		}
		
		//reviewPage
		public int countReviewTotal(String prodNo) {
			return dao.countReviewTotal(prodNo);
		}
		public List<ReviewVO> selectReviews(String prodNo, int start) {
			return dao.selectReviews(prodNo, start);
		}
		public int getLastPageNumReview(int total) {
			int lastPageNum = 0;
			if(total % 5 == 0){
				lastPageNum = total / 5;
			}else{
				lastPageNum = total / 5 + 1;
			}
			return lastPageNum;
		}
		public int getStartNumReview(int currentPage) {
			return (currentPage - 1) * 5;
		}
		
		//page
		public int countProductTotal(String cate1, String cate2) {
			return dao.countProductTotal(cate1, cate2);
		}
		
		public int getLastPageNum(int total) {
			int lastPageNum = 0;
			if(total % 10 == 0){
				lastPageNum = total / 10;
			}else{
				lastPageNum = total / 10 + 1;
			}
			return lastPageNum;
		}
		
		public int[] getPageGroupNum(int currentPage, int lastPageNum) {
			int currentPageGroup = (int)Math.ceil(currentPage / 10.0);
			int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
			int pageGroupEnd = currentPageGroup * 10;
			if(pageGroupEnd > lastPageNum){
				pageGroupEnd = lastPageNum;
			}
			int[] result = {pageGroupStart, pageGroupEnd};
			
			return result;
		}
		
		public int getPageStartNum(int total, int currentPage) {
			int start = (currentPage - 1) * 10;
			return total - start;
		}
		
		public int getCurrentPage(String pg) {
			int currentPage = 1;
			if(pg != null){
				currentPage = Integer.parseInt(pg);	
			}
			return currentPage;
		}
		
		public int getStartNum(int currentPage) {
			return (currentPage - 1) * 10;
		}
}
