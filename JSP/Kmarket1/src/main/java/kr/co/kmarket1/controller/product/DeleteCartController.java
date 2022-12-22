package kr.co.kmarket1.controller.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.ProductService;

@WebServlet("/product/deleteCart.do")
public class DeleteCartController extends HttpServlet{
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
		StringBuilder result = new StringBuilder();
		String [] deleteList = req.getParameterValues("deleteList");
		for(String cartNo : deleteList) {
			result.append(serviceProduct.deleteCart(cartNo)+"\n");
		}
		resp.getWriter().print(result.toString());
	}

}
