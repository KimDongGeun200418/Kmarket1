package kr.co.kmarket1.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.ProductService;
import kr.co.kmarket1.vo.ProductVO;

@WebServlet("/product/addCart.do")
public class AddCartController extends HttpServlet{
	ProductService serviceProduct = ProductService.INSTANCE;
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uid = req.getParameter("uid");
		String prodNo = req.getParameter("prodNo");
		int count = Integer.parseInt(req.getParameter("count"));
		int total = Integer.parseInt(req.getParameter("total"));
		
		ProductVO product = serviceProduct.selectProduct(prodNo);
		String result = serviceProduct.insertCart(uid, product, count, total);
		resp.getWriter().print(result);
	
	}

}
