package kr.co.kmarket1.controller.product;

import java.io.IOException;
import java.util.Arrays;
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

@WebServlet("/product/completeOrder.do")
public class CompleteOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService serviceProduct = ProductService.INSTANCE;
	MemberService serviceMember = MemberService.INSTANCE;
	
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] items = req.getParameterValues("orderList");
		String[] infos = req.getParameterValues("otherInfo");
		HttpSession session = req.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		
		
		if(loginUser != null) {
			List<CartVO> orderList = serviceProduct.cleanOrderListForOrder(items);
			List<String> deliveryInfo = Arrays.asList(infos[0].split(","));
			List<String> totalInfo = Arrays.asList(infos[1].split(","));
			MemberVO user = serviceMember.order(loginUser.getUid());
			
			int ordNo = serviceProduct.insertOrder(user, totalInfo, deliveryInfo);
			serviceProduct.insertOrderItem(ordNo, items);
			serviceMember.insertPoint(ordNo);
			serviceMember.updatePoint(user);
			for(CartVO item : orderList) {
				serviceProduct.deleteCartForOrder(user, item.getProdNo());
			}
			
			req.setAttribute("orderList", orderList);
			req.setAttribute("deliveryInfo", deliveryInfo);
			req.setAttribute("totalInfo", totalInfo);
			req.setAttribute("user", user);
			req.setAttribute("ordNo", ordNo);
			req.setAttribute("payment", serviceProduct.selectPayment(totalInfo.get(7)));
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/product/complete.jsp");
			dispatcher.forward(req, resp);
		}
	}
}
