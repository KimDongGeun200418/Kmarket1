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
		
		List<ProductVO> products = serviceProduct.selectProductsByCate(cate1, cate2);
		req.setAttribute("products", products);
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/list.jsp?cate1="+cate1+"&cate2="+cate2);
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
}
