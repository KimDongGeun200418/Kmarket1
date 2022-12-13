package kr.co.kmarket1.controller.admin.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.ProductService;
import kr.co.kmarket1.vo.ProductVO;

@WebServlet("/admin/product/register.do")
public class RegisterController extends HttpServlet{
		private static final long serialVersionUID = 1L;
		ProductService service = ProductService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
						
	RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/product/register.jsp");
	dispatcher.forward(req, resp);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String category1 = req.getParameter("category1");
		String category2 = req.getParameter("category2");
		String prodName = req.getParameter("prodName");
		String descript = req.getParameter("descript");
		String company = req.getParameter("company");
		String price = req.getParameter("price");
		String discount = req.getParameter("discount");
		String point = req.getParameter("point");		
		String stock = req.getParameter("stock");
		String delivery = req.getParameter("delivery");
		String status = req.getParameter("status");
		String duty = req.getParameter("duty");
		String receipt = req.getParameter("receipt");
		String bizType = req.getParameter("bizType");
		String origin = req.getParameter("origin");
		
		
		ProductVO product = new ProductVO();
		product.setCate1(category1);
		product.setCate2(category2);
		product.setProdName(prodName);
		product.setDescript(descript);
		product.setCompany(company);
		product.setPrice(price);
		product.setDiscount(discount);
		product.setPoint(point);
		product.setStock(stock);
		product.setDelivery(delivery);
		product.setStatus(status);
		product.setDuty(duty);
		product.setReceipt(receipt);
		product.setBizType(bizType);
		product.setOrigin(origin);
		
		service.insertProduct(product);
		
		resp.sendRedirect("/Kmarket1/admin/product/register.do");
		
						
	
	}



}
