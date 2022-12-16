package kr.co.kmarket1.controller.admin.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

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
		
		//파일 전송 데이터 수신
		ServletContext ctx	= req.getServletContext();
		String path 		= ctx.getRealPath("/productImg");
		MultipartRequest mr = service.uploadFile(req, path);
		
		String category1= mr.getParameter("category1");
		String category2= mr.getParameter("category2");
		String prodName = mr.getParameter("prodName");
		String descript = mr.getParameter("descript");
		String company 	= mr.getParameter("company");
		String seller 	= mr.getParameter("uid");
		String price 	= mr.getParameter("price");
		String discount = mr.getParameter("discount");
		String point 	= mr.getParameter("point");		
		String stock 	= mr.getParameter("stock");
		String delivery = mr.getParameter("delivery");
		String status 	= mr.getParameter("status");
		String duty 	= mr.getParameter("duty");
		String receipt 	= mr.getParameter("receipt");
		String bizType 	= mr.getParameter("bizType");
		String origin 	= mr.getParameter("origin");
		String regip 	= req.getRemoteAddr();
		String thumb1	= mr.getFilesystemName("thumb1");
		String thumb2	= mr.getFilesystemName("thumb2");
		String thumb3	= mr.getFilesystemName("thumb3");
		String detail	= mr.getFilesystemName("detail");
		String nThumb1 = service.renameFile(thumb1, path, "tmb1-");
		String nThumb2 = service.renameFile(thumb2, path, "tmb2-");
		String nThumb3 = service.renameFile(thumb3, path, "tmb3-");
		String nDetail = service.renameFile(detail, path, "dtl-");
		
		ProductVO product = new ProductVO();
		product.setCate1(category1);
		product.setCate2(category2);
		product.setProdName(prodName);
		product.setDescript(descript);
		product.setCompany(company);
		product.setSeller(seller);
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
		product.setIp(regip);
		product.setThumb1(nThumb1);
		product.setThumb2(nThumb2);
		product.setThumb3(nThumb3);
		product.setDetail(nDetail);
		
		service.insertProduct(product);
		
		resp.sendRedirect("/Kmarket1/admin/product/register.do");
		
						
	
	}



}
