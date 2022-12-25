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

import kr.co.kmarket1.service.ProductService;
import kr.co.kmarket1.vo.CartVO;
import kr.co.kmarket1.vo.MemberVO;

@WebServlet("/product/productCart.do")
public class ProductCartController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	ProductService service = ProductService.INSTANCE;
	
	@Override
	public void init() throws ServletException {

	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//유저값으로 cart 조회
		HttpSession session = req.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser!=null) {
			List<CartVO> cartProducts = service.selectCartProducts(loginUser.getUid());
			req.setAttribute("cartProducts", cartProducts);
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/product/cart.jsp");
			dispatcher.forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
	}
}
