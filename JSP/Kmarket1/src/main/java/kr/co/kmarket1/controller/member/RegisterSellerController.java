package kr.co.kmarket1.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kmarket1.service.MemberService;
import kr.co.kmarket1.vo.MemberVO;

@WebServlet("/member/registerSeller.do")
public class RegisterSellerController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	MemberService serviceMember = MemberService.INSTANCE;
	
	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/registerSeller.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("km_uid");
		String pass = req.getParameter("km_pass1");
		String kms_name = req.getParameter("kms_name");
		String kms_gender = req.getParameter("kms_gender");
		String kms_company = req.getParameter("kms_company");
		String kms_ceo = req.getParameter("kms_ceo");
		String kms_corpReg = req.getParameter("kms_corpReg");
		String kms_onlineReg = req.getParameter("kms_onlineReg");
		String kms_tel = req.getParameter("kms_tel");
		String kms_fax = req.getParameter("kms_fax");
		String km_email = req.getParameter("km_email");
		String zip = req.getParameter("km_zip");
		String addr1 = req.getParameter("km_addr1");
		String addr2 = req.getParameter("km_addr2");
		String provLocation = req.getParameter("provLocation");
		String type = req.getParameter("type");
		String kms_manager = req.getParameter("kms_manager");
		String kms_managerHp = req.getParameter("kms_managerHp");
		
		MemberVO member = new MemberVO();
		member.setUid(uid);
		member.setPass(pass);
		member.setName(kms_name);
		member.setGender(kms_gender);
		member.setCompany(kms_company);
		member.setCeo(kms_ceo);
		member.setBizRegNum(kms_corpReg);
		member.setComRegNum(kms_onlineReg);
		member.setTel(kms_tel);
		member.setFax(kms_fax);
		member.setEmail(km_email);
		member.setZip(zip);
		member.setAddr1(addr1);
		member.setAddr2(addr2);
		member.setManager(kms_manager);
		member.setManagerHp(kms_managerHp);
		member.setRegip(req.getRemoteAddr());
		member.setProvLocation(provLocation);
		member.setType(type);
		
		serviceMember.registerSellerId(member);
		req.setAttribute("uid", member.getUid());
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/login.jsp");
		dispatcher.forward(req, resp);
	}
	
}
