package kr.co.kmarket1.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import kr.co.kmarket1.service.ProductService;
import kr.co.kmarket1.vo.MemberVO;

@WebServlet("/product/productOrder.do")
public class ProductOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductService serviceProduct = ProductService.INSTANCE;

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
		
		//uid, 선택목록 받아오기
		HttpSession session = req.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String[] orderList = req.getParameterValues("orderList");
		List<String> prodInfoList = new ArrayList<>();
		//order frame 생성 -> ordNo받아오기
		int ordNo = serviceProduct.addOrderFrame(loginUser.getUid());
		
		//선택목록 하나씩 넘겨서 order item에 추가
		for(String orderItem : orderList) {
			prodInfoList = Arrays.asList(orderItem.split(","));
			serviceProduct.insertOrderItem(ordNo, prodInfoList);
		}
		JsonObject json = new JsonObject();
		json.addProperty("result", 1);
		resp.getWriter().print(json.toString());
	}
}
