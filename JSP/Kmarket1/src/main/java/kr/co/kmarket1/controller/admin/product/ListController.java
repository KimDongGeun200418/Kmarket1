package kr.co.kmarket1.controller.admin.product;

import java.io.IOException;
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
		
		//페이징
		int total = serviceProduct.countProductTotalInAdmin(seller); // 게시글 개수
		int currentPage = serviceProduct.getCurrentPage(pg); // 현재 페이지 번호	
		int lastPageNum = serviceProduct.getLastPageNum(total); // 마지막 페이지 번호
		int[] result = serviceProduct.getPageGroupNum(currentPage, lastPageNum); // 페이지 그룹 start, end 번호
		int pageStartNum = serviceProduct.getPageStartNum(total, currentPage); // 페이지 시작번호
		int start = serviceProduct.getStartNum(currentPage); // 시작 인덱스
		
		List<ProductVO> products = serviceProduct.selectProductsInAdmin(seller, start);
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
	
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String pg = req.getParameter("pg");
		String no = req.getParameter("no");
		ProductVO product = serviceProduct.selectProduct(no);
	
	
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("pg", pg);
		req.setAttribute("product", product);
		
		
	
	}



}
