package kr.co.kmarket1.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.ProductService;
import kr.co.kmarket1.vo.NavCateVO;
import kr.co.kmarket1.vo.ProductVO;

@WebServlet("/product/productList.do")
public class ProductListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ProductService serviceProduct = ProductService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String pg = req.getParameter("pg");
		String option = req.getParameter("option");
		NavCateVO navCate = serviceProduct.selectNavCate(cate1, cate2);
		
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		req.setAttribute("navCate", navCate);
		req.setAttribute("option", option);
		
		//페이징
		int total = serviceProduct.countProductTotal(cate1, cate2); // 게시글 개수
		int currentPage = serviceProduct.getCurrentPage(pg); // 현재 페이지 번호	
		int lastPageNum = serviceProduct.getLastPageNum(total); // 마지막 페이지 번호
		int[] result = serviceProduct.getPageGroupNum(currentPage, lastPageNum); // 페이지 그룹 start, end 번호
		int pageStartNum = serviceProduct.getPageStartNum(total, currentPage); // 페이지 시작번호
		int start = serviceProduct.getStartNum(currentPage); // 시작 인덱스
		
		List<ProductVO> products = null;
		if(option == null || option.equals("sold")) {
			products = serviceProduct.selectProductsByCateSold(cate1, cate2, start); 
		}else if(option.equals("low")) {
			products = serviceProduct.selectProductsByCateLow(cate1, cate2, start); 
		}else if(option.equals("high")) {
			products = serviceProduct.selectProductsByCateHigh(cate1, cate2, start); 
		}else if(option.equals("score")) {
			products = serviceProduct.selectProductsByCateScore(cate1, cate2, start); 
		}else if(option.equals("review")) {
			products = serviceProduct.selectProductsByCateReview(cate1, cate2, start); 
		}else if(option.equals("latest")) {
			products = serviceProduct.selectProductsByCateLatest(cate1, cate2, start); 
		}
				
		req.setAttribute("products", products);
		req.setAttribute("lastPageNum", lastPageNum);		
		req.setAttribute("currentPage", currentPage);		
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/list.jsp?cate1="+cate1+"&cate2="+cate2);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
}
