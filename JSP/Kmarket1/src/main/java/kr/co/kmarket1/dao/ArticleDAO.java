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
	
	public List<CsArticleVO> selectArticlesNotice(String cate, int start){
		
		List<CsArticleVO> noticeArticles = new ArrayList<>();
		
		try {
			logger.info("selectArticlesNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES_NOTICE);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setTitle(rs.getString(1));
				article.setRdate(rs.getString(2));
				
				noticeArticles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return noticeArticles;
	}
	
	public List<CsArticleVO> selectAllNotice(int start){
		
		List<CsArticleVO> notice = new ArrayList<>();
		
		try {
			logger.info("selectNotice...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES_NOTICE);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setTitle(rs.getString(1));
				article.setRdate(rs.getString(2));
				
				notice.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return notice;
	}
	
	public List<CsArticleVO> selectArticlesFaq(String cate, String cate2){
		
		List<CsArticleVO> faqArticles = new ArrayList<>();
		
		try {
			logger.info("selectArticlesFaq...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES_FAQ);
			psmt.setString(1, cate);
			psmt.setString(2, cate2);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setTitle(rs.getString(1));
				faqArticles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return faqArticles;
	}
	
	public List<CsArticleVO> selectArticlesQna(String cate, String cate2, int start){
		
		List<CsArticleVO> qnaArticles = new ArrayList<>();
		
		try {
			logger.info("selectArticlesQna...");
			
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ARTICLES_NOTICE);
			psmt.setString(1, cate);
			psmt.setString(2, cate2);
			psmt.setInt(2, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsArticleVO article = new CsArticleVO();
				article.setTitle(rs.getString(1));
				article.setUid(rs.getString(2));
				article.setRdate(rs.getString(3));
				
				qnaArticles.add(article);
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return qnaArticles;
	}
	
	//전체 게시물 카운트
	public int selectCountTotalNotice() {
		
		int total = 0;
		
		try {
			logger.info("selectCountTotalNotice...");
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_COUNT_TOTAL_NOTICE);
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return total;
	}
	public int selectCountTotalNoticeAll() {
		
		int total = 0;
		
		try {
			logger.info("selectCountTotalNoticeAll...");
			
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_COUNT_TOTAL_NOTICE_ALL);
			
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
