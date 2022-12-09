package kr.co.kmarket1.service;

import kr.co.kmarket1.dao.OtherDAO;
import kr.co.kmarket1.vo.TermsVO;

public enum OtherService {
	INSTANCE;
	OtherDAO dao = OtherDAO.getInstance();
	
	public TermsVO selectTerms(String type) {
		return dao.selectTerms(type);
	}
	
}
