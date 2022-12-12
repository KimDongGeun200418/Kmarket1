package kr.co.kmarket1.service;

import kr.co.kmarket1.dao.MemberDAO;
import kr.co.kmarket1.vo.MemberVO;

public enum MemberService {
	INSTANCE;
	MemberDAO dao = MemberDAO.getInstance();
	
	public void registerMemberId(MemberVO member){
		dao.insertMember(member);
	}
}
