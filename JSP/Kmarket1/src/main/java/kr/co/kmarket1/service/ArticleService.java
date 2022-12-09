package kr.co.kmarket1.service;

import java.util.List;

import kr.co.kmarket1.dao.ArticleDAO;
import kr.co.kmarket1.vo.CsArticleVO;

public enum ArticleService {
	
	INSTANCE;
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	public List<CsArticleVO> selectArticles(String cate, int start) {
		return dao.selectArticles(cate, start);
	}
	
	
}
