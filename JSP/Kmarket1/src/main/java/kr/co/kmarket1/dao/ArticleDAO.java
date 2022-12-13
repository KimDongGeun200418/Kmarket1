package kr.co.kmarket1.dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.kmarket1.db.DBHelper;
import kr.co.kmarket1.db.Sql;
import kr.co.kmarket1.vo.CsArticleVO;

public class ArticleDAO extends DBHelper{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private ArticleDAO() {}
	
	public List<CsArticleVO> selectNotice(String cate, int start){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_NOTICE);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setNo(rs.getString(1));
				article.setTitle(rs.getString(2));
				article.setRdate(rs.getString(3));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public List<CsArticleVO> selectAllNotice(int start){
		
		List<CsArticleVO> articles = new ArrayList<>();
		
		try {
			logger.info("selectAllNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ALL_NOTICE);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setNo(rs.getString(1));
				article.setTitle(rs.getString(2));
				article.setRdate(rs.getString(3));
				
				articles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return articles;
	}
	
	public CsArticleVO selectArticleNotice(String no){
		
		 CsArticleVO article = null;
		
		try {
			logger.info("selectArticleNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLE_NOTICE);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				article = new CsArticleVO();
				article.setTitle(rs.getString(1));
				article.setRdate(rs.getString(2).substring(0, 10));
				article.setContent(rs.getString(3));
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return article;
	}
	
	
	//게시물 카운트
	public int selectCountNotice(String cate) {
		
		int total = 0;
		
		try {
			logger.info("selectCountNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_COUNT_NOTICE);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return total;
	}
	public int selectCountNoticeAll() {
		
		int total = 0;
		
		try {
			logger.info("selectCountNoticeAll...");
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_COUNT_NOTICE_ALL);
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return total;
	}

	
}
