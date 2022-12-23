package kr.co.kmarket1.service;

import com.google.gson.JsonObject;

import kr.co.kmarket1.dao.MemberDAO;
import kr.co.kmarket1.vo.MemberVO;

public enum MemberService {
	INSTANCE;
	MemberDAO dao = MemberDAO.getInstance();
	
	public void registerMemberId(MemberVO member){
		dao.insertMember(member);
	}
	public void registerSellerId(MemberVO member){
		dao.insertSeller(member);
	}
	
	public String checkUid(String uid) {
		JsonObject json = new JsonObject();
		json.addProperty("result", dao.checkUid(uid));
		return json.toString();
	}
	
	public MemberVO login(String uid, String pass) {
		return dao.selectMemberForLogin(uid, pass);
	}
	public MemberVO order(String uid) {
		return dao.selectMemberForOrder(uid);
	}
}
