package kr.co.kmarket1.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.kmarket1.service.MemberService;
import kr.co.kmarket1.service.ProductService;
import kr.co.kmarket1.vo.CartVO;
import kr.co.kmarket1.vo.MemberVO;

@WebServlet("/product/productOrder.do")
public class ProductOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService serviceProduct = ProductService.INSTANCE;
	MemberService serviceMember = MemberService.INSTANCE;
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/product/order.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전처리
		String[] items = req.getParameterValues("orderList");
		HttpSession session = req.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if(loginUser != null) {
			List<CartVO> orderList = null;
			if(items[0].split(",").length > 7) {
				orderList = serviceProduct.cleanOrderListFromView(items);
			}else {
				orderList = serviceProduct.cleanOrderListFromCart(items);
			}
			MemberVO user = serviceMember.order(loginUser.getUid());
			req.setAttribute("orderList", orderList);
			req.setAttribute("user", user);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/product/order.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
