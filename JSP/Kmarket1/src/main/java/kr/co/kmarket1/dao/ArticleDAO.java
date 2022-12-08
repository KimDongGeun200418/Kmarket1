package kr.co.kmarket1.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.vo.CsArticleVO;

public class ArticleDAO {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	public List<CsArticleVO> selectArticles(){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectArticles...");
			
			
			
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	
	
}
