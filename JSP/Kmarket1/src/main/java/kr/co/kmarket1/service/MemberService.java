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
	
	public String checkUid(String uid) {
		JsonObject json = new JsonObject();
		json.addProperty("result", dao.checkUid(uid));
		return json.toString();
	}
}
