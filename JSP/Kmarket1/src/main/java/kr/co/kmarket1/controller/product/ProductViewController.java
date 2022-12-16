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
import kr.co.kmarket1.vo.ProductVO;

@WebServlet("/product/productView.do")
public class ProductViewController extends HttpServlet{
	ProductService serviceProduct = ProductService.INSTANCE;

	
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String prodNo	= req.getParameter("prodNo");
		String cate1	= req.getParameter("cate1");
		String cate2	= req.getParameter("cate2");
		
		ProductVO product = serviceProduct.selectProduct(prodNo);
		req.setAttribute("product", product);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/view.jsp");
		dispatcher.forward(req,	 resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
	}
}
