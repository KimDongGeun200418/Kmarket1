package kr.co.kmarket1.service;

import java.util.List;

import kr.co.kmarket1.dao.ArticleDAO;
import kr.co.kmarket1.vo.CsArticleVO;

public enum ArticleService {
	
	INSTANCE;
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	
	
	public int getCurrentPage(String pg) {
		int currentPage = 1;
		
		if(pg != null) {
			currentPage = Integer.parseInt(pg);
		}
		return currentPage;
	}
	
	
}
