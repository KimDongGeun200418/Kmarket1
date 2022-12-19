package kr.co.kmarket1.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.ProductService;
import kr.co.kmarket1.vo.ProductVO;

@WebServlet("/index.do")
public class indexController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ProductService serviceProduct = ProductService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<ProductVO> bestProducts = serviceProduct.selectBestProducts(5);
		List<ProductVO> hitProducts = serviceProduct.selectHitProducts(8);
		List<ProductVO> scoreProducts = serviceProduct.selectScoreProducts(8);
		List<ProductVO> discountProducts = serviceProduct.selectDiscountProducts(8);
		List<ProductVO> latestProducts = serviceProduct.selectLatestProducts(8);
		req.setAttribute("bestProducts", bestProducts);
		req.setAttribute("hitProducts", hitProducts);
		req.setAttribute("scoreProducts", scoreProducts);
		req.setAttribute("discountProducts", discountProducts);
		req.setAttribute("latestProducts", latestProducts);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
	
}
