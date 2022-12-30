package kr.co.kmarket1.controller.admin.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.kmarket1.service.ProductService;
import kr.co.kmarket1.vo.MemberVO;
import kr.co.kmarket1.vo.ProductVO;



@WebServlet("/admin/product/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService serviceProduct = ProductService.INSTANCE;	
	
	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		MemberVO seller = (MemberVO) session.getAttribute("loginUser");
		String pg = req.getParameter("pg");
		String option = req.getParameter("option");
		String keyword = req.getParameter("keyword");
		int total = 0;
		List<ProductVO> products = new ArrayList<>();
		
		
		
		//페이징
		if(keyword!=null) {
			if(keyword.equals("")) {
				if(seller.getLevel() == 7) {
					total = serviceProduct.countProductTotalForCEO();
				}else {
					total = serviceProduct.countProductTotalInAdmin(seller); // 게시글 개수
				}
			}else {
				if(option.equals("1")) {
					total = serviceProduct.countProductTotalForSearchByName(keyword);
				}else if(option.equals("2")) {
					total = serviceProduct.countProductTotalForSearchByNo(keyword);
				}else if(option.equals("3")) {
					total = serviceProduct.countProductTotalForSearchByCompany(keyword);
				}else if(option.equals("4")) {
					total = serviceProduct.countProductTotalForSearchBySeller(keyword);
				}
			}
		}else if(seller.getLevel() == 7) {
			total = serviceProduct.countProductTotalForCEO();
		}else {
			total = serviceProduct.countProductTotalInAdmin(seller); // 게시글 개수
		}
		int currentPage = serviceProduct.getCurrentPage(pg); // 현재 페이지 번호	
		int lastPageNum = serviceProduct.getLastPageNum(total); // 마지막 페이지 번호
		int[] result = serviceProduct.getPageGroupNum(currentPage, lastPageNum); // 페이지 그룹 start, end 번호
		int pageStartNum = serviceProduct.getPageStartNum(total, currentPage); // 페이지 시작번호
		int start = serviceProduct.getStartNum(currentPage); // 시작 인덱스
		
		if(keyword!=null) {
			if(keyword.equals("")) {
				if(seller.getLevel() == 7) {
					products = serviceProduct.selectProductsForCEO(start);
				}else {
					products = serviceProduct.selectProductsInAdmin(seller, start); // 게시글 개수
				}
			}else {
				if(option.equals("1")) {
					products = serviceProduct.selectProductsByName(keyword, start);
				}else if(option.equals("2")) {
					products = serviceProduct.selectProductsByNo(keyword, start);;
				}else if(option.equals("3")) {
					products = serviceProduct.selectProductsByCompany(keyword, start);
				}else if(option.equals("4")) {
					products = serviceProduct.selectProductsBySeller(keyword, start);
				}
			}
		}else if(seller.getLevel() == 7) {
			products = serviceProduct.selectProductsForCEO(start);
		}else {
			products = serviceProduct.selectProductsInAdmin(seller, start); // 게시글 개수
		}
		
		req.setAttribute("products", products);
		req.setAttribute("lastPageNum", lastPageNum);		
		req.setAttribute("currentPage", currentPage);		
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/product/list.jsp");
		dispatcher.forward(req, resp);
	}
			
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	}



}
