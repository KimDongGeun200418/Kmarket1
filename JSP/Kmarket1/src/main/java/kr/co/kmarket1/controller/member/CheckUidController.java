package kr.co.kmarket1.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.MemberService;

@WebServlet("/member/checkUid.do")
public class CheckUidController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	MemberService serviceMember = MemberService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String result = serviceMember.checkUid(uid);
		resp.getWriter().print(result);
	}
	
}
