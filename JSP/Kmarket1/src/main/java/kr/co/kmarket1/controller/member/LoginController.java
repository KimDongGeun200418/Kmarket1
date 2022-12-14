package kr.co.kmarket1.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.kmarket1.service.MemberService;
import kr.co.kmarket1.vo.MemberVO;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	MemberService serviceMember = MemberService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		MemberVO login = serviceMember.login(uid, pass);
		if(login != null){
			//회원 맞으면
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", login);
			resp.sendRedirect("/Kmarket1/index.do");
		}else {
			//회원 아니면
			resp.sendRedirect("/Kmarket1/member/login.do?success=100");		
		}
	}
	
}
